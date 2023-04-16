# Projet_Devops_equipe2

D.GUERFA A.MOUZE S.TOUAHRI H.WAMSER 

## OBJECTIFS

- **Déployer un environnement** de virtualisation VMware Vsphere en interne : un hôte ESXi sera nécessaire pour le déploiement de l'infrastructure. - VMware Vsphere.
- Mise en place de **serveurs d'hébergement** sous Linux (Ubuntu, CentOS, etc.) pour les services.
- Configuration de serveurs avec **Ansible, Docker**.
- Configuration d'un **AD** pour l'authentification des utilisateurs.
- Configuration d'un **DNS** pour la résolution de domaine.
- **Monitoring** : surveiller l'état des VM, conteneurs, réseaux... et recevoir des alertes.

---

## Prérequis logiciels et/ou matériels :

---

## Documentation

### Outils – techno utilisés

Présentation de l’outils, Procédure d’installation, (toute autre procédure tel que le déploiement par exemple du docker)

#### **Vmware - Vsphere : (Vcenter et minimum un ESXI)**

-	Configuration d'un serveur vCenter : 
-	Création d'un cluster ESXi : 
-	Déploiement des machines virtuelles : **Vagrantfiles** pour créer et déployer les machines virtuelles nécessaires 
-	Configuration de la surveillance : pour surveiller les performances et l'état de l'environnement, configuration des options de surveillance dans vCenter.
-	Sécurisation de l'environnement : pour sécuriser l'environnement, vérification mises à jour de sécurité sont appliquées régulièrement et des politiques de sécurité sont mises en place pour les machines virtuelles et l'accès à l'environnement.
-	Configuration des sauvegardes : pour protéger les données et les machines virtuelles contre les pannes matérielles ou les erreurs humaines, configuration des options de sauvegarde dans vCenter.


#### **Ansible**

Ansible est un outil open-source de gestion de configuration. Il permet de déployer rapidement des serveurs, d'automatiser les tâches récurrentes et de maintenir la cohérence de la configuration des serveurs.
Ansible utilise une syntaxe simple et facile à comprendre pour décrire les tâches à effectuer sur les serveurs.

#### **Docker**




### Services


#### AD/DNS 
 
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


·         Active Directory est un service d'annuaire développé par Microsoft pour gérer l'authentification des utilisateurs et des ordinateurs
·         Permet de centraliser l'administration des comptes d'utilisateurs et de définir des politiques de sécurité pour l'ensemble du réseau
·         DNS est un service qui permet de résoudre les noms de domaine en adresses IP
·         Solutions open-source telles que Samba pour mettre en place un service Active Directory sur des serveurs Linux, et Bind pour mettre en place un service DNS
·         Configurer un serveur DNS pour la résolution des noms de domaine.



●	Configurer un serveur DNS pour la résolution des noms de domaine.

Serveur DNS via AD ou configuration DNS sur LINUX ??????


#### DHCP


#### **Site web - Wordpress**

Création et hébergement d’un site web/blog sur WordPress hébergé en interne, sécurisé (protocole HTTPS), evolutif via docker et ansible.

#### **Base de donnée - MySQL

**PhPmyAdmin**

#### **Nginx**

#### **Git**  

GitLab ou Gitea ? 
Gitea open source et gratuit

#### Monitoring 

Prometheus et Grafana sont deux solutions open-source de monitoring populaires ayant donc une grande communauté.

- **Prometheus** : Prometheus est un outil de surveillance de la performance qui collecte des données sur les ressources système, les applications et les services
- **Grafana** :  Grafana est une plateforme de visualisation de données qui permet de créer des tableaux de bord et des graphiques pour visualiser les données collectées par

**NodeExporter**

**Cadvisor**


---

### Plan de reprise d'activité (PRA)

1. Présentation des différents scénarios de sinistre majeur.

- Épidémie tels que la crise sanitaire du Coronavirus
- Catastrophe naturelle, par exemple une inondation
- Incendie
- Panne du système dû au virus, au cyberattaque, au cybercrime, à la perte, au vol ou à la disparition de données sensible.

2. Mise en place d'un plan de reprise d'activité (PRA)

Pour garantir la continuité de l’activité en cas de sinistre il est nécessaire d’établir un plan de reprise d’activité (PRA). Dans un PRA on retrouve plusieurs éléments notamment :

- Vérification des normes et de la réglementation.
- Définir les responsabilités de chacun dans la réalisation du plan de reprise d'activités
- Réaliser un inventaire des outils informatiques
- Construction d'un cahier des charges avec des précisions sur les applications informatiques critiques.
- Prévoir un budget adéquat pour le plan de reprise d'activités.
- Identification du système de secours à mettre en place en cas de sinistre (site de secours).
- Choisir un modèle de sauvegarde de données.
- Prévoir des mesures de mises à jour régulières pour tester le plan de reprise d'activités .

3. Présentation des solutions de reprise d'activité

Les machines virtuelles que nous déployons proviennent de la plateforme VMware vSphere. Celle-ci propose des solutions de reprise d'activité après un sinistre ou un incident à l'aide de différents produits :

- ``VMware Cloud Disaster Recovery`` est un service à la demande. Il permet un stockage des données de l'entreprise en les répliquant sur une infrastructure cloud distante.

- ``VMware Site Recovery`` est un service proposant une protection des charges de travail en local et sur le cloud. Cela consiste en une réplication des applications ainsi que des données sur un site de reprise.

- ``Site Recovery Manager`` est disponible sous forme de licence ou de service afin de fournir une automatisation pour la récupération d'applications et de données.

Ces produits sont compris dans le VMware DRaaS (Disaster Recovery as a Service). Ils sont un réel avantage pour l'entreprise car ils réduisent le temps d'arrêt après un sinistre ou un incident, tout en minimisant la perte de données. 

---

## Perspectives 

### Services supplémentaires :

- **Alertmanager** permettant de recevoir des notifications par mail, teams etc sur les alertes de prometheus

- **Apache (Kafka)** *est une plateforme distribuée de diffusion de données en continu, capable de publier, stocker, traiter et souscrire à des flux d'enregistrement en temps réel -solution Open Source de diffusion de données en continu capable de répondre aux divers besoins des entreprises-*

- **Cybersécurité**
  
  - **Qualys patch management** permet de patcher les serveurs d'ils sont en vulnérailité
  - **Un antivirus : ex Mcafee**
  - **System Center Data Protection Manager (DPM)** outil de backup de microsoft ou **Veeam** *-mais payant-*

- **Elastic et Kibana** monitorer tous ce qui est log, moteur de recherche et d'analyse **-suite ELK**

- **Sheduler** permet de configurer et de planifier des taches -automatisation- selon critères définit 


Redondances des VM permettant une reprise d’activité immédiate en cas de panne
Plusieurs ESXI permettant la redondances en cas de panne d’une VM avec un services (doublé chaque VM ayant un service ? )

---

## Bibliographie

1. Machtelt Garrels, MG. (2002 - 2006). Un guide pratique. Introduction à Linux. https://linux.die.net/Intro-Linux/
2. Diane Greene, Edouard Bugnion, Scott Devine, Mendel Rosenblum et Edward Wang, DG. *et al.* (1998 - 2023). Documentation de VMware vSphere. VMware Docs. https://docs.vmware.com/fr/VMware-vSphere/index.html
3. Cesar de la Torre, Bill Wagner et Mike Rousos, CT. *et al.* (2022). Microsoft. .NET : Architecture pour les applications .NET en conteneur.  https://dotnet.microsoft.com/en-us/download/e-book/microservices-architecture/pdf
4. Solomon Hykes, SH. (2013 - 2023). Docker docs. https://docs.docker.com/
5. Michael DeHaan, MD. (2023). Documentation. Ansible Documentation. https://docs.ansible.com/ansible/latest/index.html
6. Microsoft. (2008 - 2023). Documents GitHub - De l’aide où que vous soyez dans votre parcours GitHub. Documents GitHub. https://docs.github.com/en/get-started/quickstart/hello-world
7. SoundCloud. (2014 - 2023). Prometheus. Overview | Prometheus. https://prometheus.io/docs/introduction/overview/
8. Torkel Ödegaard, TO. (2014 - 2023). Grafana. Grafana Labs. https://grafana.com/docs/grafana/latest/introduction/
9. Matthew Mullenweg et Mike Little, MM et ML. (2003 - 2023). Documentation. WordPress.org Documentation. https://wordpress.org/documentation/
10. Microsoft. (2012 - 2022). Vue d’ensemble des services de domaine Active Directory. https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview
11. Microsoft. (2021 - 2023). Système de noms de domaine (DNS). https://learn.microsoft.com/en-us/windows-server/networking/dns/dns-top
12. C-Risk. (2021 - 2023). Plan de reprise d'activité. PRA : tout savoir sur le plan de reprise d'activité : https://www.c-risk.com/fr/blog/pra-plan-de-reprise-activite/
13. Diane Greene, Edouard Bugnion, Scott Devine, Mendel Rosenblum et Edward Wang, DG. *et al.* (1998 - 2023). Solutions de reprise d’activité. VMware Docs. https://www.vmware.com/fr/solutions/disaster-recovery.html


