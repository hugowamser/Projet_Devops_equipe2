# Explications des "command:"
___

## Prometheus

```yml
command:
      - '--config.file=/etc/prometheus/prometheus.yml'
```
Cette ligne spécifie le fichier de configuration YAML pour Prometheus, qui contient les règles de récupération de métriques, les paramètres d'alerte et autres configurations. Ici, le fichier de configuration

```yml
      '--storage.tsdb.path=/prometheus'
```
Cette ligne spécifie le chemin du stockage des données de Prometheus. Ici, le stockage se fera dans le répertoire /prometheus.

```yml
      '--web.console.libraries=/etc/prometheus/console_libraries'
```
 Cette ligne spécifie le chemin du répertoire contenant les bibliothèques de la console Web de Prometheus.

```yml
      '--web.console.templates=/etc/prometheus/consoles'
```

Cette ligne spécifie le chemin du répertoire contenant les modèles de la console Web de Prometheus.

```yml
      '--storage.tsdb.retention.time=200h'
```
Cette ligne spécifie la durée de rétention des données stockées. Ici, les données seront conservées pendant 200 heures.

```yml
      '--web.enable-lifecycle'
```
Cette ligne active le point de terminaison de gestion de cycle de vie de Prometheus, qui permet à Prometheus de recevoir des commandes de redémarrage et d'arrêt en utilisant des requêtes HTTP.

___

## Alert Manager

```yml
command:
      '--config.file=/etc/alertmanager/config.yml'
```
Cette ligne spécifie le fichier de configuration YAML pour Alertmanager, qui contient les règles de routage et de groupage d'alertes ainsi que les paramètres d'intégration pour les services de notification. Ici, le fichier de configuration se trouve dans /etc/alertmanager/config.yml.

```yml
      '--storage.path=/alertmanager'
```
Cette ligne spécifie le chemin de stockage pour les données de l'Alertmanager. Ici, les données seront stockées dans le répertoire /alertmanager.

___

## Node Exporter

```yml
command:
      '--path.procfs=/host/proc'
```
Cette ligne spécifie le chemin du système de fichiers proc pour les métriques du processus. Ici, le chemin sera /host/proc.

```yml
      '--path.rootfs=/rootfs'
```
Cette ligne spécifie le chemin du système de fichiers racine pour les métriques du système de fichiers. Ici, le chemin sera /rootfs.

```yml
      '--path.sysfs=/host/sys'
```
Cette ligne spécifie le chemin du système de fichiers sys pour les métriques du système. Ici, le chemin sera /host/sys.

```yml
      '--collector.filesystem.mount-points-exclude=^/(sys|proc|dev|host|etc)($$|/)'
```
Cette ligne spécifie les points de montage du système de fichiers à exclure pour la collecte des métriques. Dans cet exemple, les points de montage correspondants à /sys, /proc, /dev, /host et /etc seront exclus.

