This is the pfSense video recorded by Abdul Mohammed and Todd Riffel:

https://medsphere.zoom.us/rec/share/HHspzuG_rSOqanGeaXibZE5dwOAjOzkCt4XFGHbxoe8P7n_K0NDHRRd_lGig2qWp.3t-ZcpQY3epn4luA

Passcode: H9eN+ef^

When the pfSense servers are running again, you have two things on the Azure side -- the Virtual Gateways and the DNS Servers / Domain Controllers.

The Virtual Gateways

These are the Virtual Gateways

The DNS Servers / Domain Controllers

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
