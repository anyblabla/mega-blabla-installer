## 📦 Mega-Blabla-Installer

[**Français**](#français) | [**English**](#english)

---

<h2 id="français">🇫🇷 Français</h2>

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
wget https://raw.githubusercontent.com/anyblabla/mega-blabla-installer/main/mega-blabla-installer.sh
chmod +x mega-blabla-installer.sh
sudo ./mega-blabla-installer.sh
```

### Option 2 : Via Gitea (Blabla Linux)

```plaintext
wget https://gitea.blablalinux.be/blablalinux/mega-blabla-installer/raw/branch/main/mega-blabla-installer.sh
chmod +x mega-blabla-installer.sh
sudo ./mega-blabla-installer.sh
```

---

<h2 id="english">🇺🇸 English</h2>

**The ultimate post-installation tool for Debian technicians and users.** Developed by **Amaury (Blabla Linux)**, this script automates the installation of over **130 software packages** on Debian 11/12 (Stable) through an interactive interface.

> [!IMPORTANT]
> **Beta Version Note (v0.1.7)**: This script is currently in **Beta**. It is fully functional but subject to major updates (code structure, catalog expansion). Your feedback is valuable for improvement!
> **New:** The catalog has grown from 90 to over **130 programs** and includes an **uninstallation mode**.

> [!WARNING]
> **Passion Project**: This script is developed during my free time for the pure pleasure of sharing. I am not bound by any specific commitment or schedule regarding new releases or future features.

## 👨‍💻 About the Author

System administrator specialized in hardware refurbishing under Linux, I advocate for sustainable and free computing. This script is the result of my field expertise to facilitate the deployment of high-performance, ready-to-use workstations.

👉 **One link:** [link.blablalinux.be](https://link.blablalinux.be)

## 🚀 Installation and Launch

To ensure perfect stability of the graphical interface (**Whiptail**) and full support for your keyboard (arrow keys and spacebar), the script must be downloaded and run locally:

### Option 1: Via GitHub (Recommended)

```plaintext
wget https://raw.githubusercontent.com/anyblabla/mega-blabla-installer/main/mega-blabla-installer.sh
chmod +x mega-blabla-installer.sh
sudo ./mega-blabla-installer.sh
```

### Option 2: Via Gitea (Blabla Linux)

```plaintext
wget https://gitea.blablalinux.be/blablalinux/mega-blabla-installer/raw/branch/main/mega-blabla-installer.sh
chmod +x mega-blabla-installer.sh
sudo ./mega-blabla-installer.sh
```

---

## ✨ Visuel / Visual

## ⚡ Pourquoi utiliser cet outil ? / Why use this tool?

**FR:** L'installation manuelle et individuelle de logiciels après une installation fraîche de Debian peut être chronophage. Le **Mega-Blabla-Installer** centralise les meilleures applications du monde libre dans une interface simplifiée et ergonomique.

**EN:** Manually installing software one by one after a fresh Debian install can be time-consuming. **Mega-Blabla-Installer** centralizes the best free software applications in a simplified and ergonomic interface.

### 🛠️ Une gestion hybride et bidirectionnelle / Hybrid and bidirectional management

* **APT (Dépôts Debian)** : Privilégié pour les outils système / Preferred for system tools.
* **Flatpak (Flathub)** : Utilisé pour les applications "utilisateur" récentes / Used for recent "user" applications.
* **Mode Désinstallation / Uninstallation Mode** : Permet de nettoyer le système proprement / Allows for a clean system cleanup.

### 📂 Un catalogue organisé (130+ logiciels) / Organized catalog (130+ software)

1. **Internet & Cloud** : Firefox ESR/Flatpak, Brave, Chromium, Edge, Opera, Vivaldi, Tor, Signal, Telegram, Discord, WebCord, Element, Slack, Nextcloud, Dropbox.
2. **Bureautique & Notes / Office & Notes** : LibreOffice APT/Flatpak, OnlyOffice, WPS, Obsidian, Joplin, Gnote, Zim, Evince, Master PDF Editor, Calibre, Zotero.
3. **Graphisme & Design / Graphics & Design** : GIMP, Inkscape, Krita, Blender, Draw.io, Darktable, RawTherapee, FreeCAD, LibreCAD, SweetHome3D, Flameshot.
4. **Multimédia & Création / Multimedia & Creation** : VLC, MPV, Kodi, Elisa, Kdenlive, Handbrake, Shotcut, Pitivi, Audacity, Spotify, Strawberry, Ardour, MuseScore.
5. **Développement & Code / Development & Code** : VS Code, Vim, Git, Python 3, Geany, Docker, Android Studio, DBeaver, Arduino IDE, PyCharm, NodeJS, Postman.
6. **Système & Admin / System & Admin** : Monitoring (Btop, Htop, Neofetch), Maintenance (Stacer, BleachBit, Timeshift, GParted), Virtualisation (Virt-Manager), Sécurité (Rkhunter, ClamAV, Nmap, Wireshark), Proxmox Tools.
7. **Éducation & Jeux / Education & Games** : GCompris, Stellarium, Scratch, Steam, Lutris, Minecraft (Prism), SuperTuxKart, RetroArch, 0 A.D., Logisim-evolution.

## ⚙️ Fonctionnement technique / Technical Operation

* **Navigation non-linéaire / Non-linear navigation** : Revenez en arrière pour modifier vos choix / Go back to modify your choices.
* **Visibilité Système / System Visibility** : Mise à jour `apt update` affichée en direct / Live `apt update` display.
* **Respect du système / System respect** : Validation finale requise / Final validation required.

## 🔗 Liens du projet / Project Links

* **GitHub :** [https://github.com/anyblabla/mega-blabla-installer](https://github.com/anyblabla/mega-blabla-installer)
* **Gitea :** [https://gitea.blablalinux.be/blablalinux/mega-blabla-installer](https://gitea.blablalinux.be/blablalinux/mega-blabla-installer)

## 📄 Licence / License

**GPLv3** - *Fait avec passion par Amaury (BlablaLinux) pour la communauté Debian / Made with passion by Amaury (BlablaLinux) for the Debian community.*
