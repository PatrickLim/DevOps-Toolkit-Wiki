select * from REGISTRY

select * from SERVICE_MSTR

--replace _CHLBProd with _CRMCProd
--replace ap01w1-chlb with ap01e1-crmc
--replace chlb-rcm with crmc-rcm
--replace chlb-rcm-sislnk with crmc-rcm-sislnk

update REGISTRY set SUBSYSTEM_ID = replace(SUBSYSTEM_ID, '_CHLBProd', '_CRMCProd')
update REGISTRY set VALUE = replace(VALUE, '_CHLBProd', '_CRMCProd')
update REGISTRY set VALUE = replace(VALUE, 'ap01w1-chlb', 'ap01e1-crmc')
update REGISTRY set VALUE = replace(VALUE, 'chlb-rcm', 'crmc-rcm')

update SERVICE_MSTR set SERVICE_NAME = replace(SERVICE_NAME, '_CHLBProd', '_CRMCProd')
