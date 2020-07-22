-- Author: Matt Garber
-- Date: 4/6/2018
-- Description: This script will add any queues to a username that
-- the user does not already have mapped. If a queue is alreaady mapped
-- to the user, it will not be added. If the @defaultQueue is set,
-- the @defaultQueue will be set to the default and undo any other
-- previously set default queues for this user.

DECLARE @username USERNAME
DECLARE @defaultQueue INT
SET @username = ''
SET @defaultQueue = ''

INSERT INTO WEB_QUEUE_USER_MAP(USERNAME, QUEUE_ID, DEFAULT_FLG, CREATE_DATE, CREATE_BY)
SELECT @username AS USERNAME, M.QUEUE_ID, 0 AS DEFAULT_FLG, GETDATE() AS CREATE_DATE, SUBSTRING(SYSTEM_USER,LEN(SYSTEM_USER)-(LEN(SYSTEM_USER) - PATINDEX ( '%\_%' , SYSTEM_USER))+1, LEN(SYSTEM_USER)) AS CREATE_BY
FROM WEB_QUEUE_MSTR M
LEFT OUTER JOIN (SELECT * FROM WEB_QUEUE_USER_MAP WHERE USERNAME = @username) UM on UM.QUEUE_ID = M.QUEUE_ID
WHERE M.ENABLE_FLG = 1 AND UM.USERNAME IS NULL AND UM.QUEUE_ID IS NULL

IF @defaultQueue IS NOT NULL AND @defaultQueue <> ''
BEGIN
	-- Undo any currently set defaults
	UPDATE WEB_QUEUE_USER_MAP
	SET DEFAULT_FLG = 0
	WHERE USERNAME = @username AND DEFAULT_FLG = 1

	-- Set the new default
	UPDATE WEB_QUEUE_USER_MAP
	SET DEFAULT_FLG = 1
	WHERE USERNAME = @username AND QUEUE_ID = @defaultQueue
END
