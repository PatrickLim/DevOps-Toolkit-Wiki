select * from CHARGE_CLAIM_HCPCS_MSTR where CHARGE_CD = '32150599'

select * from VISIT where VISIT_NO in (select VISIT_NO from CHARGES where CHARGE_CD = '32150599')
