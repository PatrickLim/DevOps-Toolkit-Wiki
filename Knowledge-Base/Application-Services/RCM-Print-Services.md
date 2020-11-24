# Adjusting the IcsPrintService

During the installation of InsightCS, the following folder is created and used by the IcsPrintService: “c:\Program Files\InsightCS\BIN\Reports”. While this will work, it poses some serious issues during client upgrades:

- The files contained in the Reports folder are needed by the IcsPrintService
- Some of these files are customized
- During the Insight CS uninstall process (done during an upgrade, this folder is deleted. This can result in the loss of any customized configurations for the client

You will need to adjust the IcsPrintService to point to the correct directory. The correct directory, created during the Nightly Processes installation, is depending on the database (main or test) being used:

C:\InsightCS\<DATABASE_NAME>\Reports\
_Where <DATABASE_NAME> is equal to either IcsMain or IcsTest_

## To reconfigure the IcsPrintService, do one of the following:

- Open the Windows Registry
- Navigate to one of the following keys (depending on whether you’re adjusting for TEST or MAIN):
- HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IcsPrintService_Main\Parameters
- HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IcsPrintService_Test\Parameters
- Adjust the “ExeRoot” parameter to C:\InsightCS\<DATABASE NAME>\Reports\
- Exit REGEDIT
- Now copy all of the files from the C:\Program Files\InsightCS\Reports\ folder, to the newly created C:\InsightCS\<DATABASE NAME>\Reports\ folder.
- Reboot the Application Server
