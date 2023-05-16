

```
insert into SERVICE_MSTR (SERVICE_ID, SERVICE_NAME, DESCRIPTION) values (10001, 'IcsTransService_Main', '')


INSERT INTO REGISTRY(KEY_ID, SYSTEM_ID, SUBSYSTEM_ID, GROUP_ID, SUBGROUP_ID, VALUE)
VALUES
('CfgName', 'Services', 'IcsTransService_Main', '_', '_', 'IcsTransService_Main.cfg'),
('CfgPath', 'Services', 'IcsTransService_Main', '_', '_', '\\ap01e1-aat\IcsInterface\OPERATIONS\'),
('DbType', 'Monitor', 'IcsTransService_Main', '_', '_', 'InsightCS'),
('HostName', 'Services', 'IcsTransService_Main', 'SvcHandler', '_', 'ap01e1-aat'),
('IcsAPP', 'Services', 'IcsTransService_Main',	'Observer', '_', 'IcsTransServiceObserver'),
('IcsDSN', 'Services', 'IcsTransService_Main',	'Observer', '_', 'aat-rcm'),
('IcsPWD', 'Services', 'IcsTransService_Main', 'Observer', '_', 'favre'),
('IcsUID', 'Services', 'IcsTransService_Main', 'Observer', '_', 'ControlWKS'),
('KeepRunning', 'Services', 'IcsTransService_Main', 'Observer', '_', 'TRUE'),
('LogName', 'Services', 'IcsTransService_Main', '_', '_',	'IcsTransService_Main.log'),
('LogPath', 'Services', 'IcsTransService_Main', '_', '_', '\\ap01e1-aat\IcsInterface\LOG\'),
('NextRecord', 'Monitor', 'IcsTransService_Main', '_', '_', 'InValid'),
('PollRate', 'Services', 'IcsTransService_Main', 'Observer', '_', '60'),
('Type', 'Services', 'IcsTransService_Main', '_', '_', 'IcsTransService'),
('Type', 'Services', 'IcsTransService_Main', 'SvcHandler', '_', 'Generic')
```

