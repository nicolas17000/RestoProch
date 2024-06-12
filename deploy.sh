#!/bin/bash

# Vérifie si une paire de clés SSH existe déjà
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Génération d'une nouvelle paire de clés SSH..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
    echo "Clé SSH générée."
else
    echo "Une paire de clés SSH existe déjà."
fi

# Vérifie si le répertoire Terraform existe
if [ -d "./terraform" ]; then
    cd terraform
else
    echo "Le répertoire Terraform n'existe pas. Assurez-vous que l'arborescence est correcte."
    exit 1
fi

# Étape 1: Initialiser et appliquer Terraform
echo "Initialisation de Terraform..."
terraform init

echo "Application de la configuration Terraform..."
terraform apply -auto-approve

# Étape 2: Extraire les adresses IP et générer le fichier d'inventaire Ansible
echo "Extraction des adresses IP des serveurs..."
FRONTEND_IPS=$(terraform output -json frontend_ips | jq -r '.[]')
BACKEND_IPS=$(terraform output -json backend_ips | jq -r '.[]')
LB_IPS1=$(terraform output -json lb_ips | jq -r '.[0]')
LB_IPS2=$(terraform output -json lb_ips | jq -r '.[1]')
SUPERVISION_IPS=$(terraform output -json supervision_ips | jq -r '.[]')
BDD=$(terraform output -json bdd_ips | jq -r '.[0]')

# Copie de la clé publique sur chaque serveur
echo "Copie de la clé publique SSH sur les serveurs..."
for ip in $FRONTEND_IPS; do
  ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no adminuser@$ip
done
for ip in $BACKEND_IPS; do
  ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no adminuser@$ip
done

ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no adminuser@$LB_IPS1
ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no adminuser@$LB_IPS2

for ip in $SUPERVISION_IPS; do
  ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no adminuser@$ip
done

ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no adminuser@$BDD


# Supprime le fichier d'inventaire Ansible s'il existe
if [ -f "../ansible/inventory" ]; then
    echo "Suppression du fichier d'inventaire Ansible existant..."
    rm ../ansible/inventory
fi


# Génération du fichier d'inventaire Ansible
echo "Génération du fichier d'inventaire Ansible..."

echo "[frontend]" >> ../ansible/inventory

frontend_counter=1
for ip in $FRONTEND_IPS; do
  echo "$ip ansible_ssh_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa server_number=$frontend_counter" >> ../ansible/inventory
  frontend_counter=$((frontend_counter + 1))
done

echo "[backend]" >> ../ansible/inventory

backend_counter=1
for ip in $BACKEND_IPS; do
  echo "$ip ansible_ssh_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa server_number=$backend_counter" >> ../ansible/inventory
  backend_counter=$((backend_counter + 1))
done

echo "[supervision]" >> ../ansible/inventory

supervision_counter=1
for ip in $SUPERVISION_IPS; do
  echo "$ip ansible_ssh_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa server_number=$supervision_counter" >> ../ansible/inventory
  supervision_counter=$((supervision_counter + 1))
done

# Groupe lb_frontend
echo "[lb_frontend]" >> ../ansible/inventory
echo "$LB_IPS1 ansible_ssh_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa server_number=1" >> ../ansible/inventory

# Groupe lb_backend
echo "[lb_backend]" >> ../ansible/inventory
echo "$LB_IPS2 ansible_ssh_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa server_number=1" >> ../ansible/inventory

# Groupe lb_backend
echo "[bdd]" >> ../ansible/inventory
echo "$BDD ansible_ssh_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa server_number=1" >> ../ansible/inventory

# Interpreteur Python
echo "[all:vars]" >> ../ansible/inventory
echo "ansible_python_interpreter=/usr/bin/python3" >> ../ansible/inventory

echo "Fichier d'inventaire Ansible généré."

# Étape 3: Exécuter le playbook Ansible
cd ../ansible
echo "Configuration de l'infrastructure avec Ansible..."
ansible-playbook -i inventory playbook.yml