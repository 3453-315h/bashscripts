#!/bin/bash
#
# Name: geckodriver_update.sh
# Auth: Frank Cass
# Date: 20190524
# Desc: A script to backup your geckodriver installation and replace it with the latest version from Mozilla.
# 	Script origin from: https://askubuntu.com/a/928514
#
###

echo "[*] $0"

if ! [ $(id -u) = 0 ]; then
	echo "[!] Script must be run as root!"
	exit 1
fi

# Check if jq is installed to parse the github API output to retrieve the latest version of geckodriver

which jq &>/dev/null

if [[ $? -ne 0 ]]; then
	echo "[!] jq is not installed! Install it then try again."
	echo "[*] Try: sudo apt install -y jq"
	exit 1
fi

# Ensure we can access github.com before proceeding

echo "[*] Testing connectivity to Github.com"
if curl -s I --connect-timeout 10 "https://github.com" &>/dev/null
then
	echo "[*] Github is accessible, proceeding."
else
	echo "[!] Github is not accessible."
	exit 1
fi

# Check if geckodriver is already installed, print the current version and make a backup.

which geckodriver &>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[!] No previous installation of geckodriver found!"
    echo "[*] Setting installation directory to /usr/sbin/"
    INSTALL_DIR=/usr/sbin/
    else
    VERSION=$(geckodriver -V | head -n 1)
    echo "[*] Your version of geckodriver is: $VERSION"
    INSTALL_DIR=$(which geckodriver | sed 's/\/geckodriver//g')
    echo "[*] Backing up $INSTALL_DIR/geckodriver as $INSTALL_DIR/geckodriver.old"
    mv $(which geckodriver) $(which geckodriver).old
fi

echo "[*] Fetching latest version information from github."
json=$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest)

# Detect the architecture

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]
then
	echo "[*] 64-bit architecture identified."
	url=$(echo "$json" | jq -r '.assets[].browser_download_url | select(contains("linux64"))')
else
        echo "[*] 32-bit architecture identified."
	url=$(echo "$json" | jq -r '.assets[].browser_download_url | select(contains("linux32"))')
fi

# Pull the new driver

echo "[*] Downloading latest version and extracting it."
curl --progress-bar -s -L "$url" | tar -xz

echo "[*] Adding executable bit and moving geckodriver."
chmod +x geckodriver
sudo mv geckodriver "$INSTALL_DIR"
ln -s /usr/sbin/geckodriver /usr/bin/geckodriver &>/dev/null

echo "[*] Installed geckodriver binary in $INSTALL_DIR."
echo "[*] Your version of geckodriver is: $(geckodriver -V | head -n 1)"
