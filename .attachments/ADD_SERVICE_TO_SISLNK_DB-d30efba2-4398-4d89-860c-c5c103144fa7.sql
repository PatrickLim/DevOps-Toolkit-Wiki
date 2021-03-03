

select * from CLIENTS -- Use to determine client ids for current source/dest

SELECT * FROM record_routing where source = '200' and destination = '300' AND record_type in ('2701', '2702', '2711')

select * from record_types where record_type in ('2701', '2702', '2711')



begin transaction

DECLARE @serviceName char(32)
SET @serviceName = 'ImageHL7ToEngineHL7'

DECLARE @serviceId int
SET @serviceId = 1300 -- Verify this id is not being used

INSERT INTO CLIENTS(client_name, description, client_num, record_transmitted, current_record)
VALUES(@serviceName, @serviceName, @serviceId, '0', null)

UPDATE record_routing
SET destination = @serviceId
WHERE source = '200' AND destination = '300' AND record_type in ('2701', '2702', '2711')

SELECT * FROM record_routing WHERE source = '200' AND record_type in ('2701', '2702', '2711')

rollback

commit







