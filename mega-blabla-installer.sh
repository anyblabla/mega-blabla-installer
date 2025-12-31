#!/bin/bash

# ==============================================================================
# Script    : Mega-Installer BlablaLinux (FULL 130+ Logiciels)
# Version   : 0.1.7-BETA
# Mode      : Style Debian & Correction Rendu (FIX COMPLET + VISIBILITÉ UPDATE)
# Auteur    : Amaury aka BlablaLinux (https://link.blablalinux.be)
# Expertise : Debian, Ubuntu, Linux Mint, Proxmox
# ==============================================================================

VERSION="0.1.7-BETA"

# --- A Classer ---

exit_script() {
    clear
    echo -e "\n\e[33m[!] Script arrêté. À bientôt sur Blabla Linux (https://link.blablalinux.be) !\e[0m\n"
    exit 0
}
trap exit_script SIGINT

if [ "$EUID" -ne 0 ]; then 
    echo -e "\e[31mErreur : Ce script doit être lancé avec sudo.\e[0m"
    exit 1
fi

# --- CONFIGURATION DES DIMENSIONS ---
calc_dims() {
    TERM_WIDTH=$(tput cols)
    TERM_HEIGHT=$(tput lines)
    WT_WIDTH=80
    [ $TERM_WIDTH -lt 80 ] && WT_WIDTH=$((TERM_WIDTH - 2))
    WT_HEIGHT=$(( TERM_HEIGHT * 85 / 100 ))
    [ $WT_HEIGHT -lt 22 ] && WT_HEIGHT=22
    WT_LIST_HEIGHT=$(( WT_HEIGHT - 8 ))
}

# --- FONCTIONS DE DÉTECTION ET GESTION ---
check_installed() {
    local method=$1; local pkg=$2; local id=$3
    if [ "$method" == "apt" ]; then
        local first_pkg=$(echo $pkg | awk '{print $1}')
        if dpkg-query -W -f='${Status}' "$first_pkg" 2>/dev/null | grep -q "ok installed"; then return 0; fi
        if command -v "$first_pkg" >/dev/null 2>&1; then return 0; fi
        if [[ "$id" == "LO_APT" ]] && command -v libreoffice >/dev/null 2>&1; then return 0; fi
    else
        if flatpak info "$pkg" > /dev/null 2>&1; then return 0; fi
    fi
    return 1
}

manage_pkg() {
    local id=$1; local method=$2; local pkg=$3
    if [ "$ACTION" == "INSTALL" ]; then
        echo -e "\e[32m📦 Installation de $id ($method)...\e[0m"
        [ "$method" == "apt" ] && apt install -y $pkg || flatpak install flathub -y --noninteractive $pkg
    else
        echo -e "\e[31m🗑️ Désinstallation de $id ($method)...\e[0m"
        [ "$method" == "apt" ] && apt purge -y $pkg || flatpak uninstall -y $pkg
    fi
}

# --- LISTES DES LOGICIELS COMPLETES (130+ Logiciels) ---

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
    "ANY_FP" "AnyDesk" OFF "flatpak" "com.anydesk.Anydesk" "RST_FP" "RustDesk" OFF "flatpak" "com.rustdesk.RustDesk"
    "REM_APT" "Remmina" OFF "apt" "remmina" "TUV_FP" "Tutanota" OFF "flatpak" "de.tutanota.Tutanota"
    "NEXT_FP" "Nextcloud Desktop" OFF "flatpak" "com.nextcloud.desktopclient.nextcloud" "DROP_FP" "Dropbox" OFF "flatpak" "com.dropbox.Client"
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
    "KPR_APT" "KPresenter" OFF "apt" "kpresenter" "KT_APT" "Krita" OFF "apt" "krita"
    "XCD_APT" "XChat" OFF "apt" "xchat" "ZIM_APT" "Zim Desktop" OFF "apt" "zim"
    "PLAN_FP" "GNOME Planner" OFF "flatpak" "org.gnome.Planner" "CHRON_FP" "Chronometer" OFF "flatpak" "com.github.phyne.chronometer"
)

L_GRAPHISME=(
    "GIMP_APT" "GIMP (APT)" OFF "apt" "gimp" "GIMP_FP" "GIMP (Flatpak)" OFF "flatpak" "org.gimp.GIMP"
    "INK_APT" "Inkscape" OFF "apt" "inkscape" "KRI_FP" "Krita" OFF "flatpak" "org.kde.krita"
    "BLN_FP" "Blender" OFF "flatpak" "org.blender.Blender" "DRW_FP" "Draw.io" OFF "flatpak" "com.jgraph.drawio.desktop"
    "DG_APT" "DigiKam" OFF "apt" "digikam" "DP_APT" "Darktable" OFF "apt" "darktable"
    "RM_FP" "RawTherapee" OFF "flatpak" "com.rawtherapee.RawTherapee" "PX_FP" "Pinta" OFF "flatpak" "com.github.PintaProject.Pinta"
    "FREE_FP" "FreeCAD" OFF "flatpak" "org.freecadweb.FreeCAD" "LIBRE_APT" "LibreCAD" OFF "apt" "librecad"
    "MYP_APT" "MyPaint" OFF "apt" "mypaint" "SWE_FP" "SweetHome3D" OFF "flatpak" "com.sweethome3d.Sweethome3d"
    "COL_APT" "Gpick (Colors)" OFF "apt" "gpick" "FONT_APT" "Font-manager" OFF "apt" "font-manager"
    "SHOT_APT" "Shotwell" OFF "apt" "shotwell" "FLAM_APT" "Flameshot" OFF "apt" "flameshot"
    "NOM_FP" "Nomacs" OFF "flatpak" "org.nomacs.ImageLounge"
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
    "EL_FP" "Elisa" OFF "flatpak" "org.kde.elisa" "LBR_FP" "Lollypop" OFF "flatpak" "org.gnome.Lollypop"
    "CHE_APT" "Cheese (Webcam)" OFF "apt" "cheese" "GUV_APT" "Guvview" OFF "apt" "guvcview"
    "QMMP_FP" "Qmmp" OFF "flatpak" "com.ylsoftware.qmmp.Qmmp" "KNC_FP" "Kamoso" OFF "flatpak" "org.kde.kamoso"
)

L_DEV=(
    "VSC_FP" "VS Code" OFF "flatpak" "com.visualstudio.code" "VIM_APT" "Vim" OFF "apt" "vim"
    "GIT_APT" "Git" OFF "apt" "git" "PY_APT" "Python 3" OFF "apt" "python3"
    "GEA_APT" "Geany" OFF "apt" "geany" "DOCK_APT" "Docker.io" OFF "apt" "docker.io"
    "AND_FP" "Android Studio" OFF "flatpak" "com.google.AndroidStudio" "DP_FP" "DBeaver" OFF "flatpak" "io.dbeaver.DBeaverCommunity"
    "ARDU_FP" "Arduino IDE" OFF "flatpak" "cc.arduino.IDE2" "PYC_FP" "PyCharm CE" OFF "flatpak" "com.jetbrains.PyCharm-Community"
    "NOD_APT" "NodeJS" OFF "apt" "nodejs" "EMACS_APT" "Emacs" OFF "apt" "emacs"
    "POST_FP" "Postman" OFF "flatpak" "com.getpostman.Postman" "BLUE_APT" "Bluefish" OFF "apt" "bluefish"
    "SUB_FP" "Sublime Text" OFF "flatpak" "com.sublimetext.three" "SQL_APT" "SQLite Browser" OFF "apt" "sqlitebrowser"
    "PO_APT" "Poedit" OFF "apt" "poedit" "GITK_APT" "GitKraken" OFF "flatpak" "com.axosoft.GitKraken"
    "MELT_APT" "Meld (Diff)" OFF "apt" "meld" "KDEV_FP" "KDevelop" OFF "flatpak" "org.kde.kdevelop"
    "INS_FP" "Insomnia" OFF "flatpak" "rest.insomnia.Insomnia" "FILE_APT" "Filelight" OFF "apt" "filelight"
)

L_SYSTEME=(
    "BT_APT" "Btop" OFF "apt" "btop" "GP_APT" "GParted" OFF "apt" "gparted"
    "TS_APT" "Timeshift" OFF "apt" "timeshift" "ST_FP" "Stacer" OFF "flatpak" "io.github.oguzhaninan.Stacer"
    "BB_APT" "BleachBit" OFF "apt" "bleachbit" "NF_APT" "Neofetch" OFF "apt" "neofetch"
    "GDU_APT" "Disques" OFF "apt" "gnome-disk-utility" "FLT_FP" "Flatseal" OFF "flatpak" "com.github.tchx84.Flatseal"
    "VIRT_APT" "Virt-Manager" OFF "apt" "virt-manager" "CPU_G" "CPU-X" OFF "apt" "cpu-x"
    "TERM_APT" "Terminator" OFF "apt" "terminator" "HTOP_APT" "Htop" OFF "apt" "htop"
    "ETCH_FP" "Etcher" OFF "flatpak" "io.balena.etcher" "BAO_APT" "Baobab" OFF "apt" "baobab"
    "GRUB_APT" "Grub Customizer" OFF "apt" "grub-customizer" "GDEB_APT" "Gdebi" OFF "apt" "gdebi"
    "CONKY_APT" "Conky All" OFF "apt" "conky-all" "RK_APT" "Rkhunter" OFF "apt" "rkhunter"
    "CLAM_APT" "ClamAV" OFF "apt" "clamav clamtk" "IPSC_APT" "Ipcalc" OFF "apt" "ipcalc"
    "NMAP_APT" "Nmap" OFF "apt" "nmap" "WIRES_APT" "Wireshark" OFF "apt" "wireshark"
    "TMUX_APT" "Tmux" OFF "apt" "tmux" "MC_APT" "Midnight Commander" OFF "apt" "mc"
    "PROX_TOOL" "Proxmox Tool" OFF "apt" "pve-manager" "BTR_APT" "Btrfs-progs" OFF "apt" "btrfs-progs"
)

L_EDU_JEUX=(
    "GC_FP" "GCompris" OFF "flatpak" "org.kde.gcompris" "STE_APT" "Stellarium" OFF "apt" "stellarium"
    "TX_APT" "TuxPaint" OFF "apt" "tuxpaint" "SCR_FP" "Scratch" OFF "flatpak" "edu.mit.Scratch"
    "ST_FP" "Steam" OFF "flatpak" "com.valvesoftware.Steam" "LT_FP" "Lutris" OFF "flatpak" "net.lutris.Lutris"
    "MC_FP" "Minecraft (Prism)" OFF "flatpak" "org.prismlauncher.PrismLauncher" "MT_APT" "Minetest" OFF "apt" "minetest"
    "STK_APT" "SuperTuxKart" OFF "apt" "supertuxkart" "RA_FP" "RetroArch" OFF "flatpak" "org.libretro.RetroArch"
    "TUX_APT" "SuperTux" OFF "apt" "supertux" "WES_APT" "Wesnoth" OFF "apt" "wesnoth"
    "OPEN_FP" "OpenTTD" OFF "flatpak" "org.openttd.OpenTTD" "0AD_APT" "0 A.D." OFF "apt" "0ad"
    "WAR_APT" "Warzone 2100" OFF "apt" "warzone2100" "KDE_EDU" "Pack KDE Edu" OFF "apt" "kde-edu"
    "GANA_APT" "GanttProject" OFF "apt" "ganttproject" "LOG_FP" "Logisim-evolution" OFF "flatpak" "com.github.reds.LogisimEvolution"
)

# --- NAVIGATION ---
declare -A CHOICES
STEP=1
TOTAL_STEPS=7

show_cat() {
    local title=$1; local -n list=$2; local current="${CHOICES[$STEP]}"; local args=()
    calc_dims
    
    for ((i=0; i<${#list[@]}; i+=5)); do
        local id="${list[i]}"; local display="${list[i+1]}"; local method="${list[i+3]}"; local pkg="${list[i+4]}"; local state="OFF"
        if check_installed "$method" "$pkg" "$id"; then display="$display [INSTALLÉ]"; fi
        [[ "$current" == *"$id"* ]] && state="ON"
        args+=("$id" "$display" "$state")
    done

    whiptail --title "$title ($STEP/$TOTAL_STEPS)" \
             --backtitle "Mega-Installer Blabla Linux v$VERSION - Expert : Amaury Libert" \
             --ok-button "Suivant" --cancel-button "Précédent" --checklist \
             "Espace pour cocher, Entrée pour valider." \
             $WT_HEIGHT $WT_WIDTH $WT_LIST_HEIGHT "${args[@]}" 3>&1 1>&2 2>&3
}

# --- MAIN ---
# 1. On affiche d'abord le rafraîchissement des dépôts SANS masquer le retour
clear
echo -e "\e[34m🚀 Mise à jour système (Rafraîchissement des dépôts)...\e[0m"
apt update 

# 2. On passe ensuite aux menus
calc_dims
ACTION=$(whiptail --title "Mega-Installer BlablaLinux" \
    --backtitle "Expertise Debian - Amaury Libert (Blabla Linux)" \
    --menu "Mise à jour terminée. Que souhaitez-vous faire ?" 15 $WT_WIDTH 2 \
    "INSTALL" "Installer des logiciels (Sélection manuelle)" \
    "REMOVE" "Désinstaller des logiciels (Nettoyage)" 3>&1 1>&2 2>&3)
[ $? -ne 0 ] && exit_script

while [ $STEP -le $TOTAL_STEPS ]; do
    case $STEP in
        1) RESULT=$(show_cat "1. INTERNET & CLOUD" L_INTERNET); STAT=$? ;;
        2) RESULT=$(show_cat "2. BUREAUTIQUE & NOTES" L_OFFICE); STAT=$? ;;
        3) RESULT=$(show_cat "3. GRAPHISME & DESIGN" L_GRAPHISME); STAT=$? ;;
        4) RESULT=$(show_cat "4. MULTIMÉDIA & CRÉATION" L_MULTIMEDIA); STAT=$? ;;
        5) RESULT=$(show_cat "5. DÉVELOPPEMENT & CODE" L_DEV); STAT=$? ;;
        6) RESULT=$(show_cat "6. SYSTÈME & ADMIN" L_SYSTEME); STAT=$? ;;
        7) RESULT=$(show_cat "7. ÉDUCATION & JEUX" L_EDU_JEUX); STAT=$? ;;
    esac
    if [ $STAT -eq 0 ]; then CHOICES[$STEP]="$RESULT"; ((STEP++))
    elif [ $STAT -eq 1 ]; then ((STEP--)); [ $STEP -lt 1 ] && exit_script
    else exit_script; fi
done

ALL_FINAL_CHOICES="${CHOICES[*]}"
if [[ -z "${ALL_FINAL_CHOICES// }" ]]; then exit 0; fi

whiptail --yesno "Confirmer l'opération ?" 10 60 || exit_script

clear
echo "🛠️  Exécution : $ACTION..."
for c in $ALL_FINAL_CHOICES; do
    c=$(echo $c | sed 's/"//g')
    for l in L_INTERNET L_OFFICE L_GRAPHISME L_MULTIMEDIA L_DEV L_SYSTEME L_EDU_JEUX; do
        declare -n current_list=$l
        for ((i=0; i<${#current_list[@]}; i+=5)); do
            if [ "$c" == "${current_list[i]}" ]; then manage_pkg "${current_list[i]}" "${current_list[i+3]}" "${current_list[i+4]}"; fi
        done
    done
done

[ "$ACTION" == "REMOVE" ] && apt autoremove -y > /dev/null 2>&1
whiptail --title "Succès" --msgbox "Terminé ! (v$VERSION)" 10 60