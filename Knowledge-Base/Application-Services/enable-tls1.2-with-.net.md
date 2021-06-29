Hi Amanda,

I have been researching the Upload Image error with my Dev team, and it seems the web server at ohs-rcmwebdev1 does not have TLS 1.2 enabled:

![image.png](/.attachments/image-929ed472-11dd-4217-abe6-834bdda952b7.png)

`[Net.ServicePointManager]::SecurityProtocol`

I have made the following registry entries (adding the TLS 1.1 and TLS 1.2 entries) in ohs-rcmwebdev1 HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols  to address this issue:

![image.png](/.attachments/image-2c489a50-3c31-4076-a8dd-44541d8a58ab.png)