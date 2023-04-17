# Active Directory

[toc]

## Users

### users_SOMILY.csv, Import_users et Importcsv_users

- **users_SOMILY.csv**
Fichier au format csv, listant l'ensemble des utilisateurs de chez SOMILY ainsi que leurs services respectifs

- **importcsv_users.ps1**
Script powershell qui permet la création des OUs, sous OUs et le rangement des différents utilisateurs dans ces derniers

- **import_users.yml**
Script Ansible qui permet de copier le fichier importcsv_users.ps1 et le fichier users_SOMILY.csv pour et l'execution du script powershell.

### Commande powershell d'execution

```powershell
Ansible-playbook -i ./Ansible/playbooks/inventory.init import_users.yml
```

## Configuration des GPO

- **Définir la politique de mot de passe :**
Complexité de mot de passe, telles que la longueur minimale, l'utilisation de caractères spéciaux, la durée de validité et la restriction de réutilisation des mots de passe précédents

- **Restreindre l'accès au panneau de configuration :**
Limiter aussi l'acces au cmd et powershell
  
- **Configurer le bureau :**
Les paramètres de fond d'écran, d'économiseur d'écran, de thème, de police de caractères

- **Gérer les applications :**
Restreindre l'exécution de certaines applications ou d'autoriser l'exécution uniquement de certaines applications approuvées
- **Configurer les paramètres de sécurité :**
Les paramètres de sécurité, tels que le niveau de sécurité du navigateur web, les règles de pare-feu, les paramètres de sécurité réseau

- **Configurer les paramètres de compte utilisateur :**
Définir les paramètres de compte utilisateur l'expiration du compte, les restrictions de mot de passe

- **Configurer les paramètres de démarrage de session :**
Suppression de l'écran de bienvenue, l'exécution de scripts de connexion, l'affichage de messages d'informations

- **Limiter l'accès aux périphériques**
Limiter l'accès aux périphériques, les ports USB, les CD/DVD, les disques amovibles

## Sécurité et sauvegarde

>Pour sauvegarder les données des différents sites sur les autres Active Directory et assurer une reprise d'activité en cas de panne, on met en place une architecture de **réplication et de basculement**.

### Mettre en place une réplication des données entre les trois sites

- Pour chaque site, on crée un **serveur de fichiers** qui hébergera les données à sauvegarder.
- Mise en place d'une **réplication DFS** (Distributed File System) entre les serveurs de fichiers des différents sites. Réplication **bidirectionnelle** pour que les données soient mises à jour dans les deux sens.
- Configuration de la réplication pour que les données soient **répliquées régulièrement** et que les données supprimées ne soient **pas automatiquement supprimées** dans les autres sites.

### Mettre en place un basculement en cas de panne

- Configuration d'un **cluster de basculement** pour chaque site, avec deux serveurs qui hébergeront les services Active Directory et les autres services critiques.
- Configuration de manière à ce qu'ils puissent **basculer rapidement** en cas de panne de l'un des deux serveurs.
- Configurez la **réplication Active Directory** entre les sites pour que les données soient répliquées entre les contrôleurs de domaine des différents sites.
- Parametrer pour que les utilisateurs se **connecter automatiquement au contrôleur de domaine le plus proche** de leur site en utilisant les sites Active Directory et les services de localisation et éviter toute interruption de service en cas de panne.