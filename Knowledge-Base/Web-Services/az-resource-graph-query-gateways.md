# az-resource-graph-query-gateways

```Text
// Azure Resource Graph Explorer
// https://portal.azure.com/#view/HubsExtension/ArgQueryBlade
// Copy/Paste the following into new Query and Run to see results.

resources
| where type =~ "microsoft.network/virtualnetworkgateways"
| extend gatewayType = tostring(properties.gatewayType)
| extend sku = tostring(properties.sku.name)
| extend ipConfigurations=iff(array_length(properties.ipConfigurations) == 0, dynamic(null), properties.ipConfigurations)
| mvexpand ipConfig=ipConfigurations limit 400
| summarize subnetId=tostring(any(ipConfig.properties.subnet.id)),
            publicIpAddressId=tostring(any(tolower(ipConfig.properties.publicIPAddress.id))),
            tags=any(tags)
            by name, id, type, kind, location, resourceGroup, subscriptionId, gatewayType, sku
| extend virtualNetwork=extract('Microsoft.Network/virtualNetworks/(.*)/subnets/', 1, subnetId)
| extend virtualNetwork = coalesce(virtualNetwork, '-')
| extend publicIpAddressName=extract('microsoft.network/publicipaddresses/(.*)', 1, publicIpAddressId)
| project name, id, type, kind, location, resourceGroup, subscriptionId, tags, virtualNetwork, gatewayType, sku, publicIpAddressId, publicIpAddressName
| join kind=leftouter hint.strategy=shuffle (data
        | where type =~ 'microsoft.network/publicipaddresses'
        | extend publicIPAddress = coalesce(properties.ipAddress, '-')
        | project publicIpAddressId=tolower(id), publicIPAddress)
    on publicIpAddressId
| extend publicIpAddressSplit0 = split('{0} ({1})', '{0}')
| extend publicIpAddressValue = strcat(publicIpAddressSplit0[0], publicIPAddress, publicIpAddressSplit0[1])
| extend publicIpAddressSplit1 = split(publicIpAddressValue, '{1}')
| extend publicIpAddressDisplay = strcat(publicIpAddressSplit1[0], publicIpAddressName, publicIpAddressSplit1[1])
| project name, id, type, kind, tags, location, resourceGroup, subscriptionId, virtualNetwork, gatewayType, sku, publicIpAddressDisplay
| extend locationDisplayName=case(location =~ 'eastus','East US',location =~ 'eastus2','East US 2',location =~ 'southcentralus','South Central US',location =~ 'westus2','West US 2',location =~ 'westus3','West US 3',location =~ 'australiaeast','Australia East',location =~ 'southeastasia','Southeast Asia',location =~ 'northeurope','North Europe',location =~ 'swedencentral','Sweden Central',location =~ 'uksouth','UK South',location =~ 'westeurope','West Europe',location =~ 'centralus','Central US',location =~ 'southafricanorth','South Africa North',location =~ 'centralindia','Central India',location =~ 'eastasia','East Asia',location =~ 'japaneast','Japan East',location =~ 'koreacentral','Korea Central',location =~ 'canadacentral','Canada Central',location =~ 'francecentral','France Central',location =~ 'germanywestcentral','Germany West Central',location =~ 'norwayeast','Norway East',location =~ 'switzerlandnorth','Switzerland North',location =~ 'uaenorth','UAE North',location =~ 'brazilsouth','Brazil South',location =~ 'qatarcentral','Qatar Central',location =~ 'centralusstage','Central US (Stage)',location =~ 'eastusstage','East US (Stage)',location =~ 'eastus2stage','East US 2 (Stage)',location =~ 'northcentralusstage','North Central US (Stage)',location =~ 'southcentralusstage','South Central US (Stage)',location =~ 'westusstage','West US (Stage)',location =~ 'westus2stage','West US 2 (Stage)',location =~ 'asia','Asia',location =~ 'asiapacific','Asia Pacific',location =~ 'australia','Australia',location =~ 'brazil','Brazil',location =~ 'canada','Canada',location =~ 'europe','Europe',location =~ 'france','France',location =~ 'germany','Germany',location =~ 'global','Global',location =~ 'india','India',location =~ 'japan','Japan',location =~ 'korea','Korea',location =~ 'norway','Norway',location =~ 'singapore','Singapore',location =~ 'southafrica','South Africa',location =~ 'switzerland','Switzerland',location =~ 'uae','United Arab Emirates',location =~ 'uk','United Kingdom',location =~ 'unitedstates','United States',location =~ 'unitedstateseuap','United States EUAP',location =~ 'eastasiastage','East Asia (Stage)',location =~ 'southeastasiastage','Southeast Asia (Stage)',location =~ 'northcentralus','North Central US',location =~ 'westus','West US',location =~ 'jioindiawest','Jio India West',location =~ 'westcentralus','West Central US',location =~ 'southafricawest','South Africa West',location =~ 'australiacentral','Australia Central',location =~ 'australiacentral2','Australia Central 2',location =~ 'australiasoutheast','Australia Southeast',location =~ 'japanwest','Japan West',location =~ 'jioindiacentral','Jio India Central',location =~ 'koreasouth','Korea South',location =~ 'southindia','South India',location =~ 'westindia','West India',location =~ 'canadaeast','Canada East',location =~ 'francesouth','France South',location =~ 'germanynorth','Germany North',location =~ 'norwaywest','Norway West',location =~ 'switzerlandwest','Switzerland West',location =~ 'ukwest','UK West',location =~ 'uaecentral','UAE Central',location =~ 'brazilsoutheast','Brazil Southeast',location)
| extend subscriptionDisplayName=case(subscriptionId =~ '4ac13795-6f56-44f7-90b7-e38e067aa8c6','Arkansas (ASH)',subscriptionId =~ '69592250-9a14-4f99-8239-6d7e8a143cc3','Medsphere',subscriptionId =~ '5a7b5fa1-9067-433d-a826-61f09d1d8e56','RCM',subscriptionId =~ '5f629475-e073-4ae1-ab97-06e729f87728','Stockell Healthcare (STKL)',subscriptionId =~ '555a9555-d6fc-40b4-bd3b-7167ab7151fa','Wellsoft (WS)',subscriptionId)
| extend tagsString=tostring(tags)
| where (type !~ ('newrelic.observability/monitors'))
| where (type !~ ('paloaltonetworks.cloudngfw/firewalls'))
| where (type !~ ('paloaltonetworks.cloudngfw/globalrulestacks'))
| where (type !~ ('paloaltonetworks.cloudngfw/localrulestacks'))
| where (type !~ ('qumulo.storage/filesystems'))
| where (type !~ ('microsoft.agfoodplatform/farmbeats'))
| where (type !~ ('microsoft.anybuild/clusters'))
| where (type !~ ('microsoft.cdn/profiles/customdomains'))
| where (type !~ ('microsoft.cdn/profiles/afdendpoints'))
| where (type !~ ('microsoft.cdn/profiles/origingroups/origins'))
| where (type !~ ('microsoft.cdn/profiles/origingroups'))
| where (type !~ ('microsoft.cdn/profiles/afdendpoints/routes'))
| where (type !~ ('microsoft.cdn/profiles/rulesets/rules'))
| where (type !~ ('microsoft.cdn/profiles/rulesets'))
| where (type !~ ('microsoft.cdn/profiles/secrets'))
| where (type !~ ('microsoft.cdn/profiles/securitypolicies'))
| where (type !~ ('microsoft.cloudtest/accounts'))
| where (type !~ ('microsoft.cloudtest/hostedpools'))
| where (type !~ ('microsoft.cloudtest/images'))
| where (type !~ ('microsoft.cloudtest/pools'))
| where (type !~ ('microsoft.codesigning/codesigningaccounts'))
| where (type !~ ('microsoft.kubernetes/connectedclusters/microsoft.kubernetesconfiguration/namespaces'))
| where (type !~ ('microsoft.containerservice/managedclusters/microsoft.kubernetesconfiguration/namespaces'))
| where (type !~ ('microsoft.kubernetes/connectedclusters/microsoft.kubernetesconfiguration/fluxconfigurations'))
| where (type !~ ('microsoft.containerservice/managedclusters/microsoft.kubernetesconfiguration/fluxconfigurations'))
| where (type !~ ('microsoft.portalservices/extensions/deployments'))
| where (type !~ ('microsoft.portalservices/extensions'))
| where (type !~ ('microsoft.portalservices/extensions/slots'))
| where (type !~ ('microsoft.portalservices/extensions/versions'))
| where (type !~ ('microsoft.datacollaboration/workspaces'))
| where (type !~ ('microsoft.eventgrid/namespaces'))
| where (type !~ ('microsoft.hdinsight/clusterpools/clusters'))
| where (type !~ ('microsoft.hdinsight/clusterpools/clusters/sessionclusters'))
| where (type !~ ('microsoft.hdinsight/clusterpools'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers/accessprofiles'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers/files'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers/filerequests'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers/licenses'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers/storages'))
| where (type !~ ('microsoft.hpcworkbench/instances/chambers/workloads'))
| where (type !~ ('microsoft.hpcworkbench/instances/consortiums'))
| where (type !~ ('microsoft.hpcworkbench/instances'))
| where (type !~ ('microsoft.hpcworkbench/instances/sharedstorages'))
| where (type !~ ('microsoft.network/virtualhubs')) or ((kind =~ ('routeserver')))
| where (type !~ ('microsoft.metaverse/metaverses'))
| where (type !~ ('microsoft.insights/diagnosticsettings'))
| where not((type =~ ('microsoft.network/serviceendpointpolicies')) and ((kind =~ ('internal'))))
| where (type !~ ('microsoft.openlogisticsplatform/workspaces'))
| where (type !~ ('microsoft.scom/managedinstances'))
| where (type !~ ('microsoft.orbital/edgesites'))
| where (type !~ ('microsoft.orbital/groundstations'))
| where (type !~ ('microsoft.orbital/l2connections'))
| where (type !~ ('microsoft.azurepercept/accounts'))
| where (type !~ ('microsoft.workloads/phpworkloads'))
| where (type !~ ('microsoft.playfab/playeraccountpools'))
| where (type !~ ('microsoft.playfab/playfabresources'))
| where (type !~ ('microsoft.playfab/titles'))
| where (type !~ ('microsoft.recommendationsservice/accounts/modeling'))
| where (type !~ ('microsoft.recommendationsservice/accounts/serviceendpoints'))
| where (type !~ ('microsoft.recoveryservicesbvtd/vaults'))
| where (type !~ ('microsoft.recoveryservicesbvtd2/vaults'))
| where (type !~ ('microsoft.recoveryservicesintd/vaults'))
| where (type !~ ('microsoft.recoveryservicesintd2/vaults'))
| where (type !~ ('microsoft.datareplication/replicationvaults'))
| where (type !~ ('microsoft.storagecache/amlfilesystems'))
| where not((type =~ ('microsoft.synapse/workspaces/sqlpools')) and ((kind =~ ('v3'))))
| where (type !~ ('microsoft.connectedcache/ispcustomers'))
| where not((type =~ ('microsoft.sql/servers/databases')) and ((kind in~ ('system','v2.0,system','v12.0,system','v12.0,user,datawarehouse,gen2,analytics'))))
| where not((type =~ ('microsoft.sql/servers')) and ((kind =~ ('v12.0,analytics'))))
| project name,virtualNetwork,publicIpAddressDisplay,gatewayType,locationDisplayName,resourceGroup,subscriptionDisplayName,tagsString,id,type,kind,location,subscriptionId,tags
| sort by (tolower(tostring(resourceGroup))) asc,(tolower(tostring(name))) asc

```
