
-- Use this script to add a new service to the Collector Database (MonitorApp)

begin transaction

declare @serviceName varchar(80)
set @serviceName = 'ImageHL7ToEngineHL7' -- Name of the interface service

declare @serviceId int
set @serviceId = 1300 -- Make sure this ID is available for use in the Sislnk database

declare @hostname varchar(80)
set @hostname = 'MSCMGARBER' -- Machine that the interface is installed on

INSERT INTO REGISTRY(KEY_ID, SYSTEM_ID, SUBSYSTEM_ID, GROUP_ID, SUBGROUP_ID, VALUE)
VALUES
('CfgName',	'Services',	@serviceName,	'_',	'_',	@serviceName + '.cfg'),
('CfgPath',	'Services',	@serviceName,	'_',	'_',	'\\' + @hostname + '\IcsInterface\Operations\'),
('ConfName',	'Services',	@serviceName,	'_',	'_',	@serviceName + '.config'),
('ConfPath',	'Services',	@serviceName,	'_',	'_',	'\\' + @hostname + '\IcsInterface\Operations\'),
('DbType',	'Monitor',	@serviceName,	'_',	'_',	'Sislnk'),
('HostName',	'Services',	@serviceName,	'SvcHandler',	'_',	@hostname),
('KeepRunning',	'Services',	@serviceName,	'Observer',	'_',	'TRUE'),
('LogName',	'Services',	@serviceName,	'_',	'_',	@serviceName + '.log'),
('LogPath',	'Services',	@serviceName,	'_',	'_',	'\\' + @hostname + '\IcsInterface\Log\'),
('NextRecord',	'Monitor',	@serviceName,	'_',	'_',	'Valid'),
('PollRate',	'Services',	@serviceName,	'Observer',	'_',	'60'),
('SislnkAPP',	'Services',	@serviceName,	'Observer',	'_',	'Collector'),
('SislnkClientNum',	'Services',	@serviceName,	'Observer',	'_',	CONVERT(varchar(80), @serviceId)),
('SislnkDSN',	'Services',	@serviceName,	'Observer',	'_',	'Sislnk'),
('SislnkPWD',	'Services',	@serviceName,	'Observer',	'_',	'favre'),
('SislnkUID',	'Services',	@serviceName,	'Observer',	'_',	'ControlWKS'),
('Type',	'Services',	@serviceName,	'_',	'_',	'Sislnk'),
('Type',	'Services',	@serviceName,	'SvcHandler',	'_',	'Generic')

insert into SERVICE_MSTR(SERVICE_ID, SERVICE_NAME, DESCRIPTION)
values (@serviceId, @serviceName, '')

select * from REGISTRY

select * from SERVICE_MSTR

rollback

commit
