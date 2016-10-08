begin
  declare @isView int;
  declare @table nvarchar(50);
  declare @schema nvarchar(50);
  declare @tableDescription sql_variant;

  declare @name nvarchar(50);
  declare @dataType nvarchar(50);
  declare @dataLength int;
  declare @isPrimaryKey int;
  declare @isNullable int;
  declare @isIdentity int;
  declare @dataDefault nvarchar(50);
  declare @description sql_variant;

  declare @index int;
  declare @ddl table(id int,source nvarchar(max));

  -- 查询所有用户表。
  DECLARE cur_tables cursor for
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

  set @index = 0;
  open cur_tables;
  fetch next from cur_tables into @schema, @table, @isView, @tableDescription;

  while @@FETCH_STATUS=0
  begin
    declare @sql nvarchar(3000);
    declare @columnDescription nvarchar(1500);

    -- 查询表的字段。
    declare cur_columns cursor for
    SELECT
      a.name AS Name
      ,b.name AS DataType
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

    set @index += 1;

    open cur_columns;
    fetch next from cur_columns into @name, @dataType, @dataLength, @isPrimaryKey, @isNullable, @isIdentity, @dataDefault, @description;

    set @columnDescription='';
    set @sql = 'Create Table ['+@schema+'].['+@table+']('+char(10);

    while @@FETCH_STATUS=0
    begin
      set @sql+= '[' + @name + '] '+@dataType;

      if @dataType in('char', 'nchar', 'varchar', 'nvarchar')
        set @sql+=' ('+ case @dataLength when -1 then 'MAX' else CAST(@dataLength as nvarchar(50)) end+')';

      if @isPrimaryKey=1 set @sql+=' Primary Key';
      else
      begin
        if @isNullable=1 set @sql+=' NULL';
        else set @sql+=' NOT NULL';
      end

      set @sql+=','+char(10);

      if @description is not null
      begin
        set @columnDescription+='EXEC sys.sp_addextendedproperty ''MS_Description'', '''+ convert(nvarchar(250), @description) + ''' ,''SCHEMA'', '''+@schema+''', ''TABLE'', '''+@table+''', ''COLUMN'', '''+@name+''''+char(10)+'GO'+char(10);
      end

      fetch next from cur_columns into @name, @dataType, @dataLength, @isPrimaryKey, @isNullable, @isIdentity, @dataDefault, @description;
    end
    close cur_columns;
    deallocate cur_columns;

    set @sql=SUBSTRING(@sql, 0, len(@sql)-1)+')'+char(10)+'GO'+char(10);
    set @sql+='EXEC sys.sp_addextendedproperty ''MS_Description'', '''+ convert(nvarchar(250), @tableDescription) + ''', ''SCHEMA'', '''+@schema+''', ''TABLE'', '''+@table+''', NULL, NULL'+char(10)+'GO'+char(10);

    insert into @ddl values(@index,@sql+@columnDescription);

    set @table=null;
    set @schema = null;
    set @tableDescription=null;

    fetch next from cur_tables into @schema, @table, @isView, @tableDescription;
  end

  close cur_tables;
  deallocate cur_tables;

  select * from @ddl order by id asc;
end