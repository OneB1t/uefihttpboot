# uefihttpboot
Way to install UEFI images for HTTP with iPXE and wimboot. Created for network deployment of new computers with UEFI over 2.5 and because WDS does not have that option yet.
It will deploy any install.wim image with unatended.xml 

# prerequisties
Prerequisities: WinPE with network drivers for your computer (if you are lucky enought they are allready there)
Install wireshark so you are able to debug this madness

1. install and setup DHCP Server
2. install nginx/IIS to provide http endpoint for install images
3. create network share for install.wim / unatended.xml
4. create winPE boot.wim with this tutorial https://ipxe.org/howto/winpe and include network drivers in case they are needed
5. download iPXE and wimboot

