<center>

# Projet_Devops_equipe2

*D.GUERFA A.MOUZE S.TOUAHRI H.WAMSER*

</center>

[TOC]

## Problématique

*Comment faire pour que l'entreprise SOMILY puisse évoluer en terme de services ?*

____

## Objectifs

- **Déployer un environnement** de virtualisation VMware Vsphere en interne : un hôte ESXi sera nécessaire pour le déploiement de l'infrastructure. - VMware Vsphere.
- Mise en place de **serveurs d'hébergement** sous Linux (Ubuntu, CentOS, etc.) pour les services.
- Configuration de serveurs avec **Ansible, Docker**.
- Configuration d'un **AD** pour l'authentification des utilisateurs.
- Configuration d'un **DNS** pour la résolution de domaine.
- **Monitoring** : surveiller l'état des VM, conteneurs, réseaux... et recevoir des alertes.


## Prérequis logiciels et/ou matériels

- Un hôte **ESXi** pour le déploiement de l'infrastructure.
- Création de **5 vswitchs**.
- **VMs Ubuntu** : 2048 Mo de RAM / 2 CPU / 20 Go de disque dur.
- **VM Windows server 2019** : 4096 Mo de RAM / 2 CPU / 60 Go de disque dur.
  
____

## Déploiement de la stack

Pour déployer cette stack, il faut suivre les étapes suivantes :

- **Etape 1** : executer le **[Vagrantfile](Vagrantfile)** pour deployer les VMs dont notre VM principale avec Ansible et Docker.
Toutes les VMs service déployées auront une IP statique et docker installé.
  
```
vagrant up
```

- **Etape 2** : executer le **[deploy_stack.yml](Ansible/playbooks/deploy_stack.yml)** pour configurer les VMs.
  
```
ansible-playbook -i inventory.ini playbook.yml
```
*Ces fichiers sont plus explicités dans la documentation ci dessous*

---

## Outils – technologies utilisées

Présentation des outils et procédure d’installation *(exemple : toutes autres procédures tels que le déploiement par exemple du docker)*.

### Outils

- #### **VMWare - Vsphere**

VMware vSphere est une plate-forme permettant la virtualisation, pour que les utilisateurs puissent virtualiser et gérer leur centre de données incluant le Central Processing Unit (CPU), la mise en réseau et le stockage. Plus précisément, vSphere gère ces infrastructures sous forme d'environnement d'exploitation unifié, c’est-à-dire que plusieurs machines virtuelles peuvent s’exécuter sur une seule machine physique. VMware vSphere comprend principalement vCenter Server et ESXi. Ce dernier, dit hyperviseur ESXi est une plate-forme de virtualisation s’exécutant sur un serveur physique afin de créer des machines virtuelles. Quant au service vCenter Server, il permet de gérer plusieurs hôtes ESXi connectés dans un réseau ainsi que des ressources d’hôtes.

**``Utilité dans l'infrastructre``**

_-_ Configuration de la surveillance : les performances et l’état de l’environnement
_-_ Sécurisation de l’environnement : mises à jour régulières appliquées de patchs de sécurité et politiques de sécurité mise en place pour les machines virtuelles et l’accès à l’environnement.
_-_ Configuration des sauvegardes : protection des données et des machines virtuelles contre les pannes matérielles ou contre des erreurs humaine. La configuration des options de sauvegarde se fait sur vCenter.

- #### **Docker**

Docker se définit comme étant une plateforme open source, il repose sur un kernel Linux. Les conteneurs Docker fournissent un environnement isolé pour l'exécution d’application en local, dans le centre de données client, dans un fournisseur de services externe et/ou dans le cloud. Le fonctionnement réside dans l'exécution d’un hôte Docker, sur lequel sont déployées des images Docker, comprenant l’application et ses dépendances. Une image conteneur est définie comme un moyen d’empaqueter une application ou un service pour le déployer par la suite. Par ailleurs, l’image permet de garder un environnement similaire entre les différents déploiements.

**``Utilité dans l'infrastructre``**

Création, déploiement et execution de services rapide des services sur l'ensemble de l'infrastructure.

- #### **Ansible**

Ansible est un outil open-source de gestion de configuration. Il permet de déployer rapidement des serveurs, d’automatiser les tâches récurrentes et de maintenir la cohérence de la configuration des serveurs. Il permet de faire des mise a jour de services déployés ainsi que le re-déployement de service en cas de panne. Ansible utilise une syntaxe simple et facile à comprendre pour décrire les tâches à effectuer sur les serveurs.

**``Utilité dans l'infrastructre``**

Deploiement des services sur les machines virtuelles pour automatiser les tâches et gérer les mises à jour ainsi qu'un re-déploiement en cas de panne. 


- #### **Git**

Outil utilisé permettant de travailler sur des versions différentes de l'état d'un projet. Il permet le travail en groupe simultanément, tout en ayant accès à un hsitorique détaillé des modifications.

---

### Services utilisés

- #### **AD**

Active Directory est un service d’annuaire développé par Microsoft pour gérer l’authentification des utilisateurs et des ordinateurs. Il permet de centraliser l’administration des comptes d’utilisateurs et de définir des politiques de sécurité pour l’ensemble du réseau (*Group Policy Object GPO*). Des informations supplémentaires ont été détaillés dans le fichier suivant : [README](Infra/Active_directory/README.md).

- #### **DNS** 

DNS (*Domain Name System*) est un service qui permet de résoudre les noms de domaine en adresses IP. Il s'agit d'une solution open-source.

**``Utilité dans l'infrastructre``**

Permet l'authentification des utilisateurs, configurer un serveur DNS pour la résolution des noms de domaine et la mise en place de GPOs personnalisées en fonction des services.

- #### **DHCP**

Le DHCP (Dynamic Host Control Protocol) est un service permettant l'attribution d'adresses IP et d'informations complémentaires (adresse IP du routeur, le masque de sous-réseau, la passerelle par défaut). Il est possible de fournir une étendue d'adresse IP, d'en retirer certaine, et il est aussi possible de faire conserver une adresse IP pendant une durée déterminée.

**``Utilité dans l'infrastructre``**

Simplifier la gestion du réseau tout en évitant de potentielles erreurs.


- #### **Site web - Wordpress**

Création et hébergement d’un site web/blog sur WordPress hébergé en interne, sécurisé (protocole HTTPS), evolutif via docker et ansible.

*WordPress est un logiciel de publication sur Internet de sites web et de blogs, simple d'utilisation. C'est une plateforme de publication librement distribuable, compatible, personnalisable, rapide, légère et gratuite.*

- #### **Base de données - MySql**

MySQL Database est un service de base de données open source, qui combine les transactions, l’analyse et les services d’apprentissage automatique. Il est disponible sur Oracle Cloud Infrastructure, Amazon Web Service et Oracle Database Service in Azure (ODSA) SQL (Structured Query Language) est un langage normalisé et utilisé pour accéder aux bases de données.

Elle permet de gérer et stocker les données des services, tels que le WordPress.

- #### **PHPmyAdmin**

phpMyAdmin est un logiciel open source écrit en PHP qui permet de gérer l'administration d’un serveur de base de données MySQL ou MariaDB à partir d'une interface web. Il est possible pour les utilisateurs de réaliser la plupart des tâches d’administration, dont la création d’une base de données, l’exécution de requêtes, et l’ajout de plusieurs comptes. Il est requis de posseder un serveur web (tel que Apache ou Nginx) afin d'installer les fichiers de phpMyAdmin.

- #### **Nginx - serveur web**

Nginx est un serveur web open source et gratuit. Il est compatible avec plusieurs systèmes d'exploitation. De plus, il est possible de l'intégrer avec des outils de développement comme phpmyadmin et python.
Nginx peut être utilisé de différentes manières, autant que serveur de proxy inverse, serveur de cache, serveur de messagerie et bien d'autres. Il possède une architecture événementielle asynchrone, ce qui signifie qu'il peut gérer de multiples connexions en utilisant peu de ressources système. Effectivement, l'un des avantages primordial de Nginx, c'est la faible utilisation de mémoire système. 

- #### **GitHub**

C'est un service d'hébergement open-source, permettant d etravailler de man,ière efficace en groupe au sein d'un projet pour toutes les questions de partages de scripts, de fichiers, etc...


- #### Monitoring

  - **Prometheus**

      Prometheus est un outil de surveillance de la performance qui collecte des données sur les ressources système, les applications et les services.


  - **Grafana**
      
      Grafana est une plateforme de visualisation de données qui permet de créer des tableaux de bord et des graphiques pour visualiser les données collectées par différents types de sources de données tels que les bases de données et les services cloud.

  
  *Globalement, Prometheus et Grafana sont deux solutions open-source de monitoring populaires ayant donc une grande communauté.*


- #### **Node Exporter**

Node Exporter est un outil open source de monitoring système pour les serveurs utilisant les systèmes d'exploitations Linux et Windows.
Il permet de collecter des métriques système sur l'ensemble des VMs de l'infrastructure telles que l'utilisation du processeur, la mémoire utilisée, l'utilisation du disque et du réseau, ainsi que des informations sur le système d'exploitation telles que le nombre de processus en cours d'exécution et le nombre de fichiers ouverts.
Ces métriques seront ensuite exposées à Prometheus.

- #### **Cadvisor**

Cadvisor est un outil de surveillance de conteneurs open source qui permet de collecter, d'aggréger et d'exposer des métriques et des informations sur les conteneurs.
*Dans cette infrastructure il sera déployé sur tous les hôtes où sont déployés des conteneurs car il permet de collecter des métriques sur les conteneurs et les images Docker qui seront ensuite exposées à Prometheus.*

____

## Maquette de l'infrastructure

<center>

![maquette de l'infrastructure](infra/maquette.jpg)

</center>


____

## Schéma de l'infrastructure

<center>

![maquette de l'infrastructure](infra/schéma.jpg)

</center>

____

## PRA / sinistres / reprise d'activité

- ### **Les différents scénarios de sinistre majeur**

_-_ Épidémie tels que la crise sanitaire du Coronavirus
_-_ Catastrophe naturelle, par exemple une inondation
_-_ Incendie
_-_ Panne du système dû au virus, au cyberattaque, au cybercrime, à la perte, au vol ou à la disparition de données sensible.


- ### **Mise en place d'un plan de reprise d'activité**

Pour garantir la continuité de l’activité en cas de sinistre il est nécessaire d’établir un plan de reprise d’activité (PRA). Dans un PRA on retrouve plusieurs éléments notamment :

_-_ Vérification des normes et de la réglementation.
_-_ Définir les responsabilités de chacun dans la réalisation du plan de reprise d’activités
_-_ Réaliser un inventaire des outils informatiques
_-_ Construction d’un cahier des charges avec des précisions sur les applications informatiques critiques.
_-_ Prévoir un budget adéquat pour le plan de reprise d’activités.
_-_ Identification du système de secours à mettre en place en cas de sinistre (site de secours).
_-_ Choisir un modèle de sauvegarde de données.
_-_ Prévoir des mesures de mises à jour régulières pour tester le plan de reprise d’activités .

- ### **Les solutions de reprise d'activité**

Les machines virtuelles que nous déployons proviennent de la plateforme VMware vSphere. Celle-ci propose des solutions de reprise d’activité après un sinistre ou un incident à l’aide de différents produits :

**``VMware Cloud Disaster Recovery``** est un service à la demande. Il permet un stockage des données de l’entreprise en les répliquant sur une infrastructure cloud distante.

**``VMware Site Recovery``** est un service proposant une protection des charges de travail en local et sur le cloud. Cela consiste en une réplication des applications ainsi que des données sur un site de reprise.

**``Site Recovery Manager``** est disponible sous forme de licence ou de service afin de fournir une automatisation pour la récupération d’applications et de données.

*Ces produits sont compris dans le VMware DRaaS (Disaster Recovery as a Service). Ils sont un réel avantage pour l’entreprise car ils réduisent le temps d’arrêt après un sinistre ou un incident, tout en minimisant la perte de données.*

____

## Perspectives

- **Alertmanager** permettant de recevoir des notifications par mail, teams etc sur les alertes de prometheus
- **Apache (Kafka)** est une plateforme distribuée de diffusion de données en continu, capable de publier, stocker, traiter et souscrire à des flux d’enregistrement en temps réel -solution Open Source de diffusion de données en continu capable de répondre aux divers besoins des entreprises.
- **Cybersécurité** :
  - **Qualys patch management** permet de patcher les serveurs d’ils sont en vulnérailité
  - **Antivirus (exemple : Mcafee)**
  - **System Center Data Protection Manager (DPM)** outil de backup de microsoft ou **Veeam** *- mais payant -*
  - **Elastic et Kibana** monitorer tous ce qui est log, moteur de recherche et d’analyse *- suite ELK*
  - **Sheduler** permet de configurer et de planifier des taches -automatisation- selon critères définit
  - Redondances des VM permettant une reprise d’activité immédiate en cas de panne et plusieurs ESXI permettant la redondances si une VM avec un service tombe en panne.

___

- Davantage d'ESXI 'pour la redondance, la disponibilité et sauvegarde des VMs'
- Active directory pour la gestion des utilisateurs, des groupes et des ordinateurs, ainsi que la gestion des droits d'accès, des contrôles d'accès et des politiques de sécurité.
- intégration de Jenkins pour la gestion des taches et automatisation
- Intégration de Kubernetes pour la gestion des conteneurs, des applications et des services, ainsi que la gestion de la configuration et du déploiement.
- Mise en place de load balancing pour répartir la charge entre les différents serveurs, ainsi que pour assurer la disponibilité des services.
- Mise en place du cloud privé pour la gestion des ressources informatiques et la fourniture de services informatiques à l'entreprise.
- Alertmanager pour la gestion des notifications, des alertes et des événements.
- Elastic et Kibana pour la gestion des logs, la recherche et l'analyse, ainsi que la visualisation des données.

____

## Bibliographie

1. C-Risk. (2021 - 2023). Plan de reprise d’activité. PRA : tout savoir sur le plan de reprise d’activité : https://www.c-risk.com/fr/blog/pra-plan-de-reprise-activite/
2. Cesar de la Torre, Bill Wagner et Mike Rousos, CT. et al. (2022). Microsoft. .NET : Architecture pour les applications .NET en conteneur. https://dotnet.microsoft.com/en-us/download/e-book/microservices-architecture/pdf
3. Diane Greene, Edouard Bugnion, Scott Devine, Mendel Rosenblum et Edward Wang, DG. et al. (1998 - 2023). Solutions de reprise d’activité. Documents VMware. https://www.vmware.com/fr/solutions/disaster-recovery.html
4. Diane Greene, Edouard Bugnion, Scott Devine, Mendel Rosenblum et Edward Wang, DG. et al. (1998 - 2023). Documentation de VMware vSphere. Documents VMware. https://docs.vmware.com/fr/VMware-vSphere/index.html
5. Igor Sysoev, IS. (2004 - 2023). nginx documentation. Nginx. https://nginx.org/en/docs/
6. Machtelt Garrels, MG. (2002 - 2006). Un guide pratique. Introduction à Linux. https://linux.die.net/Intro-Linux/
7. Matthew Mullenweg et Mike Little, MM et ML. (2003 - 2023). Documentation. WordPress.org Documentation. https://wordpress.org/documentation/
8. Michael DeHaan, M.D. (2023). Documentation. Documentation Ansible. https://docs.ansible.com/ansible/latest/index.html
9. Microsoft. (2008 - 2023). Documents GitHub - De l’aide où que vous soyez dans votre parcours GitHub. Documents GitHub. https://docs.github.com/en/get-started/quickstart/hello-world
10. Microsoft. (2012 - 2022). Vue d’ensemble des services de domaine Active Directory. https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview
11. Microsoft. (2021 - 2023). Système de noms de domaine (DNS). https://learn.microsoft.com/en-us/windows-server/networking/dns/dns-top
12. Olivier Müller, Marc Delisle, Alexander M. Turek, Michal Čihař et Garvin Hicking, OM. et al. (2003 - 2023). phpMyAdmin - Bringing MySQL to the web. phpMyAdmin - Documentation. https://www.phpmyadmin.net/docs/
13. Oracle. (2000 - 2023). MySQL Documentation. MySQL. https://www.mysql.com/fr/
14. Solomon Hykes, SH. (2013 - 2023). Documents Docker. https://docs.docker.com/
15. SoundCloud. (2014 - 2023). Prométhée. Vue d’ensemble | Prométhée. https://prometheus.io/docs/introduction/overview/
16. Torkel Ödegaard, TO. (2014 - 2023). Grafana. Laboratoires Grafana. https://grafana.com/docs/grafana/latest/introduction/



``1. Service Développement (10 personnes)``

**Site** : Aix en provence

**Collaborateurs** :

- Julien Martin
- Nour Boussaid
- Paul Sanchez
- Anais Moulin
- Kamel Hussain
- Assane Techer
- Vanessa Fleury
- Bryan Wilson
- Dean Harris
- Juliette Roux

**Fonction** : développe les applications et les sites web de l'entreprise

``2. Production de Services (5personnes)``

**Site** : Nantes

**Collaborateur** :

- Amélie Moreau 
- Nathasha Vishnevsky
- Etienne Morel
- Donavan Romanov
- Rose Lefebvre

**Fonction** : gère les serveurs et les réseaux de l'entreprise.

``3. Service Support (5 personnes)``

**Site** : Paris

**Collaborateur** :

- James Brown
- Jean-Louis Klein
- Maeva Payet
- Peter Robinson
- Zayn Ajam

**Fonction** : gère les demandes des clients et les incidents.