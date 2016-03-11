IF NOT EXISTS(
  SELECT * FROM sys.schemas WHERE name='RBAC'
)
EXEC sys.sp_executesql N'CREATE SCHEMA [RBAC] Authorization [dbo]';
GO
IF NOT EXISTS(
  SELECT * FROM sys.schemas WHERE name='Dynamic'
)
EXEC sys.sp_executesql N'CREATE SCHEMA [Dynamic] Authorization [dbo]';
GO
IF NOT EXISTS(
  SELECT * FROM sys.schemas WHERE name='WebApi'
)
EXEC sys.sp_executesql N'CREATE SCHEMA [WebApi] Authorization [dbo]';
GO
BEGIN
	DECLARE @table NVARCHAR(100);
	DECLARE @schema NVARCHAR(100);
	DECLARE @sql NVARCHAR(200);
	
	DECLARE cur_tables CURSOR FOR 
		SELECT s.name,t.name FROM sys.tables t INNER JOIN sys.schemas s ON t.schema_id=s.schema_id WHERE t.type='U';
	
	OPEN cur_tables
	FETCH NEXT FROM cur_tables INTO @schema, @table;
	WHILE @@FETCH_STATUS=0
	BEGIN
		SET @sql='DROP TABLE ['+@schema+'].['+@table+'];';
		
		EXEC sys.sp_executesql @sql;
		FETCH NEXT FROM cur_tables INTO @schema, @table;
	END
	CLOSE cur_tables
	DEALLOCATE cur_tables
END