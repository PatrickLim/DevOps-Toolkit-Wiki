Since the Workspace is the unit of Access Control in PBI Service, Tom Arnold wants to create one Workspace per Customer Report (not per Customer).

Setting up Access Control is done in the Azure Portal and in the PBI Service Portal.

**What needs to happen in Azure Portal**
- openvista.net accounts in the traditional domain have to bubble up to Azure
- make sure the appropriate accounts are Power BI Capacity Administrators. Only these users can create Workspaces that are of type Capacity or Embedded (the other types, Pro and Per User, are not practical for hosting multiple tenants):

![image.png](/.attachments/image-58478d08-444e-4e75-b4a0-cd7ddaa96d2a.png)

- log in to https://portal.azure.com with one of the openvista.net accounts
- in Azure Active Directory, create the Group you need and assign the Members you want to have access to the PBI Service Workspace

![image.png](/.attachments/image-826e15cc-731e-4c05-94c1-f84f33887b13.png)

**What needs to happen in PBI Service Portal**
- log in to https://app.powerbi.com with one of the accounts that is a Power BI Capacity Administrator
- create a Workspace and just name it, leaving everything else as default

![image.png](/.attachments/image-e74073c2-f775-4e76-a9c8-61e5d115aa84.png)

- under Advanced, make sure the License Mode is Embedded (or Premium per capacity):

![image.png](/.attachments/image-44012fd5-4e04-4151-a3d3-398a3594a7b0.png)
