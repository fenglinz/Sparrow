BEGIN
  DECLARE @isView INT;
  DECLARE @table NVARCHAR(50);
  DECLARE @schema NVARCHAR(50);
  DECLARE @tableDescription SQL_VARIANT;

  DECLARE @name NVARCHAR(50);
  DECLARE @dataType NVARCHAR(50);
  DECLARE @dataLength INT;
  DECLARE @isPrimaryKey INT;
  DECLARE @isNullable INT;
  DECLARE @isIdentity INT;
  DECLARE @dataDefault NVARCHAR(50);
  DECLARE @description SQL_VARIANT;

  DECLARE @index INT;
  DECLARE @ddl TABLE(id INT, source NVARCHAR(max));

  -- 查询所有用户表。
  DECLARE cur_tables CURSOR FOR
    WITH cte AS(
      SELECT
        SCHEMA_NAME(schema_id) AS [Schema],
          type,
          name,
          object_id
      FROM sys.objects
      WHERE type IN('U','V') AND Name<>'sysdiagrams'
      )
      SELECT
        cte.[Schema],
        cte.Name,
        CASE cte.type WHEN 'U' THEN 0 ELSE 1 END IsView,
        CASE WHEN a.value IS NULL THEN cte.name ELSE a.value END Comments
      FROM cte
      LEFT JOIN sys.extended_properties a ON cte.object_id=a.major_id AND a.minor_id=0
    ORDER BY cte.[schema],cte.Name;

  SET @index = 0;
  OPEN cur_tables;
  FETCH NEXT FROM cur_tables INTO @schema, @table, @isView, @tableDescription;

  WHILE @@FETCH_STATUS=0
  BEGIN
    DECLARE @sql NVARCHAR(max);
    DECLARE @columnDescription NVARCHAR(max);

    -- 查询表的字段。
    DECLARE cur_columns CURSOR FOR
      SELECT
        a.name AS Name
        ,UPPER(b.name) AS DataType
        ,COLUMNPROPERTY(a.id, a.name, 'PRECISION') AS DataLength
        ,CASE WHEN EXISTS(
          SELECT 1 FROM sysobjects
          WHERE xtype= 'PK' and name in ( 
            SELECT
              name
            FROM sysindexes
            WHERE indid in(
              SELECT
                indid
              FROM sysindexkeys
              WHERE id = a.id AND colid=a.colid
            )
          )
        ) THEN 1 ELSE 0 END AS IsPrimaryKey
        ,a.IsNullable AS IsNullable
        ,COLUMNPROPERTY(a.id, a.name, 'IsIdentity') AS IsIdentity
        ,ISNULL(e.text, '') AS DataDefault
        ,CASE
          WHEN g.[value] IS NULL THEN a.Name
          ELSE g.[value]
        END AS Description
      FROM syscolumns a
      LEFT JOIN systypes b 
        ON a.xusertype=b.xusertype
      INNER JOIN sys.objects d 
        ON a.id=d.object_id AND (d.type='U' OR d.type='V') AND d.name<>'dtproperties'
      INNER JOIN sys.schemas s
        ON d.schema_id=s.schema_id
      LEFT JOIN syscomments e 
        ON a.cdefault=e.id
      LEFT JOIN sys.extended_properties g 
        ON a.id=g.major_id AND a.colid=g.minor_id
      WHERE s.name=@schema AND d.name=@table
      ORDER BY a.id, a.colorder;

    SET @index += 1;

    OPEN cur_columns;
    FETCH NEXT FROM cur_columns INTO @name, @dataType, @dataLength, @isPrimaryKey, @isNullable, @isIdentity, @dataDefault, @description;

    SET @columnDescription='';
    SET @sql = 'Create Table ['+@schema+'].['+@table+']('+CHAR(10);

    WHILE @@FETCH_STATUS=0
    BEGIN
      SET @sql+= '  [' + @name + '] '+@dataType;

      IF @dataType in('char', 'nchar', 'varchar', 'nvarchar')
        SET @sql+=' ('+ CASE @dataLength WHEN -1 THEN 'MAX' ELSE CAST(@dataLength AS NVARCHAR(50)) END+')';

      IF @isPrimaryKey=1 SET @sql+=' Primary Key';
      ELSE
      BEGIN
        IF @isNullable=1 SET @sql+=' NULL';
        ELSE SET @sql+=' NOT NULL';
      END

      SET @sql+=','+CHAR(10);

      IF @description IS NOT NULL
      BEGIN
        SET @columnDescription+='EXEC sys.sp_addextendedproperty ''MS_Description'', '''+ CONVERT(NVARCHAR(250), @description) + ''' ,''SCHEMA'', '''+@schema+''', ''TABLE'', '''+@table+''', ''COLUMN'', '''+@name+''';'+CHAR(10)+'GO'+CHAR(10);
      END

      FETCH NEXT FROM cur_columns INTO @name, @dataType, @dataLength, @isPrimaryKey, @isNullable, @isIdentity, @dataDefault, @description;
    END
    CLOSE cur_columns;
    DEALLOCATE cur_columns;

    SET @sql=SUBSTRING(@sql, 0, len(@sql)-1)+CHAR(10)+');'+CHAR(10)+'GO'+CHAR(10);
    SET @sql+='EXEC sys.sp_addextendedproperty ''MS_Description'', '''+ convert(nvarchar(250), @tableDescription) + ''', ''SCHEMA'', '''+@schema+''', ''TABLE'', '''+@table+''', NULL, NULL;'+CHAR(10)+'GO'+CHAR(10);

    INSERT INTO @ddl VALUES(@index,@sql+@columnDescription);

    SET @table=NULL;
    SET @schema=NULL;
    SET @tableDescription=NULL;

    FETCH NEXT FROM cur_tables INTO @schema, @table, @isView, @tableDescription;
  END

  CLOSE cur_tables;
  DEALLOCATE cur_tables;

  SELECT * FROM @ddl ORDER BY id ASC;
END