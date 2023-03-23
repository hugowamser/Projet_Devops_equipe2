# Projet_Devops_equipe2
D.GUERFA A.MOUZE H.WAMSER 

## OBJECTIFS
. **Déployer un environnement** de virtualisation VMware Vsphere en interne : il a été convenu avec l'entreprise qu'au moins un hôte ESXi sera nécessaire pour le déploiement de l'infrastructure. - VMware Vsphere 

. Mettre en place des serveurs Linux (Ubuntu, CentOS, etc.) pour héberger les services de l'entreprise. (Blogs, Gitlab, etc.) : À vous de choisir le nombre de serveurs et la manière de déployer les services demandés. – Gestion de configuration (Ansible) -Docker

. Configurer un AD
. Configurer un DNS

. Mettre en place des solutions de **monitoring pour surveiller** l'état des machines virtuelles, des conteneurs, des réseaux, des serveurs, etc., et recevoir des alertes en cas de problème. (Stack Prometheus Grafana, Stack Telegraf influx Grafana, etc.)

→ Évaluation des besoins et planification : avant de déployer l'environnement, il est important d'évaluer les besoins de l'entreprise et de planifier en conséquence. Cela implique de déterminer les ressources matérielles et logicielles nécessaires, la configuration réseau requise, ainsi que la planification de la disponibilité et de la sécurité.

## CAHIER DES CHARGES
### Création d’un site web
Wordpress 
### Création d’un Git  
GitLab ou Gitea ? 
### Architecture 

IMAGES IMAGES IMAGES

. seau interne : (perspective reverse proxy pour la sécurité ?)
. Services :
o	Service de messagerie professionnels 
o	Service de sauvegarde et de restauration (Redondances ? ESXI)
o	Service de gestion de projet (Git sur le net) √
o	Service web
o	Service AD/DNS/DHCP √
o	Service Monithoring √
o	Service de base de données√
o	Service de sécurité

Machines :
1.	Windows Server - AD, DNS, DHCP

2.	Linux (Debian ou CentOs) - Ansible pour automatiser des mise à jour par exemple, installation, ou autre (playbook) - permet aussi l'installation d'agent sur les pc utilisateurs permettant de remonter les infos à Prometheus

3.	Linux (Debian ou CentOs) - Docker 3 conteneurs pour un site :

-	Middle War (pour les développeurs souvent Tomcat utilisé)
-	Le Front (aspect esthétique du site)
-	Base de donnée (mysql,postgresql..)

4.	Linux (Debian ou CentOs) - Prometheus (moteur permettant de récupérer des données tel que l'espace, la RAM, la dernière connexion, la saturation, base de données...) - long et délicat à configurer - Grafana (récupérer les infos de Prometheus de manière graphique)
5.	Base de donnée 
6.	Windows Clientes

…


## Documentation 
### Prérequis logiciels ou matériels 
## Outils – techno utilisés
Présentation de l’outils, Procédure d’installation, (toute autre procédure tel que le déploiement par exemple du docker)
### Vmware - Vsphere : (Vcenter et min un ESXI)

-	Sélection des composants VMware : pour le déploiement d'un environnement de virtualisation VMware, un ou plusieurs hôtes ESXi, ainsi que d'un serveur vCenter pour la gestion centralisée.
-	Installation de l'hôte ESXi sur un serveur physique dédié en vérifiant que le serveur répond aux exigences de configuration matérielle minimale requise pour l'installation d'ESXi.
-	Configuration de l'hôte ESXi : une fois l'installation terminée, configuration des paramètres de base tels que le nom de l'hôte, l'adresse IP, le DNS, le réseau de stockage, etc
-	Installation du serveur vCenter : installation du serveur vCenter sur un serveur dédié en vérifiant que le serveur répond aux exigences de configuration matérielle minimale requise pour l'installation de vCenter.
-	Configuration du serveur vCenter : une fois l'installation terminée, configuration des paramètres de base tels que le nom du serveur, l'adresse IP, le DNS, le réseau de stockage, etc.
-	Création d'un cluster ESXi : utilisez vCenter pour créer un cluster ESXi et ajout joutez l'hôte ESXi à ce cluster
-	Configuration des options de stockage : configuration des options de stockage dans vCenter, telles que la création de datastores, pour stocker les machines virtuelles.
-	Déploiement des machines virtuelles : vCenter pour créer et déployer les machines virtuelles nécessaires pour exécuter les applications de l'entreprise, telles que WordPress ou GitLab
-	Configuration de la surveillance : pour surveiller les performances et l'état de l'environnement, configuration des options de surveillance dans vCenter.
-	Sécurisation de l'environnement : pour sécuriser l'environnement, vérification mises à jour de sécurité sont appliquées régulièrement et des politiques de sécurité sont mises en place pour les machines virtuelles et l'accès à l'environnement.
-	Configuration des sauvegardes : pour protéger les données et les machines virtuelles contre les pannes matérielles ou les erreurs humaines, configuration des options de sauvegarde dans vCenter.


·         Solution professionnelle de virtualisation
·         Permet de gérer des machines virtuelles
·         Réduire les coûts liés à l'achat de matériel (créer plusieurs machines virtuelles sur un seul serveur physique)
·          Réduire les temps d'arrêt (déplacer les machines virtuelles en toute sécurité d'un serveur physique à un autre)
·          D'autres solutions de virtualisation, telles que VirtualBox ou Hyper-V de Microsoft, peuvent également être envisagées en fonction des besoins spécifique


### Ansible
Pas vagrante car ???
Pas jenkings car ???
Gestion de configuration : 
·         Ansible est un outil open-source de gestion de configuration
·         Permet de déployer rapidement des serveurs, d'automatiser les tâches récurrentes et de maintenir la cohérence de la configuration des serveurs
·         Ansible utilise une syntaxe simple et facile à comprendre pour décrire les tâches à effectuer sur les serveurs

### Docker
Prometheus & Grafana
	-Pourquoi Prometheus : Grosse Communauté et légé
### Gitlab : 
·         Permet de gérer les dépôts Git, de gérer les projets, de suivre les problèmes et de collaborer sur le code. Permet de stocker le code source des applications et de gérer les versions
·         Collaborer avec d'autres membres de l'équipe

## Services
### Service de messagerie professionnelle 
qui permettra aux employés de communiquer efficacement entre eux et avec les clients mais d’assurer une certaine sécurité dans ces échanges
Service de sauvegarde et de restauration des données 
les entreprises doivent être en mesure de protéger leurs données critiques et de les récupérer en cas de perte ou de sinistre. Des solutions comme Veeam ou Acronis peuvent être envisagées.
### Service de gestion de projet :
Gitlab
### Service web : 
création et hébergement d’un site web/blog sur WordPress hébergé en interne, sécurisé (protocole HTTPS), evolutif via docker et ansible ????

 ### AD/DNS 
●	Configurer un Active Directory pour l'authentification des utilisateurs.

-	Renommer le PC (exemple : SOMILY-AD01)
-	Attribution IP FIXE
-	Création des OUs
-	Création des membres de chaque OU
-	Installation et configuration d’un serveur AD secondaire RODC
-	Mise en place et planification de réplications (fréquence, coût pour définir les priorités), commande pour vérifier l’état de réplication : repadmin /showrepl 
-	Mise en place de GPOs personnalisées en fonction des services :
Service Développement (10 personnes)
-
-

Service Production (5personnes)
-
-

Service Support (5 personnes)
-
-

### AD/DNS :
·         Active Directory est un service d'annuaire développé par Microsoft pour gérer l'authentification des utilisateurs et des ordinateurs
·         Permet de centraliser l'administration des comptes d'utilisateurs et de définir des politiques de sécurité pour l'ensemble du réseau
·         DNS est un service qui permet de résoudre les noms de domaine en adresses IP
·         Solutions open-source telles que Samba pour mettre en place un service Active Directory sur des serveurs Linux, et Bind pour mettre en place un service DNS
·         Configurer un serveur DNS pour la résolution des noms de domaine.



●	Configurer un serveur DNS pour la résolution des noms de domaine.

Serveur DNS via AD ou configuration DNS sur LINUX ??????


### DHCP

### Monitoring : 
·         Prometheus et Grafana sont deux solutions open-source de monitoring populaires
·         Prometheus est un outil de surveillance de la performance qui collecte des données sur les ressources système, les applications et les services
·         Grafana est une plateforme de visualisation de données qui permet de créer des tableaux de bord et des graphiques pour visualiser les données collectées par #### Prometheus
·         Telegraf et InfluxDB sont une autre paire de solutions de surveillance qui peuvent être utilisées pour surveiller les machines virtuelles, les conteneurs et #### les réseaux
·         Telegraf collecte les données de performance et les envoie à InfluxDB pour stockage et analyse


●	Mettre en place des solutions de monitoring pour surveiller l'état des machines virtuelles, des conteneurs, des réseaux, des serveurs, etc., et recevoir des alertes en cas de problème. (Stack, Prometheus Grafana, Stack Telegraf influx Grafana, etc.)

Service de base de donnée 
Service de sécurité ? 

## Perspectives 

### Services supplémentaires  :

- **Alertmanager** permettant de recevoir des notifications par mail, teams etc sur les alertes de prometheus

- **Apache (Kafka)** *est une plateforme distribuée de diffusion de données en continu, capable de publier, stocker, traiter et souscrire à des flux d'enregistrement en temps réel -solution Open Source de diffusion de données en continu capable de répondre aux divers besoins des entreprises-*

- **Cybersécurité**
  
  - **Qualys patch management** permet de patcher les serveurs d'ils sont en vulnérailité
  - **Un antivirus : ex Mcafee**
  - **System Center Data Protection Manager (DPM)** outil de backup de microsoft ou **Veeam** *-mais payant-*

- **Elastic et Kibana** monitorer tous ce qui est log, moteur de recherche et d'analyse **-suite ELK**

- **Mondo dB** Base de donnée
- **Sheduler** permet de configurer et de planifier des taches -automatisation- selon critères définit 


Redondances des VM permettant une reprise d’activité immédiate en cas de panne
Plusieurs ESXI permettant la redondances en cas de panne d’une VM avec un services (doublé chaque VM ayant un service ? )


