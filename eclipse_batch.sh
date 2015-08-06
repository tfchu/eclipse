#!/bin/bash
#do sudo and input password to avoid future password input
echo "123456" | sudo -S ls

#install java
#Do you want to continue? [Y/n] shows 2 times after each install
#yes | xxx also ok
sudo apt-get update
echo "Y" | sudo apt-get install default-jre
echo "Y" | sudo apt-get install default-jdk

#Eclipse download, unzip and create shortcut
wget -O /home/test/Desktop/ "http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz"

sudo tar -xvzf eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -C /usr/local/

ln -s /usr/local/eclipse/eclipse /home/test/Desktop/eclipse

#Delete download
rm -f /home/test/Desktop/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz

#insert pydev auto-signed certificate
chmod +x ./add_pydev_certificate.py
sudo ./add_pydev_certificate.py

#install pydev (repo: http://pydev.org/updates)
sudo /usr/local/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://pydev.org/updates/ -destination /usr/local/eclipse -installIU org.python.pydev.feature.feature.group

#install CDT (repo: http://download.eclipse.org/tools/cdt/releases/8.7)
sudo /usr/local/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/mars/,http://download.eclipse.org/tools/cdt/releases/8.7 -destination /usr/local/eclipse -installIU org.eclipse.cdt.feature.group -installIU org.eclipse.cdt.sdk.feature.group -installIU org.eclipse.cdt.platform.feature.group -installIU org.eclipse.cdt.debug.ui.memory.feature.group -installIU org.eclipse.cdt.gnu.debug.feature.group -installIU org.eclipse.cdt.util.feature.group

#install shelled (repo: http://sourceforge.net/projects/shelled/files/shelled/update/)
#sudo /usr/local/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://sourceforge.net/projects/shelled/files/shelled/update/ -destination /usr/local/eclipse -installIU net.sourceforge.shelled.feature.group


