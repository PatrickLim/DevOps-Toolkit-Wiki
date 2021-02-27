# 1. Power Query Training Dry Run Feedback
CareVue EPI = RCM URN - unfortunately, the data types do not match and can make cross-product analytics more difficult.
[Link to MSC PBIX Teams Channel conversation](https://teams.microsoft.com/l/message/19:f427c4c31bc445be9cb53082c5307030@thread.skype/1597162816664?tenantId=c4f36ff1-f16e-4d33-a798-19261dec740a&groupId=51c86c27-c1ed-40dd-ab44-34964ca7d50f&parentMessageId=1597162816664&teamName=MSC%20PBIX&channelName=General&createdTime=1597162816664)

# 2. THE Global SPN Script
I dunno, something like this... don't laugh too hard at the `virtual web resources` section ;-)

```
# set variables for AAT virtual web resources
# ---
# ---
Set-Variable -Name "RCMWebServer" -Value "wb01e1-aat"
Set-Variable -Name "RCMWebServerFQDN" -Value "wb01e1-aat.openvista.net"
Set-Variable -Name "RCMWebApp" -Value "openvista\aatrcmwebapp"
Set-Variable -Name "RCMMaint" -Value "openvista\aatrcmmaint"

Get-Variable -Name "RCMWebServer"
setspn -L $RCMWebServer

Get-Variable -Name "RCMWebServerFQDN"
#setspn -L $RCMWebServerFQDN

Get-Variable -Name "RCMWebApp"
setspn -L $RCMWebApp
setspn -U -S https/$RCMWebServer $RCMWebApp

setspn -U -S https/$RCMWebServerFQDN":21500" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21501" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21502" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21503" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21504" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21505" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21506" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21507" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21508" $RCMWebApp
setspn -U -S https/$RCMWebServerFQDN":21509" $RCMWebApp
# ---
Get-Variable
# ---
# ---

# set variables for AAT virtual app resources
# ---
# ---
Set-Variable -Name "RCMAppServer" -Value "ap01e1-aat"
Set-Variable -Name "RCMAppServerFQDN" -Value "ap01e1-aat.openvista.net"
Set-Variable -Name "RCMApp" -Value "openvista\aatrcmapp"
Set-Variable -Name "RCMHL7In" -Value "openvista\aatrcmhl7in"
Set-Variable -Name "RCMHL7Out" -Value "openvista\aatrcmhl7out"

Get-Variable -Name "RCMAppServer"
setspn -L $RCMAppServer

Get-Variable -Name "RCMAppServerFQDN"
#setspn -L $RCMAppServerFQDN

Get-Variable -Name "RCMApp"
Get-Variable -Name "RCMHL7In"
Get-Variable -Name "RCMHL7Out"

setspn -L $RCMApp
setspn -L $RCMHL7In
setspn -L $RCMHL7Out

setspn -U -S https/$RCMAppServerFQDN $RCMApp
setspn -U -S https/$RCMAppServerFQDN $RCMHL7In
setspn -U -S https/$RCMAppServerFQDN $RCMHL7Out

setspn -U -S https/$RCMAppServerFQDN":21550" $RCMApp
setspn -U -S https/$RCMAppServerFQDN":21551" $RCMHL7In
setspn -U -S https/$RCMAppServerFQDN":21552" $RCMHL7Out
setspn -U -S https/$RCMAppServerFQDN":21553" $RCMApp
setspn -U -S https/$RCMAppServerFQDN":21554" $RCMApp
# ---
Get-Variable
# ---
# ---

# set variables for AAT virtual data resources
# ---
# ---

Set-Variable -Name "RCMDataServer" -Value "rcm-db01e1"
Set-Variable -Name "RCMDataServerFQDN" -Value "rcm-db01e1.openvista.net"
Set-Variable -Name "RCMPowerBI" -Value "openvista\aatrcmpbi"
Set-Variable -Name "RCMSSRS" -Value "openvista\aatrcmssrs"
Set-Variable -Name "RCMSQL" -Value "openvista\aatrcmsql"
Set-Variable -Name "RCMSQLAgent" -Value "openvista\aatrcmsqlagent"

Get-Variable -Name "RCMDataServer"
setspn -L $RCMDataServer

Get-Variable -Name "RCMDataServerFQDN"
#setspn -L $RCMDataServerFQDN

Get-Variable -Name "RCMPowerBI"
Get-Variable -Name "RCMSSRS"
Get-Variable -Name "RCMSQL"
Get-Variable -Name "RCMSQLAgent"

setspn -L $RCMPowerBI
setspn -L $RCMSSRS
setspn -L $RCMSQL
setspn -L $RCMSQLAgent

setspn -U -S https/$RCMDataServer $RCMPowerBI
setspn -U -S https/$RCMDataServerFQDN $RCMPowerBI
setspn -U -S http/$RCMDataServer $RCMPowerBI
setspn -U -S http/$RCMDataServerFQDN $RCMPowerBI
# ---
Get-Variable
# ---
# ---
```
