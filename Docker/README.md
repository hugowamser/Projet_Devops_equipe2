# installation Docker

> Afin d’installer Docker, les commandes Linux ont été utilisé :

- Vérifier la version de l’OS avec la commande :

```bash

hostnamectl

```

- Désinstaller les anciennes avec la commande :

```bash

sudo apt-get remove docker docker-engine docker.io containerd runc

```

- Installer les packages avec la commande :

```bash

sudo apt-get update
sudo apt-get install \
ca-certificates \
curl \
gnupg

```

- Ajouter la clé GPG officielle avec la commande :

```bash

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

```

- Configurer le référentiel :

```bash

echo \
"deb [arch="$(dpkg --print-architecture)" signed by=/etc/apt/keyrings/docker.gpg] https://donload.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```

- Mise à jour l’index du package :

```bash

sudo apt-get update

```

- Exécuter l’installation de la nouvelle version Docker :

```bash

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

```
