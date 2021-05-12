Hi Adam and Darrell,

When I install or upgrade the RCM webapp and Web Maint, these are the following changes I make to the GLOBAL_REGISTRY table:

IMAGING_LICENSE_JS must contain the leadtools license location on the IIS webserver. Example at Ashley Addiction AAT:

VALUE1 = ‘M:\sites\aat-rcm\ShellImaging\Leadtools\leadtools.lic.txt’
VALUE2 = ‘M:\sites\aat-rcm\ShellImaging\Leadtools\leadtools.lic.key.txt’

IMAGING_LICENSE_NET must contain the leadtools license location on the RD node. Example at Ashley Addiction AAT:

VALUE1 = ‘c:/program files (x86)/LEAD Technologies/Leadtools.WebScanning/Leadtools/leadtools.lic’
VALUE2 = ‘c:/program files (x86)/LEAD Technologies/Leadtools.WebScanning/Leadtools/leadtools.lic.key’

HELP_URL_RCM must contain the url for the help site. Example at Ashley Addiction AAT:

VALUE1 = ‘https://wb01e1-aat.openvista.net:21503/’

These are the changes I make to the WEB_ROLE_RIGHT table (assuming ROLE_ID = 16 is “Full Access”, it differs per client so please check per client:

insert into WEB_ROLE_RIGHT (ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID) values (16, 'MAINT', 'ROLE_MAINT')

insert into WEB_ROLE_RIGHT (ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID) values (16, 'MAINT', 'USER_MAINT')

I may need to add other entries into the WEB_ROLE_RIGHT table depending on whether it’s already there. For example, often IMAGING-QA is missing so I cannot see the Imaging Quick Action tab along the bottom of the browser, so I would run this:

insert into WEB_ROLE_RIGHT (ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID) values (16, 'ADT', 'IMAGING-QA')
