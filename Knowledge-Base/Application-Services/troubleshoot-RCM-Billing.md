[6:55 AM] Kyle Maasen
    Here's my recommended troubleshooting steps for billing:  
1) Check System Maintenance to see if billing is stuck on one of the steps.  If the step is anything except 0, then that means billing is either currently running (not likely, since it typically starts at 2:00 AM) or it errored out.
2) If the step is not zero, and assuming billing isn't currently running, then start billing from the Billing Service Manager in Classic.  More than likely it will error out again, at the same place that it aborted during the nightly run.

From that point, it could error out due to any number of reasons.  In this particular case, the error meantioned that an image directory was not set up.  Which led me to check out their Form Types, and then, their registry keys
​[6:56 AM] Patrick Lim
    where is System Maintenance?
​[6:56 AM] Kyle Maasen
    in Classic, under System Facility
​[6:56 AM] Kyle Maasen
    or just look at SYSTEM_MSTR
​[6:56 AM] Kyle Maasen
    table
​[6:57 AM] Kyle Maasen
    in this case, billing was sitting at step 15 I believe.  Which is the 1500 image creation step
​[6:58 AM] Patrick Lim
    i didn't think SYSTEM_MSTR recorded the billing steps
​[6:58 AM] Patrick Lim
    i thought it was something called BILLING_TRACKING or something
​[6:58 AM] Kyle Maasen
    just the current step that billing is on
​[6:59 AM] Kyle Maasen
    BILLING_TRACKING will give you more detailed info.  If you ever just want to know what step billing is currently on, I always go to System Maintenance.  
