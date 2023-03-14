
```

set nocount on

/*
**	Update fragmented indexes on updated tables...
*/
declare @tableName varchar(255)
declare @currentDate varchar(20)
declare @fragmentation int

set @currentDate = convert(varchar(20), getdate(), 120)
raiserror ('%s: Updating fragmented indexes for all tables with 20%% fragmentation or more...',0,1, @currentDate) with nowait

/*
**	Update fragmented indexes on all tables beyond a threshold (20%)...
*/
declare @execstr   varchar(2000);
declare @maxfrag   decimal;

-- Decide on the maximum fragmentation to allow for.
select @maxfrag = 20.0;

-- Declare a cursor.
declare tables cursor for
	select	'[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']'
	from	INFORMATION_SCHEMA.TABLES
	where	TABLE_TYPE = 'BASE TABLE'-- and table_name like '%Itarapro%'
		and TABLE_SCHEMA = 'dbo'

-- Create the table.
declare @fraglist table(
   ObjectName varchar(1000),
   ObjectId int,
   IndexName varchar(1000),
   IndexId int,
   Lvl int,
   CountPages int,
   CountRows int,
   MinRecSize int,
   MaxRecSize int,
   AvgRecSize int,
   ForRecCount int,
   Extents int,
   ExtentSwitches int,
   AvgFreeBytes int,
   AvgPageDensity int,
   ScanDensity decimal,
   BestCount int,
   ActualCount int,
   LogicalFrag decimal,
   ExtentFrag decimal);

-- Open the cursor.
open tables;

-- Loop through all the tables in the database.
fetch next from tables into @tableName

while @@FETCH_STATUS = 0
begin
-- Do the showcontig of all indexes of the table
   insert into @fraglist 
   exec ('DBCC SHOWCONTIG (''' + @tableName + ''') WITH FAST, TABLERESULTS, ALL_INDEXES, NO_INFOMSGS');
   fetch next from tables into @tableName
end

-- Close and deallocate the cursor.
close tables;
deallocate tables;

/*
** Uncomment this and run only to this section if you want to see the fragment values...
*/
/*
	select LogicalFrag, ObjectName, [RowCount]=0
		into #tmpTable
	from	@fraglist
	order by LogicalFrag desc

	declare fragmentedTables cursor for
		select	distinct ObjectName
		from	#tmpTable

	-- Open the cursor.
	open fragmentedTables;

	-- Loop through all the tables in the database.
	fetch next from fragmentedTables into @tableName

	declare @sql varchar(1000)

	while @@FETCH_STATUS = 0
	begin
	-- Get the count of each table...
		set @sql = '
		update #tmpTable
		set [RowCount] = (select count(*) from [' + @tableName + '])
		where ObjectName = ''' + @tableName + ''''

		exec(@sql)
	   fetch next from fragmentedTables into @tableName
	end

	-- Close and deallocate the cursor.
	close fragmentedTables;
	deallocate fragmentedTables

	select LogicalFrag, [RowCount], ObjectName 
	from #tmpTable
	order by LogicalFrag desc, [RowCount] desc
	drop table #tmpTable
*/

-- Declare the cursor for the list of indexes to be defragged.
declare indexes cursor for
	select	distinct ObjectName, 
		(select max(LogicalFrag) from @fraglist f2 where f2.ObjectName = f1.ObjectName)
	from	@fraglist f1
	where	LogicalFrag >= @maxfrag
      and	INDEXPROPERTY (ObjectId, IndexName, 'IndexDepth') > 0
	group	by ObjectName, LogicalFrag
	order	by ObjectName


-- Open the cursor.
open indexes;

-- Loop through the indexes.
fetch next from indexes into @tableName, @fragmentation

while @@FETCH_STATUS = 0
begin
	set @currentDate = convert(varchar(20), getdate(), 120)
	raiserror ('%s: Rebuilding indexes and updating statics on table %s (fragmented: %d%%)...',0,1, @currentDate, @tableName, @fragmentation) with nowait

	select @execstr = 'dbcc dbreindex ([' + @tableName + ']) with no_infomsgs';
	exec(@execstr);
--	print @execstr

	select @execstr = 'update statistics [' + @tableName + ']';
	exec(@execstr);

	fetch next from indexes into @tableName, @fragmentation
end

-- Close and deallocate the cursor.
close indexes;
deallocate indexes;
go

```
