#Fabula Tech

On the vm, enable camera (in Settings search for Camera) then make sure the following regedits are in place:

https://www.fabulatech.com/forum/board-webcamrdp-action-display-num-509042594.html

A technological change made in Windows 10 Anniversary Update caused a problem where Webcam for Remote Desktop failed to work. To apply workaround, launch regedit and create a REG_DWORD values named EnableFrameServerMode with the value 0 in the following registry locations:
 
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Media Foundation\Platform
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation\Platform