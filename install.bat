wpeinit
net use r: "\\Wspdc01\reminst\UEFI" /user:Administrator Password123.
diskpart /s diskpart.script
call DISM /Apply-Image /ImageFile:R:\Install.wim /Index:1 /ApplyDir:W:\ /Apply-Unattend:R:\REMINST\UEFI\unattend.xml
w:\WINDOWS\SYSTEM32\BCDBOOT w:\WINDOWS /s s: /f all