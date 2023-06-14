

```
INSERT INTO REGISTRY(KEY_ID, SYSTEM_ID, SUBSYSTEM_ID, GROUP_ID, SUBGROUP_ID, VALUE)
VALUES
('CfgName', 'Services', 'BillingService_PROD', '_', '_', 'Insight.Services.Billing.dll.config'),
('CfgPath', 'Services', 'BillingService_PROD', '_', '_', '\\rcm-ap01c1\c$\Program Files (x86)\Insight\BIN\'),
('DbType', 'Monitor', 'BillingService_PROD', '_', '_', 'InsightCS'),
('HostName', 'Services', 'BillingService_PROD', 'SvcHandler', '_', 'rcm-ap01c1'),
('IcsAPP', 'Services', 'BillingService_PROD',	'Observer', '_', 'BillingProcObserver'),
('IcsDSN', 'Services', 'BillingService_PROD',	'Observer', '_', 'Insight_PROD'),
('IcsPWD', 'Services', 'BillingService_PROD', 'Observer', '_', 'favre'),
('IcsUID', 'Services', 'BillingService_PROD', 'Observer', '_', 'ControlWKS'),
('KeepRunning', 'Services', 'BillingService_PROD', 'Observer', '_', 'TRUE'),
('LogName', 'Services', 'BillingService_PROD', '_', '_',	'Insight.Services.Billing_PROD.log'),
('LogPath', 'Services', 'BillingService_PROD', '_', '_', '\\rcm-ap01c1\IcsLogs$\'),
('NextRecord', 'Monitor', 'BillingService_PROD', '_', '_', 'InValid'),
('PollRate', 'Services', 'BillingService_PROD', 'Observer', '_', '60'),
('Type', 'Services', 'BillingService_PROD', '_', '_', 'BillingProc'),
('Type', 'Services', 'BillingService_PROD', 'SvcHandler', '_', 'Generic')


INSERT INTO REGISTRY(KEY_ID, SYSTEM_ID, SUBSYSTEM_ID, GROUP_ID, SUBGROUP_ID, VALUE)
VALUES
('CfgName', 'Services', 'CDRProcessor_PROD', '_', '_', 'Insight.Services.CDRProcessor.dll.config'),
('CfgPath', 'Services', 'CDRProcessor_PROD', '_', '_', '\\rcm-ap01c1\c$\Program Files (x86)\Insight\BIN\'),
('DbType', 'Monitor', 'CDRProcessor_PROD', '_', '_', 'InsightCS'),
('HostName', 'Services', 'CDRProcessor_PROD', 'SvcHandler', '_', 'rcm-ap01c1'),
('IcsAPP', 'Services', 'CDRProcessor_PROD',	'Observer', '_', 'CDRProcObserver'),
('IcsDSN', 'Services', 'CDRProcessor_PROD',	'Observer', '_', 'Insight_PROD'),
('IcsPWD', 'Services', 'CDRProcessor_PROD', 'Observer', '_', 'favre'),
('IcsUID', 'Services', 'CDRProcessor_PROD', 'Observer', '_', 'ControlWKS'),
('KeepRunning', 'Services', 'CDRProcessor_PROD', 'Observer', '_', 'TRUE'),
('LogName', 'Services', 'CDRProcessor_PROD', '_', '_',	'CDRProcessor_PROD.log'),
('LogPath', 'Services', 'CDRProcessor_PROD', '_', '_', '\\rcm-ap01c1\IcsLogs$\'),
('NextRecord', 'Monitor', 'CDRProcessor_PROD', '_', '_', 'InValid'),
('PollRate', 'Services', 'CDRProcessor_PROD', 'Observer', '_', '60'),
('Type', 'Services', 'CDRProcessor_PROD', '_', '_', 'CDRProc'),
('Type', 'Services', 'CDRProcessor_PROD', 'SvcHandler', '_', 'Generic')
```

