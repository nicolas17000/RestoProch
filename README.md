# RestoProch Glossaire technique 
Ansible
•	Ansible : Un outil open-source pour l'automatisation des tâches de gestion de configuration, de déploiement d'applications et d'orchestration de services.
Modules et Directives Ansible
•	apt : Module Ansible pour gérer les paquets avec le gestionnaire de paquets apt sur les systèmes basés sur Debian.
•	systemd : Module Ansible pour gérer les services systemd.
•	service : Module Ansible pour gérer les services de manière générique (fonctionne avec systemd et init.d).
•	template : Module Ansible pour gérer les fichiers de configuration à partir de modèles Jinja2.
•	copy : Module Ansible pour copier des fichiers simples.
•	cron : Module Ansible pour gérer les tâches cron.
•	set_fact : Directive Ansible pour définir des variables pendant l'exécution.
•	include_role : Directive Ansible pour inclure un rôle dans un playbook.
Concepts et Services Linux
•	Service : Un programme ou un ensemble de programmes qui s'exécute en arrière-plan sur un système d'exploitation.
•	SNMP : Simple Network Management Protocol, un protocole utilisé pour la gestion des équipements réseau.
•	NRPE : Nagios Remote Plugin Executor, un outil pour exécuter des plugins Nagios sur des machines distantes.
•	UFW : Uncomplicated Firewall, un programme pour gérer le pare-feu sous Linux.
•	Nginx : Un serveur web et proxy inverse léger.
•	MariaDB : Un système de gestion de base de données relationnelle, fork de MySQL.
•	HAProxy : Un logiciel open-source de répartition de charge et proxy pour TCP et HTTP.
Commandes et Fichiers de Configuration
•	ufw reload : Commande pour recharger la configuration UFW sans redémarrer le service.
•	nginx.conf : Fichier de configuration principal pour Nginx.
•	index.html : Page HTML par défaut servie par un serveur web.
•	haproxy.cfg : Fichier de configuration principal pour HAProxy.
•	/etc/snmp/snmpd.conf : Fichier de configuration principal pour le démon SNMP.
•	snapshot_db.sh : Script de sauvegarde pour une base de données.
Directives de Configuration
•	global (HAProxy) : Section de configuration globale pour HAProxy, définit les paramètres appliqués à toutes les instances.
•	defaults (HAProxy) : Section de configuration par défaut pour HAProxy, appliquée à toutes les sections frontend et backend.
•	frontend (HAProxy) : Section définissant les paramètres d'entrée de HAProxy, comme les adresses IP et les ports à écouter.
•	backend (HAProxy) : Section définissant les paramètres de sortie de HAProxy, comme les serveurs à balancer la charge.
Autres Concepts et Paramètres
•	log : Directive pour définir les paramètres de journalisation (logs).
•	bind : Directive pour lier un service à une adresse IP et un port spécifiques.
•	mode : Directive pour définir le mode de fonctionnement (HTTP, TCP) d'un service.
•	timeout : Paramètre définissant le délai avant l'expiration d'une connexion.
•	errorfile : Fichier HTML à afficher pour une erreur HTTP spécifique.
•	balance : Algorithme de répartition de charge utilisé par HAProxy.
•	forwardfor : Option HAProxy pour ajouter l'adresse IP du client dans les en-têtes HTTP.
•	httpchk : Option HAProxy pour vérifier la santé des serveurs backend en utilisant des requêtes HTTP.
Variables et Boucles
•	vars : Section dans Ansible pour définir des variables spécifiques.
•	with_items : Directive Ansible pour effectuer une boucle sur une liste d'éléments.
•	loop : Nouvelle directive Ansible (remplace with_items) pour effectuer des boucles.
•	groups : Variable Ansible qui contient les groupes d'hôtes définis dans l'inventaire.
•	hostvars : Variable Ansible qui contient toutes les variables d'hôte disponibles.

Terraform
•	Terraform : Un outil d'infrastructure en tant que code (IaC) pour créer, modifier et améliorer en toute sécurité l'infrastructure.
Fournisseur et Configurations
•	provider "azurerm" : Fournisseur Terraform pour Azure Resource Manager, permettant de gérer les ressources Azure.
•	features : Configuration spécifique au fournisseur pour activer ou désactiver des fonctionnalités.
Ressources et Modules
•	resource : Une unité de base de configuration dans Terraform représentant une infrastructure physique ou virtuelle.

