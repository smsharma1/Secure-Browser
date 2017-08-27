#!/bin/sh

export SecureBrowser=$(pwd)

sudo cp start.sh /usr/bin/secure-firefox

sudo cp secure_firefox.desktop /usr/share/applications

sudo cp secure-browser.sh /usr/bin/secure-firefox-support-file

sudo desktop-file-install /usr/share/applications/secure_firefox.desktop

sudo xdg-settings set default-web-browser secure_firefox.desktop

sudo docker build -t firefox $SecureBrowser