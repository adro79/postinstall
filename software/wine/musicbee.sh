#!/bin/bash

WINE=(

    'wine-staging'
    'winetricks'


    # Dependencies

    'zenity'

    'alsa-lib'
    'alsa-plugins'
    'lib32-alsa-lib'
    'lib32-alsa-plugins'
    'lib32-gnutls'
    'lib32-libpulse'

)

for PKG in "${WINE[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done


# SET UP WINE PREFIX AND DEPENDENCIES -----------------------------------------

    mkdir ~/.wineprefix
    WINEPREFIX=/home/adro/.wineprefix/Musicbee/ WINEARCH=win32 wine wineboot
    WINEPREFIX=/home/adro/.wineprefix/Musicbee/ winetricks -q dotnet48 dotnet461 xmllite gdiplus


# MUSICBEE INSTALLATION

    mkdir tmp
    cd tmp
    wget https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/multimedia/MusicBeeSetup_3_4_Update2.zip

    unzip $(ls | grep .zip)
    echo 'Executing Musicbee Installer..'
    WINEPREFIX=/home/adro/.wineprefix/Musicbee/ wine $(ls | grep .exe)

    echo "alias Musicbee='WINEPREFIX=/home/adro/.wineprefix/Musicbee/ wine /home/adro/.wineprefix/Musicbee/drive_c/Program\ Files/MusicBee/MusicBee.exe'" >> ~/.bashrc

    cd ..
    sudo rm -r tmp/


echo
echo "D O N E !!"
echo
