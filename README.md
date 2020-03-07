# uefihttpboot
Way to install windows 10 .wim images under UEFI for HTTP with iPXE/wimboot/winPE. Created for network deployment of new computers with UEFI 2.5 and higher because WDS does not have that option yet.
It will deploy any install.wim image with unatended.xml.

Expect turbulences this is far from finished generic way to deploy.

# Prerequisities
1. WinPE boot.wim image with network drivers for your computer (if you are lucky enought they are allready there)
2. Install.wim image with windows
3. Everything inside this repository is hardcoded in case that something is not working for you then try to modify it to your specific needs more generic version will be maybe added later
4. server should be 10.0.10.1 and have DNS, DHCP, HTTP, SAMBA services up and running it can run on any linux or windows based machine
5. Install wireshark so you are able to debug this madness (optional)

# Cook book
1. install and setup DHCP Server with chainload of iPXE - https://ipxe.org/howto/msdhcp#pxe_chainloading
2. install nginx/IIS/apache2 to provide http endpoint for install images - https://ipxe.org/howto/winpe
3. clone this repository and put it into root/UEFI folder of nginx/IIS
4. create network share for same folder install.wim / unatended.xml (been using WDS default folder C:/Remoteinstall for this)
5. create winPE boot.wim with this tutorial https://ipxe.org/howto/winpe and include network drivers in case they are needed
6. human sacrifice
7. observe results with wireshark and in case that something is wrong 

# How it works
1. system will download ipxe.efi from http endpoint and boot from it
2. ipxe will then download script undionly.ipxe and execute whats inside it
3. this will download boot.wim and other required parts (winpeshl.ini, install.bat) for WinPE to boot
4. WinPE then execute install.bat which does following
  a. repartition HDD/SSD to prepare it for install
  b. use dism.exe to unpack install.wim to HDD/SSD windows partition
  c. run bcdboot to create boot information
  d. restart
  
# License
There are binaries from microsoft and ipxe on this repository, all rights to their corresponding owners

