# 🗺️ Roadmap - Mega-Blabla-Installer

Ce document trace la vision du projet et les fonctionnalités à venir. En tant que **projet passion**, le développement suit mon rythme et mes disponibilités personnelles.

## ✅ Réalisé (v0.1.7)

* [x] **Mode Désinstallation** : Implémentation d'une option au lancement permettant de supprimer proprement les logiciels (APT et Flatpak).
* [x] **Expansion du catalogue** : Passage de 90 à plus de **130 logiciels** disponibles.
* [x] **Optimisation du rendu** : Correction des bordures Whiptail et calcul dynamique des dimensions du terminal.
* [x] **Visibilité technique** : Affichage en direct du flux `apt update` pour le suivi des dépôts.

## 🟢 Court Terme (v0.2.x)

* [ ] **Objectif 200+** : Continuer l'enrichissement du catalogue pour atteindre les 200 entrées.
* [ ] **Journalisation (Logs)** : Création d'un fichier de log dans `/var/log/mega-installer.log` pour faciliter le support technique.
* [ ] **Nettoyage Post-Opération** : Intégrer un `apt autoremove` et un nettoyage des résidus Flatpak automatique après une désinstallation.

## 🟡 Moyen Terme (v0.5.x)

* [ ] **Scripts de "Tweaks"** : Ajouter une catégorie pour optimiser le système (gestion de la Swap, installation des codecs multimédias, réglages SSD).
* [ ] **Détection d'environnement** : Proposer des logiciels spécifiques selon l'environnement de bureau détecté (GNOME, KDE, XFCE).
* [ ] **Vérification d'espace disque** : Ajout d'une fonction pour vérifier si l'espace est suffisant avant de lancer les installations Flatpak massives.

## 🔴 Long Terme (v1.0.0)

* [ ] **Export/Import de profil** : Sauvegarder sa sélection (liste d'ID) dans un fichier pour la répliquer instantanément sur d'autres machines via le script.
* [ ] **Mode Silencieux / Unattended** : Pouvoir lancer le script avec un fichier de configuration sans intervention humaine.

---

## 💡 Remarque Importante

Ce script est une initiative personnelle et bénévole. À ce titre :

* Je ne suis tenu à **aucune date précise** pour les futures versions.
* Les releases sortent quand elles sont prêtes et testées.
* Les retours de la communauté sont les bienvenus via les [Issues GitHub](https://github.com/anyblabla/mega-blabla-installer/issues).

---

*Dernière mise à jour : 31 Décembre 2025*