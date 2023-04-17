# Active Directory

## Configuration des GPO


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