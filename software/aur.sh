#!/bin/bash

echo
echo "INSTALLING SOFTWARE FROM THE AUR"
echo

PKGS=(

    # STORE -------------------------------------------------------------------

    'pamac-aur'                 # App Store

    # SYSTEM UTILITIES --------------------------------------------------------

    'timeshift'                 # Backup
    'grub-customizer'           # A graphical grub2 settings manager
    'digimend-kernel-drivers-dkms' # Graphics tablets kernel modules
    'rclone-browser'            # Simple cross-platform GUI for rclone
    'konsave'                   # Save and apply your KDE Plasma customizations

    'pureref'                   # Reference Image Viewer
    'zoom'


    # CUSTOMIZATION -----------------------------------------------------------

    'lightly-qt'                # Nice Application Style
    'spotify'                   # Spotify
    'spotify-adblock-git'       # Spotify (No ads version)d
    'kwin-effects-blur-respect-rounded-decorations-git'
    'plasma5-applets-virtual-desktop-bar-git'
    'ttf-ms-fonts'
    'ttf-google-fonts-git'

    # Terminal

    'zsh-syntax-highlighting'
    'zsh-autosuggestions'
    'zsh-completions'
    'ttf-meslo-nerd-font-powerlevel10k'



    # GAMING ------------------------------------------------------------------

    'yuzu-early-access'         # Switch Emulator
    'emusak-bin'                # Shaders Firmware and Keys
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    yay -S "$PKG" --noconfirm --removemake
done

fc-cache -f -v

echo
echo "D O N E !!"
echo
