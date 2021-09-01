
```
[6:55 AM] Kyle Maasen
    Here's my recommended troubleshooting steps for billing:  
1) Check System Maintenance to see if billing is stuck on one of the steps.  If the step is anything except 0, then that means billing is either currently running (not likely, since it typically starts at 2:00 AM) or it errored out.
2) If the step is not zero, and assuming billing isn't currently running, then start billing from the Billing Service Manager in Classic.  More than likely it will error out again, at the same place that it aborted during the nightly run.

From that point, it could error out due to any number of reasons.  In this particular case, the error meantioned that an image directory was not set up.  Which led me to check out their Form Types, and then, their registry keys
```


```
​[6:56 AM] Patrick Lim
    where is System Maintenance?
```


```
​[6:56 AM] Kyle Maasen
    in Classic, under System Facility
​[6:56 AM] Kyle Maasen
    or just look at SYSTEM_MSTR
​[6:56 AM] Kyle Maasen
    table
​[6:57 AM] Kyle Maasen
    in this case, billing was sitting at step 15 I believe.  Which is the 1500 image creation step
```


```
​[6:58 AM] Patrick Lim
    i didn't think SYSTEM_MSTR recorded the billing steps
​[6:58 AM] Patrick Lim
    i thought it was something called BILLING_TRACKING or something
```


```
​[6:58 AM] Kyle Maasen
    just the current step that billing is on
​[6:59 AM] Kyle Maasen
    BILLING_TRACKING will give you more detailed info.  If you ever just want to know what step billing is currently on, I always go to System Maintenance.
```
  

```
[10:34 AM] Patrick Lim
    sorry Kyle Maasen one more question, when I check the BILLING_TRACKING table i see this on STEP_NO = 11
​[10:34 AM] Patrick Lim
    Error: Unable to determine Image Directory
​[10:34 AM] Patrick Lim
    step 11 is UB92 Print
​[10:35 AM] Patrick Lim
    and GLOBAL_REGISTRY has this: BILLING_UB92_PRINT_FOLDER  =  \\rcmapp\InsightCS\chcc-rcm\Billing\Claims\UB92\
​[10:36 AM] Patrick Lim
    which exists
```

​
```
[11:22 AM] Kyle Maasen
    We don't support claim images in Web.  I turned that off with the following:
​[11:22 AM] Kyle Maasen
    
update GLOBAL_REGISTRY set VALUE1 = '0' where REGISTRY_KEY in ('IMAGE_1500_ENABLED', 'IMAGE_UB92_ENABLED')
update SYSTEM_REGISTRY set VALUE1 = '0' where REGISTRY_KEY in ('IMAGE_1500_ENABLED', 'IMAGE_UB92_ENABLED')
```

