# 🗺️ Roadmap - Mega-Blabla-Installer

Ce document trace la vision du projet et les fonctionnalités à venir. En tant que **projet passion**, le développement suit mon rythme et mes disponibilités personnelles.

*This document outlines the project's vision and upcoming features. As a **passion project**, development follows my own pace and personal availability.*

---

## ✅ Réalisé / Completed (v0.1.7)

* [x] **Mode Désinstallation / Uninstallation Mode** : Implémentation d'une option au lancement permettant de supprimer proprement les logiciels (APT et Flatpak). / *Implementation of a launch option to cleanly remove software.*
* [x] **Expansion du catalogue / Catalog Expansion** : Passage de 90 à plus de **130 logiciels** disponibles. / *Increased from 90 to over **130 available software**.*
* [x] **Optimisation du rendu / UI Optimization** : Correction des bordures Whiptail et calcul dynamique des dimensions du terminal. / *Fixed Whiptail borders and dynamic terminal dimension calculation.*
* [x] **Visibilité technique / Technical Visibility** : Affichage en direct du flux `apt update` pour le suivi des dépôts. / *Live display of the `apt update` stream for repository monitoring.*

## 🟢 Court Terme / Short Term (v0.2.x)

* [ ] **Objectif 200+ / Goal 200+** : Continuer l'enrichissement du catalogue pour atteindre les 200 entrées. / *Continue expanding the catalog to reach 200 entries.*
* [ ] **Journalisation (Logs) / Logging** : Création d'un fichier de log dans `/var/log/mega-installer.log` pour faciliter le support technique. / *Creating a log file to facilitate technical support.*
* [ ] **Nettoyage Post-Opération / Post-Operation Cleanup** : Intégrer un `apt autoremove` et un nettoyage des résidus Flatpak automatique après une désinstallation. / *Integrate automatic `apt autoremove` and Flatpak residue cleanup after uninstallation.*

## 🟡 Moyen Terme / Mid Term (v0.5.x)

* [ ] **Scripts de "Tweaks" / Tweak Scripts** : Ajouter une catégorie pour optimiser le système (gestion de la Swap, installation des codecs multimédias, réglages SSD). / *Add a category to optimize the system (Swap management, media codecs, SSD settings).*
* [ ] **Détection d'environnement / Desktop Detection** : Proposer des logiciels spécifiques selon l'environnement de bureau détecté (GNOME, KDE, XFCE). / *Suggest specific software based on the detected desktop environment.*
* [ ] **Vérification d'espace disque / Disk Space Check** : Ajout d'une fonction pour vérifier si l'espace est suffisant avant de lancer les installations Flatpak massives. / *Add a function to check for sufficient space before launching massive Flatpak installations.*

## 🔴 Long Terme / Long Term (v1.0.0)

* [ ] **Export/Import de profil / Profile Export/Import** : Sauvegarder sa sélection (liste d'ID) dans un fichier pour la répliquer instantanément sur d'autres machines via le script. / *Save selection to a file to replicate it instantly on other machines.*
* [ ] **Mode Silencieux / Unattended Mode** : Pouvoir lancer le script avec un fichier de configuration sans intervention humaine. / *Launch the script using a configuration file without human intervention.*

---

## 💡 Remarque Importante / Important Note

**FR:** Ce script est une initiative personnelle et bénévole. À ce titre :

* Je ne suis tenu à **aucune date précise** pour les futures versions.
* Les releases sortent quand elles sont prêtes et testées.
* Les retours de la communauté sont les bienvenus via les [Issues GitHub](https://github.com/anyblabla/mega-blabla-installer/issues).

**EN:** This script is a personal and voluntary initiative. As such:

* I am not bound to **any specific date** for future versions.
* Releases are published when they are ready and tested.
* Community feedback is welcome via [GitHub Issues](https://github.com/anyblabla/mega-blabla-installer/issues).

---

*Dernière mise à jour : 2 Janvier 2026 / Last update: January 2, 2026*
