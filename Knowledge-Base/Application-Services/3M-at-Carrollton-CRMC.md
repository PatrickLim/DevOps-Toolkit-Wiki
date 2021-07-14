CRMC was one of the first customers to push for the webapp-to-webapp integration of RCM Cloud to 3M Cloud.

The 3M product is actually installed on-prem at Carrollton (*.crmc.health).

http://3mcsr.crmc.health resolves to 10.200.0.60

Change 1 Disable Chrome Pop-Up Blocker
Change 2 Add forward lookup zone to OPENVISTA.net for 3mcst.crmc.health
Change 3 Update Global Registry Key to use FQDN of 3M web server on prem @ CRMC
Change 4 (test whether we really need this) Update RegEdits to include the *.crmc.health domain space

GLOBAL_REGISTRY key had to be http://3mcsr.crmc.health not http://3mcsr.crmc.health/

ENCODER_CONFIG_MSTR table authorization value is HGWDNL900Q7LTobC

In our QA environment, the url is https://crs.3M.com and the credentials are Medsphere *@$+RQMpY8ku 

( Sam Ellison had since changed to r$}A=6d:_9G8 )

