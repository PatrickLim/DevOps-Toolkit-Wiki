@ECHO OFF

REM # #####################################################################
REM #
REM # Script simply creates the standard directory structure 
REM # on the Application Server/Control Workstation 
REM #
REM # Run this script on each Aopplication Server.
REM #
REM # This script should be run on the Image/File server ***
REM #
REM # #####################################################################

REM #
REM # SHOW MAN PAGE
REM # ===================================
if [%1] == [/?] GOTO :help
if [%1] == [?] GOTO :help
if [%1] == [man] GOTO :help

GOTO CREATEDIRS

REM #
REM # CREATE DIRECTORIES
REM # ===================================

:CREATEDIRS
REM - Create Directories ...
REM -------------------------------------

mkdir IcsInterface
mkdir IcsInterface\BIN
mkdir IcsInterface\BINTest
mkdir IcsInterface\LOG
mkdir IcsInterface\OPERATIONS
mkdir InsightCS
mkdir "InsightCS\_ICS ODBC REG Files"
mkdir InsightCS\_SCRIPTS

mkdir InsightCS\ICSMain
mkdir InsightCS\ICSMain\Billing
mkdir InsightCS\ICSMain\Billing\Claims
mkdir InsightCS\ICSMain\Billing\Claims\1500
rem mkdir InsightCS\ICSMain\Billing\Claims\150085
rem mkdir InsightCS\ICSMain\Billing\Claims\ANSI-837
mkdir InsightCS\ICSMain\Billing\Claims\CDR_Inbound
mkdir InsightCS\ICSMain\Billing\Claims\CDR_Inbound\errors
mkdir InsightCS\ICSMain\Billing\Claims\CDR_Inbound\processed
mkdir InsightCS\ICSMain\Billing\Claims\Demand
mkdir InsightCS\ICSMain\Billing\Claims\Detail
mkdir InsightCS\ICSMain\Billing\Claims\EDI_Outbound
mkdir InsightCS\ICSMain\Billing\Claims\EDI_Outbound\Transferred_Out
mkdir InsightCS\ICSMain\Billing\Claims\UB04
mkdir InsightCS\ICSMain\Billing\Claims\UB92
mkdir InsightCS\ICSMain\Billing\Claims\
mkdir InsightCS\ICSMain\Billing\Statements\
mkdir InsightCS\ICSMain\Billing\Statements\TransferredOut
mkdir InsightCS\ICSMain\Billing\Reports
mkdir InsightCS\ICSMain\ERA
mkdir InsightCS\ICSMain\ERA\Output
mkdir InsightCS\ICSMain\ERA\RPTS
mkdir InsightCS\ICSMain\ERA\Log
mkdir InsightCS\ICSMain\GLInterface
mkdir InsightCS\ICSMain\MasterTableUpdates
mkdir InsightCS\ICSMain\NightlyProcesses
mkdir InsightCS\ICSMain\Posting
mkdir InsightCS\ICSMain\Printouts
mkdir InsightCS\ICSMain\Refunds
mkdir InsightCS\ICSMain\Reports

mkdir InsightCS\ICSTest
mkdir InsightCS\ICSTest\Billing
mkdir InsightCS\ICSTest\Billing\Claims
mkdir InsightCS\ICSTest\Billing\Claims\1500
rem mkdir InsightCS\ICSTest\Billing\Claims\150085
rem mkdir InsightCS\ICSTest\Billing\Claims\ANSI-837
mkdir InsightCS\ICSTest\Billing\Claims\CDR_Inbound
mkdir InsightCS\ICSTest\Billing\Claims\CDR_Inbound\errors
mkdir InsightCS\ICSTest\Billing\Claims\CDR_Inbound\processed
mkdir InsightCS\ICSTest\Billing\Claims\Demand
mkdir InsightCS\ICSTest\Billing\Claims\Detail
mkdir InsightCS\ICSTest\Billing\Claims\EDI_Outbound
mkdir InsightCS\ICSTest\Billing\Claims\EDI_Outbound\Transferred_Out
mkdir InsightCS\ICSTest\Billing\Claims\UB04
mkdir InsightCS\ICSTest\Billing\Claims\UB92
mkdir InsightCS\ICSTest\Billing\Claims\
mkdir InsightCS\ICSTest\Billing\Statements\
mkdir InsightCS\ICSTest\Billing\Statements\TransferredOut
mkdir InsightCS\ICSTest\Billing\Reports
mkdir InsightCS\ICSTest\ERA
mkdir InsightCS\ICSTest\ERA\Output
mkdir InsightCS\ICSTest\ERA\RPTS
mkdir InsightCS\ICSTest\ERA\Log
mkdir InsightCS\ICSTest\GLInterface
mkdir InsightCS\ICSTest\MasterTableUpdates
mkdir InsightCS\ICSTest\NightlyProcesses
mkdir InsightCS\ICSTest\Posting
mkdir InsightCS\ICSTest\Printouts
mkdir InsightCS\ICSTest\Refunds
mkdir InsightCS\ICSTest\Reports

mkdir "InsightCS\Disaster Recovery"

echo Directories have been created.
GOTO:EOF

REM #
REM # HELP PAGE
REM # ===================================

:help
echo # #####################################################################
echo #
echo # Script simply creates the standard directory structure 
echo # on the Application Server/Control Workstation 
echo #
echo # Run this script on each Aopplication Server.
echo #
echo # This script should not be run on the Image/File server ***
echo #
echo # 
echo # #####################################################################
echo.
GOTO:EOF

