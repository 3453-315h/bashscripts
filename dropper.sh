#!/bin/sh
#
# Name: dropper.sh
# Auth: Frank Cass
# Date: 20151231
# Desc: Quick installation script for pentest tools
#
#	TODO: Implement Quiet git clone and wget
#	TODO: Setup bashrc, including alias / export, $PATH - Currently separate reference scripts
#	TODO: Prompt for input of other config files (read input for terminator config, ~/.ssh/config, /etc/hosts)
#	TODO: Combine with welcome screen / aesthestics config scripts
#
###

echo "[*] dropper.sh"
echo "[*] Desc: Quick installation script for common pentest tools."
read -p "[*] Where to install tools to? [Ex. /root/scripts]" install
mkdir -p $install; cd $install
echo "[*] Installing bashscripts"
git clone https://github.com/routeback/bashscripts.git
echo "[*] Installing Responder"
git clone https://github.com/SpiderLabs/Responder.git
echo "[*] Installing CredCrack"
git clone https://github.com/gojhonny/CredCrack.git
echo "[*] Installing InSpy"
wget -O InSpy.py https://raw.githubusercontent.com/gojhonny/Pentesting-Scripts/master/InSpy.py
echo "[*] Installing PwnPaste"
git clone https://github.com/gojhonny/pwnpaste.git
echo "[*] Installing Blacksheepwall"
git clone https://github.com/tomsteele/blacksheepwall.git
echo "[*] Installing Powershell Empire"
git clone https://github.com/PowerShellEmpire/Empire.git
echo "[*] Installing RIDEnum"
git clone https://github.com/trustedsec/ridenum.git
echo "[*] Installing IkeForce"
git clone https://github.com/SpiderLabs/ikeforce.git
echo "[*] Installing SSLyze"
git clone https://github.com/iSECPartners/sslyze.git
echo "[*] Installing SSLScan"
git clone https://github.com/rbsec/sslscan.git
echo "[*] Installing Nikto"
git clone https://github.com/sullo/nikto.git
echo "[*] Installing Impacket"
git clone https://github.com/CoreSecurity/impacket.git
echo "[*] Installing rdp-sec-check"
git clone https://github.com/portcullislabs/rdp-sec-check.git
# Potential Req and additional setup required:  perl -MCPAN -e "install Convert::BER"
echo "[*] Installing Veil"
git clone https://github.com/Veil-Framework/Veil
cd Veil; ./Install.sh -c; echo "[*] Veil Setup Complete"
echo "[*] Done"
