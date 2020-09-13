-- Author: Matt Garber
-- Date: 4/6/2018
-- Description: This script will add all web rights to a specified role that the role
-- does not already have. If the right already exists on the role, it will not be
-- added. This script is re-runnable and will attempt to add ALL web rights.

DECLARE @webRole varchar(4)
SET @webRole = ''

INSERT INTO WEB_ROLE_RIGHT(ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID)
SELECT @webRole AS ROLE_ID, M.APP_AREA_CD, M.SEC_RIGHT_ID
FROM WEB_RIGHT_MSTR M
LEFT OUTER JOIN (SELECT APP_AREA_CD, SEC_RIGHT_ID FROM WEB_ROLE_RIGHT WHERE ROLE_ID = @webRole) R ON M.APP_AREA_CD = R.APP_AREA_CD AND M.SEC_RIGHT_ID = R.SEC_RIGHT_ID
WHERE R.APP_AREA_CD IS NULL AND R.SEC_RIGHT_ID IS NULL
