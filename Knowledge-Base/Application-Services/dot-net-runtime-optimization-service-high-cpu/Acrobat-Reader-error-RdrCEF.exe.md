https://community.adobe.com/t5/acrobat-reader-discussions/rdrcef-exe-application-error-when-opening-reader/td-p/7380808


`\\openvista.net\adm$\Software\Adobe\Reader\Adobe Refresh Manager`

1-23-2024 Patrick Lim

The latest Acrobat version 23 was throwing errors for SBC so I uninstalled that and installed the older stabler version 20. To prevent automatic updates, I also Disabled the Adobe Update Service in Windows Services.

Things were fine for rd01e1-sbc and rd02e1-sbc. But rd03e1-sbc kept re-enabling both the Windows Service and the Windows Scheduled Task.

It turned out that the difference between rd03 and the other two nodes, was that inside the "C:\Program Files (x86)\Common Files\Adobe\ARM\1.0" folder there was a Cache folder that contained this msi file. I deleted that Cache folder and this msi file in it, hoping that the Adobe Updater will finally stop recurring on rd03e1-sbc.

1-25-2024 Patrick Lim

What actually needed to happen was to run this msi, then select Remove. That fully uninstalled the Adobe Refresh Manager. rd03e1-sbc is finally no longer running ARM and updating Acrobat.
