BEGIN
  DECLARE @schema NVARCHAR(100);
  DECLARE @objectName NVARCHAR(100);
  DECLARE @objectType NVARCHAR(10);
  DECLARE @sql NVARCHAR(200);

  DECLARE cur_tables CURSOR FOR 
    SELECT
      s.name,t.name, t.type 
    FROM sys.objects t
    INNER JOIN sys.schemas s ON t.schema_id=s.schema_id 
    WHERE t.type IN('U','P','TF','FN');

  OPEN cur_tables

  FETCH NEXT FROM cur_tables INTO @schema, @objectName, @objectType;

  WHILE @@FETCH_STATUS=0
  BEGIN
    IF @objectType='U'
      SET @sql='DROP TABLE ['+@schema+'].['+@objectName+'];';
      ELSE IF @objectType='P'
        SET @sql='DROP PROCEDURE ['+@schema+'].['+@objectName+'];';
    ELSE IF (@objectType='TF' OR @objectType='FN')
      SET @sql='DROP FUNCTION ['+@schema+'].['+@objectName+'];';

    EXEC sys.sp_executesql @sql;

    FETCH NEXT FROM cur_tables INTO @schema, @objectName, @objectType;
  END
  CLOSE cur_tables
  DEALLOCATE cur_tables
END
GO