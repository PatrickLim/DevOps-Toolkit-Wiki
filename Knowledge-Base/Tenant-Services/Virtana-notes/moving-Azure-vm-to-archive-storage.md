article containing powershell script that calls AzCopy:

https://azurealan.ie/2022/01/31/how-to-save-your-old-virtual-machines-to-low-cost-archive-storage/

you may have to run this first:

Install-Module -Name Az -AllowClobber

connect-azaccount

Set-AzContext -Subscription "4ac13795-6f56-44f7-90b7-e38e067aa8c6"
