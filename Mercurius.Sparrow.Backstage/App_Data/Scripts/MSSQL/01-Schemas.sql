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
	DECLARE @schema NVARCHAR(100);
	DECLARE @objectName NVARCHAR(100);
	DECLARE @sql NVARCHAR(200);
	
	DECLARE cur_tables CURSOR FOR 
		SELECT s.name,t.name FROM sys.tables t INNER JOIN sys.schemas s ON t.schema_id=s.schema_id WHERE t.type='U';
	
	OPEN cur_tables
	FETCH NEXT FROM cur_tables INTO @schema, @objectName;
	WHILE @@FETCH_STATUS=0
	BEGIN
		SET @sql='DROP TABLE ['+@schema+'].['+@objectName+'];';
		
		EXEC sys.sp_executesql @sql;
		FETCH NEXT FROM cur_tables INTO @schema, @objectName;
	END
	CLOSE cur_tables
	DEALLOCATE cur_tables

	DECLARE cur_procedures CURSOR FOR
		SELECT s.name, p.name FROM sys.procedures p INNER JOIN sys.schemas s ON p.schema_id=s.schema_id WHERE p.type='P';
	
	OPEN cur_procedures
	FETCH NEXT FROM cur_procedures INTO @schema, @objectName;
	WHILE @@FETCH_STATUS=0
	BEGIN
	  SET @sql='DROP PROCEDURE ['+@schema+'].['+@objectName+'];';

	  EXEC sys.sp_executesql @sql;
	  FETCH NEXT FROM cur_procedures INTO @schema, @objectName;
	END
    CLOSE cur_procedures;
	DEALLOCATE cur_procedures;
END