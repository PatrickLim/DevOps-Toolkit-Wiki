
# Detailed Summary thanks to Adam Chapweske

Summary from our meeting:

1) The error Jeff was running into was due to WebScanningHost.exe running on the server (msc-web.openvista.net) rather than on the VM that the web app is running on (rd01, etc.) It needs to be running on this latter VM so that it can use Parallels' Universal Scanning driver, which acts as a proxy to the scanner driver installed on the end-user workstation. 

2) So you need some way to launch WebScanningHost.exe that node that Chrome is running on. The solution we decided on was for Patrick to write a script that is run when the user begins their session. This script will execute "WebScanningHost.exe protocol=https port=20000-20100", then read the URL that WebScanningHost writes to its stdout. The script will then append this URL, as a (properly escaped) query parameter, to the RCM web app's URL and then pass this Chrome.exe. At this point, WebScanningHost will be running on the same machine as the web browser and their web app will have WebScanningHost's URL for connecting to when needed.

3) One issue you'll run into with this is that when WebScanningHost.exe launches, it displays its own little UI. RCM's web scanning would still work with this being displayed, but if the user were to ever click Cancel on that UI then WebScanningHost would exit and RCM wouldn't be able to scan until the user started a new session (also, having that UI appear the entire time RCM is open would be confusing to the user). I will address this by adding support for another command line argument to WebScanningHost.exe to tell it to now show that UI. As discussed, the downside to this is that you may find that when your users try to scan the driver-specific scanning dialog may appear behind other windows. Or at least, this is a problem we ran into in CareVue and is why we added that UI to WebScanningHost.exe. But the RCM team is comfortable with that so we won't do anything further to address it at this time.

-Adam


_Quick summary of development session on 8/5/2020 resulting in a **temporary fix** to launch RCM web services and LEADTOOLS web scanning features via Parallels portal links._


- launch webscanhost
- return URL and Port
- Launch Chrome RCM URL with parameter of webscanhost
- https://msc-web.openvista.net: 21501 + the return from webscanhost URL/Port

- Matt needs range of Ports 20000 -> 20100 to whitelist - currently configurable in RCM
- Adam to add Flag to webscanninghost to hide UI

