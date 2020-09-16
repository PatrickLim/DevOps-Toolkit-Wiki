first check that dbo schema is not owned by anyone:

SELECT SUSER_SNAME(sid), * from sys.database_principals

SUSER_SNAME(sid) column in above query should be null. If so, then make sure that the database has an owner, it is fine to make a domain user the owner.
