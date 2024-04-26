article containing powershell script that calls AzCopy:

https://azurealan.ie/2022/01/31/how-to-save-your-old-virtual-machines-to-low-cost-archive-storage/

you may have to run this first:


```
Install-Module -Name Az -AllowClobber
connect-azaccount
Set-AzContext -Subscription "4ac13795-6f56-44f7-90b7-e38e067aa8c6"
```


Authenticate azcopy using Entra this way:

`azcopy login`

That way you do not need storageAccountSAS and you can change this line of code to the following:


```
azcopy copy $snapshotSAS.accessSAS "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$pageblobVHDFileName$storageaccountSAS"
azcopy copy $snapshotSAS.accessSAS "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$pageblobVHDFileName"
```


if you get a 403, then you have to assign role "Storage Blob Data Owner" because "Owner" does not suffice:

https://stackoverflow.com/questions/60602497/azcopy-error-this-request-is-not-authorized-to-perform-this-operation
