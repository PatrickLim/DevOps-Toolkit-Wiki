Strange error with SSRS installed on Windows 2022, in particular ap03w1-gch for Guadalupe.

Fresh navigation to the reportserver url resulted in "ERR_HTTP2_PROTOCOL_ERROR" until navigating in that same browser session to the reports url. Then navigating back to the reportserver url was fine. But it always happens on a new browser session!

The solution was to go into regedit and disable HTTP2 on the SSRS server ONLY. Then reboot the SSRS server. For Guadalupe I did this ONLY on ap03w1-gch then rebooted; after rebooting ap03w1-gch the SSRS pages started loading properly on the RD nodes without having to do anything to the RD nodes.

https://techcommunity.microsoft.com/t5/sql-server/open-reportserver-webservice-url-with-https-leads-to-an-err/m-p/3761967

https://stackoverflow.com/questions/44660634/how-to-disable-http-2-on-iis-of-windows-server-2016