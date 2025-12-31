## 📦 Mega-Blabla-Installer

![Debian](https://img.shields.io/badge/OS-Debian-A81D33?logo=debian&logoColor=white)
![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnubash&logoColor=white)
![Version](https://img.shields.io/badge/Status-Beta-orange)
![GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)

**L'outil de post-installation ultime pour les techniciens et utilisateurs Debian.** Développé par **Amaury (Blabla Linux)**, ce script automatise l'installation de plus de **130 logiciels** sur Debian 11/12 (Stable) via une interface interactive.

> [!IMPORTANT]
> **Note sur la version Beta (v0.1.7)** : Ce script est actuellement en phase **Beta**. Il est pleinement fonctionnel mais sujet à des évolutions majeures (structure du code, enrichissement du catalogue). Vos retours sont précieux pour l'améliorer !
> **Nouveauté :** Le catalogue passe de 90 à plus de **130 logiciels** et intègre un **mode désinstallation**.

> [!WARNING]
> **Projet Passion** : Ce script est développé sur mon temps libre par pur plaisir de partage. Je ne suis tenu à aucun engagement ni calendrier précis concernant la sortie des nouvelles releases ou des futures fonctionnalités.

## 👨‍💻 À propos de l'auteur

Administrateur système spécialisé dans le reconditionnement matériel sous Linux, je milite pour une informatique durable et libre. Ce script est le fruit de mon expertise sur le terrain pour faciliter le déploiement de stations de travail performantes et prêtes à l'emploi.

👉 **Un seul lien :** [link.blablalinux.be](https://link.blablalinux.be)

## 🚀 Installation et Lancement

Pour garantir une stabilité parfaite de l'interface graphique (**Whiptail**) et une prise en charge totale de votre clavier (touches fléchées et espace), le script doit être téléchargé et exécuté localement :

### Option 1 : Via GitHub (Recommandé)

```plaintext
# 1. Télécharger le script
wget https://raw.githubusercontent.com/anyblabla/mega-blabla-installer/main/mega-blabla-installer.sh

# 2. Rendre le fichier exécutable
chmod +x mega-blabla-installer.sh

# 3. Lancer l'installateur
sudo ./mega-blabla-installer.sh
```

### Option 2 : Via Gitea (Blabla Linux)

```plaintext
# 1. Télécharger le script
wget https://gitea.blablalinux.be/blablalinux/mega-blabla-installer/raw/branch/main/mega-blabla-installer.sh

# 2. Rendre le fichier exécutable
chmod +x mega-blabla-installer.sh

# 3. Lancer l'installateur
sudo ./mega-blabla-installer.sh
```

## ✨ Visuel

![mega-blabla-installer](./mega-blabla-installer.jpg)

## ⚡ Pourquoi utiliser cet outil ?

L'installation manuelle et individuelle de logiciels après une installation fraîche de Debian peut être chronophage. Le **Mega-Blabla-Installer** centralise les meilleures applications du monde libre dans une interface simplifiée et ergonomique.

### 🛠️ Une gestion hybride et bidirectionnelle

Le script combine deux méthodes de distribution pour garantir stabilité et modernité :

* **APT (Dépôts Debian)** : Privilégié pour les outils système, les utilitaires de base et les logiciels nécessitant une intégration profonde.
* **Flatpak (Flathub)** : Utilisé pour les applications "utilisateur" afin de bénéficier des versions les plus récentes.
* **Mode Désinstallation** : Nouveau dans la v0.1.7, il permet de nettoyer le système en supprimant proprement les logiciels sélectionnés.

### 📂 Un catalogue organisé (130+ logiciels)

Le catalogue est structuré en **7 catégories thématiques** pour une sélection sur mesure :

1. **Internet & Cloud** : Navigateurs (Firefox ESR/Flatpak, Brave, Chromium, Edge, Opera, Vivaldi, Tor), Messageries (Signal, Telegram, Discord, WebCord, Element, Slack), Cloud (Nextcloud, Dropbox).
2. **Bureautique & Notes** : Suites Office (LibreOffice APT/Flatpak, OnlyOffice, WPS), Notes (Obsidian, Joplin, Gnote, Zim), PDF (Evince, Master PDF Editor), Calibre, Zotero.
3. **Graphisme & Design** : GIMP, Inkscape, Krita, Blender, Draw.io, Darktable, RawTherapee, FreeCAD, LibreCAD, SweetHome3D, Flameshot.
4. **Multimédia & Création** : Lecteurs (VLC, MPV, Kodi, Elisa), Montage (Kdenlive, Handbrake, Shotcut, Pitivi), Audio (Audacity, Spotify, Strawberry, Ardour, MuseScore).
5. **Développement & Code** : VS Code, Vim, Git, Python 3, Geany, Docker, Android Studio, DBeaver, Arduino IDE, PyCharm, NodeJS, Postman.
6. **Système & Admin** : Monitoring (Btop, Htop, Neofetch), Maintenance (Stacer, BleachBit, Timeshift, GParted), Virtualisation (Virt-Manager), Sécurité (Rkhunter, ClamAV, Nmap, Wireshark), Proxmox Tools.
7. **Éducation & Jeux** : GCompris, Stellarium, Scratch, Steam, Lutris, Minecraft (Prism), SuperTuxKart, RetroArch, 0 A.D., Logisim-evolution.

## ⚙️ Fonctionnement technique

Le script repose sur **Whiptail** pour offrir une interface utilisateur TUI (*Text User Interface*) robuste :

* **Navigation non-linéaire** : Revenez en arrière pour modifier vos choix avant l'opération finale.
* **Visibilité Système** : La mise à jour `apt update` est affichée en direct au lancement pour un meilleur suivi technique.
* **Respect du système** : Aucune modification n'est effectuée sans votre validation finale dans le menu de résumé.

## 🔗 Liens du projet

* **Dépôt GitHub :** 👉 [https://github.com/anyblabla/mega-blabla-installer](https://github.com/anyblabla/mega-blabla-installer)
* **Dépôt Gitea :** 👉 [https://gitea.blablalinux.be/blablalinux/mega-blabla-installer](https://gitea.blablalinux.be/blablalinux/mega-blabla-installer)

## 📄 Licence

Ce projet est distribué sous licence **GPLv3**. Vous êtes libre de l'utiliser, de le modifier et de le partager.

*Fait avec passion par Amaury (BlablaLinux) pour la communauté Debian.*