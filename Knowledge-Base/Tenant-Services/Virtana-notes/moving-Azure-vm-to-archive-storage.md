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

azcopy copy "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$pageblobVHDFileName$storageaccountSAS" "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$archiveVHDFileName$storageaccountSAS" --blob-type=BlockBlob
azcopy copy "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$pageblobVHDFileName" "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$archiveVHDFileName" --blob-type=BlockBlob
```


if you get a 403, then you have to assign role "Storage Blob Data Owner" because "Owner" does not suffice:

https://stackoverflow.com/questions/60602497/azcopy-error-this-request-is-not-authorized-to-perform-this-operation

It took 5.5 minutes to copy 127Gb.

Only storage accounts that are configured for LRS, GRS, or RA-GRS Blob Storage and General Purpose V2 Accounts support moving blobs to the archive tier. The archive tier isn't supported for ZRS, GZRS, or RA-GZRS accounts.

Complete code:


```
#Provide the name of your resource group where snapshot will be created
$vmResourceGroupName = "ash-cus-web-rg"

#Provide the name of your resource group where the blobs will be stored
$storageaccountResourceGroupName = ""

#Provide the name of the virtual machine where the snapshot will be made
$vmName = "ash-rcm-web"

#Provide storage account name where you want to copy the snapshot. 
$storageAccountName = "stgsfmigration"

#Name of the storage container where the downloaded snapshot will be stored
$storageContainerName = "vmdiskarchive"

#Provide the name of the VHD files for blob storage
$pageblobVHDFileName = "pageblobsnapshot.vhd"
$archiveVHDFileName = "blockblobarchive.vhd"

#Set virtual machine context where snapshots will be taken
$vmContext = Get-AzVM -ResourceGroupName $VMResourceGroupName -Name $vmName

#Set the location of virtual machine for snapshot creation
$location = $vmContext.Location

#Set snapshot config settings
#Use the below command for the OS disk
$snapshotConfig =  New-AzSnapshotConfig -SourceUri $vmContext.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy

#For data disks use the below command where [x] is the ID of the data disk
#$snapshotConfig =  New-AzSnapshotConfig -SourceUri $vmContext.StorageProfile.DataDisks[0].ManagedDisk.Id -Location $location -CreateOption copy

#Set the name of the snapshot resource
#Use the below command for the OS disk
$snapshotName = $vmContext.StorageProfile.OsDisk.name+"-snapshot"

#For data disks use the below command where [x] is the ID of the data disk
#$snapshotName = $vmContext.StorageProfile.DataDisks[0].name+"-snapshot"

#Create snapshot
New-AzSnapshot -Snapshot $snapshotConfig -SnapshotName $snapshotName -ResourceGroupName $vmResourceGroupName

#Generate the SAS for the snapshot - valid for 24 hours
$snapshotSAS = Grant-AzSnapshotAccess -ResourceGroupName $vmResourceGroupName -SnapshotName $SnapshotName -DurationInSecond 86400 -Access Read

#Get the storage account context for the VHD blobs
$storageAccountContext = (Get-AzStorageAccount -ResourceGroupName $storageaccountResourceGroupName -AccountName $storageAccountName).context

#Generate the SAS for the storage account - valid for 24 hours
$storageaccountSAS = New-AzStorageAccountSASToken -Context $storageAccountContext -Service Blob -ResourceType Service,Container,Object -Permission "rw" -ExpiryTime (Get-Date).AddDays(1)

#Copy snapshot to page blob
azcopy copy $snapshotSAS.accessSAS "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$pageblobVHDFileName$storageaccountSAS"

#Revoke SAS for the snapshot
Revoke-AzSnapshotAccess -ResourceGroupName $vmResourceGroupName -SnapshotName $SnapshotName

#Delete snapshot
Remove-AzSnapshot -SnapshotName $snapshotName -ResourceGroupName $vmResourceGroupName -Force

#Copy page blob to block blob
azcopy copy "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$pageblobVHDFileName$storageaccountSAS" "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$archiveVHDFileName$storageaccountSAS" --blob-type=BlockBlob

#Delete page blog
Remove-AzStorageBlob -Container $storageContainerName -Blob $pageblobVHDFileName -Context $storageAccountContext

#Set block blob to archive tier
$archiveblob = Get-AzStorageBlob -Container $storageContainerName -Blob $archiveVHDFileName -Context $storageAccountContext
$archiveblob.BlobClient.SetAccessTier("Archive", $null, "Standard")
```

