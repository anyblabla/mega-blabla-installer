#!/bin/bash

# ==============================================================================
# Script    : Mega-Installer BlablaLinux (200+ Logiciels)
# Version   : 0.1.0-BETA
# Mode      : Exécution Locale
# Auteur    : Amaury aka BlablaLinux (https://link.blablalinux.be)
# Expertise : Debian, Ubuntu, Linux Mint, Proxmox
# Licence   : GPLv3
# ==============================================================================

# --- Variables Globales ---
VERSION="0.1.0-BETA"

# --- A Classer ---

# 1. Gestion des interruptions
exit_script() {
    clear
    echo -e "\n\e[33m[!] Script arrêté. À bientôt sur Blabla Linux (https://link.blablalinux.be) !\e[0m\n"
    exit 0
}
trap exit_script SIGINT

# 2. Vérification Root
if [ "$EUID" -ne 0 ]; then 
    echo -e "\e[31mErreur : Ce script doit être lancé avec sudo.\e[0m"
    exit 1
fi

# 3. Préparation du système
clear
echo "===================================================="
echo "    PRÉPARATION DU SYSTÈME - BLABLA LINUX          "
echo "    Version : $VERSION                             "
echo "===================================================="
echo "🚀 Mise à jour et installation des outils (Debian)..."
apt update && apt install -y whiptail flatpak tput > /dev/null 2>&1
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# --- LOGIQUE D'INSTALLATION ---
install_pkg() {
    local id=$1
    local method=$2
    local pkg=$3
    echo -e "\e[32m📦 Installation de $id ($method)...\e[0m"
    if [ "$method" == "apt" ]; then
        apt install -y $pkg
    else
        flatpak install flathub -y --noninteractive $pkg
    fi
}

# --- DÉFINITION DES CATÉGORIES (COMPLÈTES) ---

L_INTERNET=(
    "FF_APT" "Firefox ESR (APT)" OFF "apt" "firefox-esr" "FF_FP" "Firefox (Flatpak)" OFF "flatpak" "org.mozilla.firefox"
    "BRV_FP" "Brave Browser" OFF "flatpak" "com.brave.Browser" "CHR_APT" "Chromium" OFF "apt" "chromium"
    "TB_APT" "Thunderbird" OFF "apt" "thunderbird" "SIG_FP" "Signal" OFF "flatpak" "org.signal.Signal"
    "TG_FP" "Telegram" OFF "flatpak" "org.telegram.desktop" "DIS_FP" "Discord" OFF "flatpak" "com.discordapp.Discord"
    "FZ_APT" "FileZilla" OFF "apt" "filezilla" "DLG_APT" "Deluge" OFF "apt" "deluge"
    "TR_APT" "Transmission" OFF "apt" "transmission-gtk" "QM_FP" "Qutebrowser" OFF "flatpak" "org.qutebrowser.qutebrowser"
    "ZM_FP" "Zoom" OFF "flatpak" "us.zoom.Zoom" "SK_FP" "Skype" OFF "flatpak" "com.skype.Client"
    "MS_FP" "Edge" OFF "flatpak" "com.microsoft.Edge" "OP_FP" "Opera" OFF "flatpak" "com.opera.Opera"
    "VIV_FP" "Vivaldi" OFF "flatpak" "com.vivaldi.Vivaldi" "TOR_APT" "Tor Browser" OFF "apt" "torbrowser-launcher"
    "MAIL_FP" "Mailspring" OFF "flatpak" "com.getmailspring.Mailspring" "SLK_FP" "Slack" OFF "flatpak" "com.slack.Slack"
    "WCD_FP" "WebCord (WhatsApp/Discord)" OFF "flatpak" "io.github.spacingbat3.webcord" "NEL_FP" "Element" OFF "flatpak" "im.riot.Riot"
)

L_OFFICE=(
    "LO_APT" "LibreOffice (APT)" OFF "apt" "libreoffice libreoffice-l10n-fr" "LO_FP" "LibreOffice (Flatpak)" OFF "flatpak" "org.libreoffice.LibreOffice"
    "OO_FP" "OnlyOffice" OFF "flatpak" "org.onlyoffice.desktopeditors" "ABI_APT" "AbiWord" OFF "apt" "abiword"
    "GNUM_APT" "Gnumeric" OFF "apt" "gnumeric" "XMN_FP" "XMind" OFF "flatpak" "net.xmind.XMind"
    "JOP_FP" "Joplin" OFF "flatpak" "net.cozic.joplin_desktop" "OBS_FP" "Obsidian" OFF "flatpak" "md.obsidian.Obsidian"
    "EV_APT" "Evince (PDF)" OFF "apt" "evince" "MAST_FP" "Master PDF Editor" OFF "flatpak" "com.elsevier.MasterPDFEditor"
    "CAL_APT" "Calibre" OFF "apt" "calibre" "SCR_APT" "Scribus" OFF "apt" "scribus"
    "ZOT_FP" "Zotero" OFF "flatpak" "org.zotero.Zotero" "XCHN_FP" "Xournal++" OFF "flatpak" "com.github.xournalpp.xournalpp"
    "WPS_FP" "WPS Office" OFF "flatpak" "com.wps.Office" "NOT_FP" "Notion" OFF "flatpak" "io.github.notion_repackaged.Notion"
    "FOLI_FP" "Foliate" OFF "flatpak" "com.github.johnfactotum.Foliate" "GNOT_APT" "Gnote" OFF "apt" "gnote"
)

L_GRAPHISME=(
    "GIMP_APT" "GIMP (APT)" OFF "apt" "gimp" "GIMP_FP" "GIMP (Flatpak)" OFF "flatpak" "org.gimp.GIMP"
    "INK_APT" "Inkscape" OFF "apt" "inkscape" "KRI_FP" "Krita" OFF "flatpak" "org.kde.krita"
    "BLN_FP" "Blender" OFF "flatpak" "org.blender.Blender" "DRW_FP" "Draw.io" OFF "flatpak" "com.jgraph.drawio.desktop"
    "DG_APT" "DigiKam" OFF "apt" "digikam" "DP_APT" "Darktable" OFF "apt" "darktable"
    "RM_FP" "RawTherapee" OFF "flatpak" "com.rawtherapee.RawTherapee" "PX_FP" "Pinta" OFF "flatpak" "com.github.PintaProject.Pinta"
    "FREE_FP" "FreeCAD" OFF "flatpak" "org.freecadweb.FreeCAD" "LIBRE_APT" "LibreCAD" OFF "apt" "librecad"
    "MYP_APT" "MyPaint" OFF "apt" "mypaint" "SWE_FP" "SweetHome3D" OFF "flatpak" "com.sweethome3d.Sweethome3d"
)

L_MULTIMEDIA=(
    "VLC_APT" "VLC (APT)" OFF "apt" "vlc" "VLC_FP" "VLC (Flatpak)" OFF "flatpak" "org.videolan.VLC"
    "MPV_APT" "MPV Player" OFF "apt" "mpv" "KDN_FP" "Kdenlive" OFF "flatpak" "org.kde.kdenlive"
    "OBS_S_FP" "OBS Studio" OFF "flatpak" "com.obsproject.Studio" "AUD_APT" "Audacity" OFF "apt" "audacity"
    "HB_FP" "Handbrake" OFF "flatpak" "fr.handbrake.ghb" "SP_FP" "Spotify" OFF "flatpak" "com.spotify.Client"
    "STR_FP" "Strawberry" OFF "flatpak" "io.github.strawberrymusicplayer.strawberry" "KOD_FP" "Kodi" OFF "flatpak" "tv.kodi.Kodi"
    "ARD_FP" "Ardour" OFF "flatpak" "org.ardour.Ardour" "LMMS_FP" "LMMS" OFF "flatpak" "io.lmms.LMMS"
    "MIX_FP" "Mixxx (DJ)" OFF "flatpak" "org.mixxx.Mixxx" "MUSE_FP" "MuseScore" OFF "flatpak" "org.musescore.MuseScore"
    "RYTH_APT" "Rhythmbox" OFF "apt" "rhythmbox" "CLE_APT" "Clementine" OFF "apt" "clementine"
    "SHT_FP" "Shotcut" OFF "flatpak" "org.shotcut.Shotcut" "PIT_APT" "Pitivi" OFF "apt" "pitivi"
)

L_DEV=(
    "VSC_FP" "VS Code" OFF "flatpak" "com.visualstudio.code" "VIM_APT" "Vim" OFF "apt" "vim"
    "GIT_APT" "Git" OFF "apt" "git" "PY_APT" "Python 3" OFF "apt" "python3"
    "GEA_APT" "Geany" OFF "apt" "geany" "DOCK_APT" "Docker.io" OFF "apt" "docker.io"
    "AND_FP" "Android Studio" OFF "flatpak" "com.google.AndroidStudio" "DP_FP" "DBeaver" OFF "flatpak" "io.dbeaver.DBeaverCommunity"
    "ARDU_FP" "Arduino IDE" OFF "flatpak" "cc.arduino.IDE2" "PYC_FP" "PyCharm CE" OFF "flatpak" "com.jetbrains.PyCharm-Community"
    "NOD_APT" "NodeJS" OFF "apt" "nodejs" "EMACS_APT" "Emacs" OFF "apt" "emacs"
    "POST_FP" "Postman" OFF "flatpak" "com.getpostman.Postman" "BLUE_APT" "Bluefish" OFF "apt" "bluefish"
)

L_SYSTEME=(
    "BT_APT" "Btop" OFF "apt" "btop" "GP_APT" "GParted" OFF "apt" "gparted"
    "TS_APT" "Timeshift" OFF "apt" "timeshift" "ST_FP" "Stacer" OFF "flatpak" "io.github.oguzhaninan.Stacer"
    "BB_APT" "BleachBit" OFF "apt" "bleachbit" "NF_APT" "Neofetch" OFF "apt" "neofetch"
    "GDU_APT" "Disques" OFF "apt" "gnome-disk-utility" "FLT_FP" "Flatseal" OFF "flatpak" "com.github.tchx84.Flatseal"
    "VIRT_APT" "Virt-Manager" OFF "apt" "virt-manager" "CPU_G" "CPU-X" OFF "apt" "cpu-x"
    "TERM_APT" "Terminator" OFF "apt" "terminator" "HTOP_APT" "Htop" OFF "apt" "htop"
    "ETCH_FP" "Etcher" OFF "flatpak" "io.balena.etcher" "BAO_APT" "Baobab" OFF "apt" "baobab"
)

L_EDU_JEUX=(
    "GC_FP" "GCompris" OFF "flatpak" "org.kde.gcompris" "STE_APT" "Stellarium" OFF "apt" "stellarium"
    "TX_APT" "TuxPaint" OFF "apt" "tuxpaint" "SCR_FP" "Scratch" OFF "flatpak" "edu.mit.Scratch"
    "ST_FP" "Steam" OFF "flatpak" "com.valvesoftware.Steam" "LT_FP" "Lutris" OFF "flatpak" "net.lutris.Lutris"
    "MC_FP" "Minecraft (Prism)" OFF "flatpak" "org.prismlauncher.PrismLauncher" "MT_APT" "Minetest" OFF "apt" "minetest"
    "STK_APT" "SuperTuxKart" OFF "apt" "supertuxkart" "RA_FP" "RetroArch" OFF "flatpak" "org.libretro.RetroArch"
    "TUX_APT" "SuperTux" OFF "apt" "supertux" "WES_APT" "Wesnoth" OFF "apt" "wesnoth"
)

# --- LOGIQUE DE NAVIGATION ---
declare -A CHOICES
STEP=1
TOTAL_STEPS=7

show_cat() {
    local title=$1
    local -n list=$2
    local current="${CHOICES[$STEP]}"
    local args=()

    local WT_HEIGHT=$(tput lines); [ $WT_HEIGHT -lt 22 ] && WT_HEIGHT=22
    local WT_WIDTH=$(tput cols); [ $WT_WIDTH -lt 110 ] && WT_WIDTH=110

    for ((i=0; i<${#list[@]}; i+=5)); do
        local id="${list[i]}"
        local state="OFF"
        [[ "$current" == *"$id"* ]] && state="ON"
        args+=("$id" "${list[i+1]}" "$state")
    done

    whiptail --title "$title ($STEP/$TOTAL_STEPS)" \
             --backtitle "Mega-Installer par Amaury (Blabla Linux) - Version $VERSION" \
             --ok-button "Suivant" \
             --cancel-button "Précédent" \
             --checklist "Espace pour cocher, Entrée pour Suivant, Echap pour Quitter" \
             $((WT_HEIGHT - 6)) $((WT_WIDTH - 10)) 12 \
             "${args[@]}" 3>&1 1>&2 2>&3
}

# --- BOUCLE PRINCIPALE ---
while [ $STEP -le $TOTAL_STEPS ]; do
    case $STEP in
        1) RESULT=$(show_cat "1. INTERNET" L_INTERNET); STAT=$? ;;
        2) RESULT=$(show_cat "2. BUREAUTIQUE" L_OFFICE); STAT=$? ;;
        3) RESULT=$(show_cat "3. GRAPHISME" L_GRAPHISME); STAT=$? ;;
        4) RESULT=$(show_cat "4. MULTIMÉDIA" L_MULTIMEDIA); STAT=$? ;;
        5) RESULT=$(show_cat "5. DÉVELOPPEMENT" L_DEV); STAT=$? ;;
        6) RESULT=$(show_cat "6. SYSTÈME" L_SYSTEME); STAT=$? ;;
        7) RESULT=$(show_cat "7. ÉDUCATION & JEUX" L_EDU_JEUX); STAT=$? ;;
    esac

    if [ $STAT -eq 0 ]; then
        CHOICES[$STEP]="$RESULT"
        ((STEP++))
    elif [ $STAT -eq 1 ]; then
        ((STEP--))
        [ $STEP -lt 1 ] && exit_script
    else
        exit_script
    fi
done

# --- RÉSUMÉ ET INSTALLATION ---
ALL_FINAL_CHOICES="${CHOICES[*]}"

if [[ -z "${ALL_FINAL_CHOICES// }" ]]; then
    whiptail --msgbox "Aucun logiciel sélectionné. Fin du script." 10 50
    exit 0
fi

whiptail --yesno "Lancer l'installation sur votre système Debian ?" 10 50 || exit_script

clear
echo "===================================================="
echo "    INSTALLATION EN COURS - BLABLA LINUX           "
echo "    Script Version : $VERSION                      "
echo "===================================================="

for c in $ALL_FINAL_CHOICES; do
    c=$(echo $c | sed 's/"//g')
    for l in L_INTERNET L_OFFICE L_GRAPHISME L_MULTIMEDIA L_DEV L_SYSTEME L_EDU_JEUX; do
        declare -n current_list=$l
        for ((i=0; i<${#current_list[@]}; i+=5)); do
            if [ "$c" == "${current_list[i]}" ]; then
                install_pkg "${current_list[i]}" "${current_list[i+3]}" "${current_list[i+4]}"
            fi
        done
    done
done

apt autoremove -y > /dev/null 2>&1
whiptail --title "Succès" --msgbox "Installation terminée ! Merci d'avoir utilisé les outils Blabla Linux (v$VERSION)." 10 60
