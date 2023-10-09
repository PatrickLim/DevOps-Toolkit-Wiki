Very import first step is to obtain the on-prem URL of the 3M instance installed PER CUSTOMER. Every WinAppLink is configured specifically for a customer. For example, Guadalupe GCH's url is http://192.168.1.233:8080

Obtain the WinAppLink installer from that url append /winapplink, for example for GCH use http://192.168.1.233:8080/winapplink

-----------------------------------------

install the WinAppLink msi:

[WinAppLink.zip](/.attachments/WinAppLink-34414c84-fdb8-4e55-a947-4b9cecb524c2.zip)

extract then run the msi and enter these values:

![image.png](/.attachments/image-5978d545-04f3-45c2-bf88-1cfb0e101bdb.png)

User Instance Folder = %USERPROFILE%\connections
URL = https://crs.3m.com/
Connections/Interface Bits = 1

drop the EncoderInf.ini file inside C:\Program Files (x86)\Insight\BIN here is a sample file from Guadalupe GCH (just remember to rename the extension from txt to ini):

[EncoderInf.txt](/.attachments/EncoderInf-b5c5c068-d478-4b6c-808b-eb940146ff22.txt)

The first time you launch WinAppLink it will download files from 3M:

![image.png](/.attachments/image-4f8a5793-5d9d-4b69-87ce-8f9eea6a4405.png)

Then it will ask for credentials:

![image.png](/.attachments/image-0f573cfd-8f41-4205-ab44-15668d17dfa0.png)

Use Medsphere r$}A=6d:_9G8

In regedit you will find a key called Computer\HKEY_LOCAL_MACHINE\SOFTWARE\3M\HIS\INTERFACE
In it there is a parameter called CodefindExeParams that should have the url of the 3m application.

![image.png](/.attachments/image-344cc380-9227-4fd0-b673-253223b2d8ba.png)
