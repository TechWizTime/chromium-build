#!/bin/bash

echo -e "\n*******************************************************************"
echo -e "Welcome to the Netflix Launcher Installer Script for Raspbian Pixel"
echo -e "*******************************************************************\n"
echo -e "Make sure you have subscribed to youtube.com/TechWizTime :)"
echo -e "\nIf you need to exit, do it now by pressing CTRL+C otherwise\n\n\n"
read -n 1 -s -p "Press anykey to continue"


echo -e "\n************************************************"
echo -e "PHASE ONE: Remove all traces of Chromium Browser"
echo -e "************************************************\n"
sudo apt-get purge chromium
sudo apt-get autoremove
echo -e "\nDONE!!\n"

echo -e "\n**********************************************"
echo -e "PHASE TWO: Download Pre-built Chromium Browser"
echo -e "**********************************************\n"
wget https://github.com/kusti8/chromium-build/releases/download/netflix-1.0.0/chromium-browser_56.0.2924.84-0ubuntu0.14.04.1.1011.deb
echo -e "\nDONE!!\n"

echo -e "\n**************************************"
echo -e "PHASE THREE: Install Netflix Launcher"
echo -e "**************************************\n"
sudo dpkg -i chromium-browser_56.0.2924.84-0ubuntu0.14.04.1.1011.deb
echo -e "\nDONE!!\n"

echo -e "\n**************************************"
echo -e "PHASE FOUR: Install Any missing Components"
echo -e "**************************************\n"
sudo apt-get -f install -y

echo -e "\n\n\n***************************************************************"
echo -e "REMOVE, INSTALL and SETUP Script for Netflix Launcher completed"
echo -e "***************************************************************\n\n\n"

echo -e "\nIf you don't want to reboot now, press N\n"

read -p "Reboot Now (y/n)?" choice
case "$choice" in 
  y|Y ) shutdown -r now;;
  n|N ) exit 1;;
  * ) echo "invalid";;
esac
