# RestoProch Glossaire technique 

## Ansible
- **Ansible** : Un outil open-source pour l'automatisation des tâches de gestion de configuration, de déploiement d'applications et d'orchestration de services.

### Modules et Directives Ansible
- **apt** : Module Ansible pour gérer les paquets avec le gestionnaire de paquets `apt` sur les systèmes basés sur Debian.
- **systemd** : Module Ansible pour gérer les services systemd.
- **service** : Module Ansible pour gérer les services de manière générique (fonctionne avec systemd et init.d).
- **template** : Module Ansible pour gérer les fichiers de configuration à partir de modèles Jinja2.
- **copy** : Module Ansible pour copier des fichiers simples.
- **cron** : Module Ansible pour gérer les tâches cron.
- **set_fact** : Directive Ansible pour définir des variables pendant l'exécution.
- **include_role** : Directive Ansible pour inclure un rôle dans un playbook.

### Concepts et Services Linux
- **Service** : Un programme ou un ensemble de programmes qui s'exécute en arrière-plan sur un système d'exploitation.
- **SNMP** : Simple Network Management Protocol, un protocole utilisé pour la gestion des équipements réseau.
- **NRPE** : Nagios Remote Plugin Executor, un outil pour exécuter des plugins Nagios sur des machines distantes.
- **UFW** : Uncomplicated Firewall, un programme pour gérer le pare-feu sous Linux.
- **Nginx** : Un serveur web et proxy inverse léger.
- **MariaDB** : Un système de gestion de base de données relationnelle, fork de MySQL.
- **HAProxy** : Un logiciel open-source de répartition de charge et proxy pour TCP et HTTP.

### Commandes et Fichiers de Configuration
- **ufw reload** : Commande pour recharger la configuration UFW sans redémarrer le service.
- **nginx.conf** : Fichier de configuration principal pour Nginx.
- **index.html** : Page HTML par défaut servie par un serveur web.
- **haproxy.cfg** : Fichier de configuration principal pour HAProxy.
- **/etc/snmp/snmpd.conf** : Fichier de configuration principal pour le démon SNMP.
- **snapshot_db.sh** : Script de sauvegarde pour une base de données.

### Directives de Configuration
- **global (HAProxy)** : Section de configuration globale pour HAProxy, définit les paramètres appliqués à toutes les instances.
- **defaults (HAProxy)** : Section de configuration par défaut pour HAProxy, appliquée à toutes les sections frontend et backend.
- **frontend (HAProxy)** : Section définissant les paramètres d'entrée de HAProxy, comme les adresses IP et les ports à écouter.
- **backend (HAProxy)** : Section définissant les paramètres de sortie de HAProxy, comme les serveurs à balancer la charge.

### Autres Concepts et Paramètres
- **log** : Directive pour définir les paramètres de journalisation (logs).
- **bind** : Directive pour lier un service à une adresse IP et un port spécifiques.
- **mode** : Directive pour définir le mode de fonctionnement (HTTP, TCP) d'un service.
- **timeout** : Paramètre définissant le délai avant l'expiration d'une connexion.
- **errorfile** : Fichier HTML à afficher pour une erreur HTTP spécifique.
- **balance** : Algorithme de répartition de charge utilisé par HAProxy.
- **forwardfor** : Option HAProxy pour ajouter l'adresse IP du client dans les en-têtes HTTP.
- **httpchk** : Option HAProxy pour vérifier la santé des serveurs backend en utilisant des requêtes HTTP.

### Variables et Boucles
- **vars** : Section dans Ansible pour définir des variables spécifiques.
- **with_items** : Directive Ansible pour effectuer une boucle sur une liste d'éléments.
- **loop** : Nouvelle directive Ansible (remplace `with_items`) pour effectuer des boucles.
- **groups** : Variable Ansible qui contient les groupes d'hôtes définis dans l'inventaire.
- **hostvars** : Variable Ansible qui contient toutes les variables d'hôte disponibles.

## Terraform
- **Terraform** : Un outil d'infrastructure en tant que code (IaC) pour créer, modifier et améliorer en toute sécurité l'infrastructure.

### Fournisseur et Configurations
- **provider "azurerm"** : Fournisseur Terraform pour Azure Resource Manager, permettant de gérer les ressources Azure.
- **features** : Configuration spécifique au fournisseur pour activer ou désactiver des fonctionnalités.

### Ressources et Modules
- **resource** : Une unité de base de configuration dans Terraform représentant une infrastructure physique ou virtuelle.
- **module** : Un conteneur pour plusieurs ressources qui sont utilisés ensemble. Permet de regrouper et réutiliser des configurations.

### Types de Ressources Azure
- **azurerm_resource_group** : Groupe de ressources dans Azure, utilisé pour gérer et organiser les ressources Azure.
- **azurerm_virtual_network** : Réseau virtuel Azure, une représentation logique de votre réseau sur Azure.
- **azurerm_subnet** : Sous-réseau dans un réseau virtuel Azure, permet de segmenter le réseau virtuel en plusieurs réseaux plus petits.
- **azurerm_public_ip** : Adresse IP publique allouée pour les ressources Azure, utilisée pour permettre l'accès public aux ressources.
- **azurerm_network_interface** : Interface réseau attachée à une machine virtuelle, permet la communication réseau.
- **azurerm_virtual_machine** : Machine virtuelle dans Azure, représente une instance de serveur virtuel.
- **azurerm_network_security_group** : Groupe de sécurité réseau, utilisé pour définir des règles de sécurité pour contrôler le trafic réseau entrant et sortant.

### Blocs de Configuration des Ressources
- **name** : Nom de la ressource.
- **location** : Région Azure où la ressource sera déployée.
- **resource_group_name** : Nom du groupe de ressources auquel la ressource appartient.
- **allocation_method** : Méthode d'allocation pour l'adresse IP (Static ou Dynamic).
- **ip_configuration** : Configuration IP d'une interface réseau.
- **subnet_id** : Identifiant du sous-réseau auquel l'interface réseau est attachée.
- **private_ip_address_allocation** : Méthode d'allocation de l'adresse IP privée (Static ou Dynamic).
- **public_ip_address_id** : Identifiant de l'adresse IP publique associée.
- **network_interface_ids** : Liste des identifiants des interfaces réseau attachées à la machine virtuelle.
- **vm_size** : Taille de la machine virtuelle, définissant les ressources CPU et RAM.
- **storage_os_disk** : Configuration du disque OS de la machine virtuelle.
- **storage_image_reference** : Référence à l'image du système d'exploitation à utiliser pour la machine virtuelle.
- **os_profile** : Profil du système d'exploitation, incluant le nom de l'ordinateur et les informations d'authentification.
- **os_profile_linux_config** : Configuration spécifique pour les machines virtuelles Linux.

### Règles de Sécurité
- **security_rule** : Une règle dans un groupe de sécurité réseau définissant le trafic autorisé ou refusé.
- **priority** : Priorité de la règle, les nombres plus bas ont une priorité plus haute.
- **direction** : Direction du trafic (Inbound ou Outbound).
- **access** : Type d'accès (Allow ou Deny).
- **protocol** : Protocole de la règle (Tcp, Udp, ou * pour tous les protocoles).
- **source_port_range** : Plage de ports source autorisés.
- **destination_port_range** : Plage de ports de destination autorisés.
- **source_address_prefix** : Préfixe d'adresse source autorisée.
- **destination_address_prefix** : Préfixe d'adresse de destination autorisée.

### Variables et Sorties
- **variable** : Déclaration d'une valeur configurable dans Terraform, permettant de paramétrer les configurations.
- **description** : Description de la variable, expliquant son usage.
- **type** : Type de donnée de la variable (string, number, bool, etc.).
- **default** : Valeur par défaut de la variable si aucune valeur n'est fournie.
- **output** : Déclaration de sortie dans Terraform, permettant d'exporter des valeurs après l'application de la configuration.
- **value** : Valeur de la sortie, souvent une référence à une ressource ou à une donnée générée pendant l'exécution.
