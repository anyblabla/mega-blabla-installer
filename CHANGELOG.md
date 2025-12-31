# 📝 Changelog - Mega-Blabla-Installer

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

## [0.1.7-BETA] - 2025-12-31

### 🚀 Nouveautés

* **Mode Désinstallation** : Ajout d'un menu principal permettant de choisir entre l'installation et la suppression de logiciels.
* **Catalogue Étendu** : Passage de 90 à **130+ logiciels** (Ajout massif dans les catégories Dev, Système et Multimédia).
* **Visibilité Système** : Le processus `apt update` est désormais visible à l'écran dès le lancement du script pour permettre aux techniciens de vérifier la connectivité aux dépôts.

### 🛠️ Améliorations & Fixes

* **Rendu TUI (Whiptail)** : Correction des bugs d'affichage des bordures. La largeur est désormais fixée à 80 colonnes pour une stabilité maximale du rendu.
* **Calcul Dynamique** : Amélioration de la fonction `calc_dims` pour adapter la hauteur des listes selon la taille du terminal.
* **Détection des installations** : Amélioration de la détection des logiciels déjà présents (notamment pour LibreOffice et les doublons APT/Flatpak).

## [0.1.0-BETA] - 2025-12-20

### 🚀 Nouveautés

* Lancement initial du projet.
* Interface interactive avec 7 catégories thématiques.
* Gestion hybride **APT** et **Flatpak**.
* Système de navigation "Suivant/Précédent" sans perte de sélection.

---

## 🏗️ Légende des changements

* `🚀 Nouveautés` : Pour les nouvelles fonctionnalités ajoutées.
* `🛠️ Améliorations & Fixes` : Pour les corrections de bugs ou optimisations de code.
* `⚠️ Attention` : Pour les changements majeurs qui pourraient impacter l'utilisation.

---

*Fait avec passion par Amaury (BlablaLinux).*