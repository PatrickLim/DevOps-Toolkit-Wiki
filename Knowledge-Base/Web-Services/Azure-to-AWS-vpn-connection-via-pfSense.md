This is the pfSense video recorded by Abdul Mohammed and Todd Riffel:

https://medsphere.zoom.us/rec/share/HHspzuG_rSOqanGeaXibZE5dwOAjOzkCt4XFGHbxoe8P7n_K0NDHRRd_lGig2qWp.3t-ZcpQY3epn4luA

Passcode: H9eN+ef^

When the pfSense servers are running again, you have two things on the Azure side -- the Virtual Gateways and the DNS Servers / Domain Controllers.

**The Virtual Network Gateways**

MSC-CVC-GATE1 (Azure IP = 104.43.216.101)
|Connection|Amazon IP|Amazon Address Space|
|--|--|--|
|msc-cvc-eus-con|52.55.174.134|10.252.0.0/16|
|msc-cvc-wus-con|13.57.91.188|10.0.76.0/24, 10.0.77.0/24, 10.140.80.52/32, 10.251.0.0/16, 172.31.255.0/24|
|msc-rcm-gch-gate-conn|74.50.132.160|192.168.1.227/32|

MSC-CVC-Gate2 (Azure IP = 40.121.23.49)
|Connection|Amazon IP|Amazon Address Space|
|--|--|--|
|msc-cvc-eus-eus-con|52.55.174.134|10.252.0.0/16|
|msc-cvc-wus-eus-con|13.57.91.188|10.0.76.0/24, 10.0.77.0/24, 10.140.80.52/32, 10.251.0.0/16, 172.31.255.0/24|

ASH-RCM-CVC-GATE1 (Azure IP = 40.113.202.68)
|Connection|Amazon IP|Amazon Address Space|
|--|--|--|
|ash-rcm-cvc-eus-conn|52.55.174.134|10.252.0.0/16|
|ash-rcm-cvc-wus-conn|13.57.91.188|10.251.0.0/16|

MSCCSP-WUS-VNET-GW (Azure IP = 52.160.43.103)
|Connection|Amazon IP|Amazon Address Space|
|--|--|--|
|cov-east-1|52.55.174.134|10.252.0.0/16|
|cvc-west-1|13.57.91.188|10.0.76.0/24, 10.0.77.0/24, 10.140.80.52/32, 10.251.0.0/16, 172.31.255.0/24|

**The DNS Servers / Domain Controllers**

These are the DNS Servers / Domain Controllers (each vm serves as both DNS Server and Domain Controller). After pfSense is reset, just to be safe reboot these eight machines:

msc-rcm-dc 10.7.11.4
msc-rcm-dc2 10.7.11.5
msc-rcm-dc3 10.17.11.4
msc-rcm-dc4 10.17.11.5

msc-wus-dc1 10.177.11.4
msc-cus-dc1 10.7.11.6
msc-cus-dc2 10.7.11.7
msc-eus-dc1 10.17.11.6

These three dc's (in Azure) are no longer needed:

azwusdc01
sbc-rcm-ad
sbc-rcm-adds-e1
