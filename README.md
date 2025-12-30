# 📦 Mega-Blabla-Installer

**L'outil de post-installation ultime pour les techniciens et utilisateurs Debian.** Développé par **Amaury (Blabla Linux)**, ce script automatise l'installation de plus de 200 logiciels sur Debian 11/12 (Stable) via une interface interactive.

> [!IMPORTANT]
> **Note sur la version Beta** : Ce script est actuellement en phase **Beta**. Il est pleinement fonctionnel mais sujet à des évolutions majeures (structure du code, enrichissement du catalogue). Vos retours sont précieux pour l'améliorer !

---

## 👨‍💻 À propos de l'auteur

Administrateur système spécialisé dans le reconditionnement matériel sous Linux, je milite pour une informatique durable et libre. Ce script est le fruit de mon expertise sur le terrain pour faciliter le déploiement de stations de travail performantes et prêtes à l'emploi.

👉 **Un seul lien :** [link.blablalinux.be](https://link.blablalinux.be)

---

## 🚀 Installation et Lancement

Pour garantir une stabilité parfaite de l'interface graphique (**Whiptail**) et une prise en charge totale de votre clavier (touches fléchées et espace), le script doit être téléchargé et exécuté localement :

```bash
# 1. Télécharger le script depuis le Gitea Blabla Linux
wget https://gitea.blablalinux.be/blablalinux/mega-blabla-installer/raw/branch/main/mega-blabla-installer.sh

# 2. Rendre le fichier exécutable
chmod +x mega-blabla-installer.sh

# 3. Lancer l'installateur avec les droits administrateur (sudo)
sudo ./mega-blabla-installer.sh

```

---

## ⚡ Pourquoi utiliser cet outil ?

L'installation manuelle et individuelle de logiciels après une installation fraîche de Debian peut être chronophage. Le **Mega-Blabla-Installer** centralise les meilleures applications du monde libre dans une interface simplifiée et ergonomique.

### 🛠️ Une gestion hybride intelligente

Le script combine deux méthodes de distribution pour garantir stabilité et modernité :

* **APT (Dépôts Debian)** : Privilégié pour les outils système, les utilitaires de base et les logiciels nécessitant une intégration profonde.
* **Flatpak (Flathub)** : Utilisé pour les applications "utilisateur" afin de bénéficier des versions les plus récentes sans impacter la stabilité du cœur Debian.

### 📂 Un catalogue organisé (+200 logiciels)

Le catalogue est structuré en **7 catégories thématiques** pour une sélection sur mesure :

1. **Internet** : Navigateurs (Firefox, Brave, Edge), Messageries (Signal, Discord, Telegram), Clients Torrent.
2. **Bureautique** : Suites Office (LibreOffice, OnlyOffice), éditeurs PDF, outils de prise de notes (Obsidian, Joplin).
3. **Graphisme** : Retouche photo (GIMP), dessin vectoriel (Inkscape), modélisation 3D (Blender, FreeCAD).
4. **Multimédia** : Lecteurs universels (VLC, MPV), montage vidéo (Kdenlive, Shotcut), stations audio (Audacity, Mixxx).
5. **Développement** : Éditeurs de code (VS Code, Vim), conteneurs (Docker), environnements (Android Studio, Python).
6. **Système** : Monitoring (Btop, Stacer), utilitaires disques (GParted), virtualisation (Virt-Manager).
7. **Éducation & Jeux** : Logiciels pédagogiques (GCompris, Scratch), plateformes de jeux (Steam, Lutris, RetroArch).

---

## ⚙️ Fonctionnement technique

Le script repose sur **Whiptail** pour offrir une interface utilisateur TUI (*Text User Interface*) robuste :

* **Navigation non-linéaire** : Un système de gestion d'étapes permet de revenir en arrière pour modifier vos choix avant de lancer le processus d'installation.
* **Auto-configuration** : Le script vérifie l'état de `flatpak`, active le dépôt `flathub` si nécessaire et met à jour les sources APT avant de commencer.
* **Respect du système** : Aucune modification n'est effectuée sans votre validation finale dans le menu de résumé.

---

## 📄 Licence

Ce projet est distribué sous licence **GPLv3**. Vous êtes libre de l'utiliser, de le modifier et de le partager, à condition que vos modifications restent également sous licence GPLv3.

---

*Fait avec passion par Amaury (BlablaLinux) pour la communauté Debian.*
