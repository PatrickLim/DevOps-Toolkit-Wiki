
_Quick summary of development session on 8/5/2020 resulting in a **temporary fix** to launch RCM web services and LEADTOOLS web scanning features via Parallels portal links._


- launch webscanhost
- return URL and Port
- Launch Chrome RCM URL with parameter of webscanhost
- https://msc-web.openvista.net: 21501 + the return from webscanhost URL/Port

- Matt needs range of Ports 20000 -> 20100 to whitelist - currently configurable in RCM
- Adam to add Flag to webscanninghost to hide UI
