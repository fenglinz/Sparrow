-- =============================================
-- Author:      张枫林
-- Create date: 2015-12-03
-- Description: 字符串分隔函数。
-- Parameters:
--              @string 要分隔的字符串。
--              @separator 分隔字符串。
-- =============================================
CREATE FUNCTION [Split]
(
  @string NVARCHAR(MAX),
  @separator NVARCHAR(10) = ','
)
RETURNS @array TABLE (Item NVARCHAR(500))
AS
BEGIN
  DECLARE @index INT= 0;
  DECLARE @location INT;
  DECLARE @table TABLE (item NVARCHAR(200));

  SET @location = CHARINDEX(@separator, @string);

  WHILE @location<>0
  BEGIN
    INSERT  INTO @array(Item)VALUES(LTRIM(RTRIM(SUBSTRING(@string, @index, @location - @index))));

    SET @index = @location + LEN(@separator);
    SET @location = CHARINDEX(@separator, @string, @index);
  END;

  INSERT INTO @array(Item)VALUES(LTRIM(RTRIM(SUBSTRING(@string, @index, LEN(@string) + 1))));

  RETURN;
END;
GO



-- =============================================
-- Author:      张枫林
-- Create date: 2016-4-7
-- Description: 获取新工号
-- =============================================
CREATE FUNCTION [RBAC].[GetNewEmployeeCode]
(
  @organizationId NVARCHAR(36)
)
RETURNS NVARCHAR(20)
AS
BEGIN
  DECLARE @returnValue NVARCHAR(20);
  DECLARE @organizationCode NVARCHAR(10);

  SELECT
    @organizationCode = Code
  FROM
    RBAC.Organization
  WHERE
    Id=@organizationId;

  IF @organizationCode IS NOT NULL
  BEGIN
    DECLARE @maxCode INT;
    SELECT
      @maxCode = MAX(CAST(b.Code AS INT))
    FROM RBAC.StaffOrganize a
    INNER JOIN RBAC.[User] b ON a.UserId=b.Id
    WHERE OrganizationId=@organizationId;

    IF @maxCode IS NULL
      SET @returnValue = @organizationCode + '1';
    ELSE
      SET @returnValue = @maxCode + 1;
  END;

  RETURN @returnValue;
END;
GO



-- =============================================
-- Author:      张枫林
-- Create date: 2016-4-13
-- Description: 为菜单分配按钮
-- Parameters:
--              @systemMenuId 菜单编号
--              @buttonIds 按钮编号(以','分隔)
--              @opUserId 操作者编号
-- =============================================
CREATE PROCEDURE [RBAC].[AllotButtons]
  @systemMenuId NVARCHAR(36),
  @buttonIds NVARCHAR(MAX),
  @opUserId NVARCHAR(36)
AS
BEGIN
  IF @systemMenuId IS NULL
  BEGIN
        RAISERROR('没有指定菜单编号', 16, 1);
  
        RETURN;
  END;

  DECLARE @tb_button TABLE
  (
    sort INT PRIMARY KEY IDENTITY,
    item NVARCHAR(36)
  );

  INSERT  INTO @tb_button(item) SELECT item FROM dbo.Split(@buttonIds, ',');

  DELETE FROM
    RBAC.SystemMenu
  WHERE ParentId=@systemMenuId AND Category=3 AND Name NOT IN (SELECT b.Name FROM @tb_button a INNER JOIN RBAC.Button b ON a.item=b.Id);
  DELETE FROM RBAC.RolePermission WHERE SystemMenuId IN (
    SELECT Id FROM RBAC.SystemMenu WHERE ParentId=@systemMenuId AND Category=3 AND Name NOT IN (
      SELECT b.Name FROM @tb_button a INNER JOIN RBAC.Button b ON a.item=b.Id
    )
  );
  DELETE FROM RBAC.UserPermission WHERE SystemMenuId IN (
    SELECT Id FROM RBAC.SystemMenu WHERE ParentId=@systemMenuId AND Category=3 AND Name NOT IN (
      SELECT b.Name FROM @tb_button a INNER JOIN RBAC.Button b ON a.item=b.Id
    )
  );

  DECLARE @name NVARCHAR(100);
  DECLARE @title NVARCHAR(100);
  DECLARE @image NVARCHAR(100);
  DECLARE @code NVARCHAR(400);
  DECLARE @sort INT;
  DECLARE @buttonId NVARCHAR(100);

  DECLARE cur_buttons 
  CURSOR FOR SELECT b.Name, b.Title, b.[Image], b.Code, a.sort, p.Id
  FROM @tb_button a
  INNER JOIN RBAC.Button b ON a.item=b.Id
  OUTER APPLY (
   SELECT TOP 1
    Id
   FROM RBAC.SystemMenu c WHERE c.Name=b.Name AND c.Category=3 AND c.ParentId=@systemMenuId
  ) p;

  OPEN cur_buttons;

  FETCH NEXT FROM cur_buttons INTO @name, @title, @image, @code, @sort, @buttonId;

  WHILE @@FETCH_STATUS=0
  BEGIN
    IF @buttonId IS NULL
      INSERT RBAC.SystemMenu
      (
        Id,
        ParentId,
        Name,
        Title,
        Image,
        Category,
        NavigateUrl,
        Target,
        Sort,
        Status,
        CreateUserId,
        CreateDateTime
      )
      VALUES
      (
        NEWID(),
        @systemMenuId,
        @name,
        @title,
        @image,
        3,
        @code,
        'OnClick',
        @sort,
        1,
        @opUserId,
        GETDATE()
      );
    ELSE
      UPDATE
        RBAC.SystemMenu
      SET
        Sort = @sort,
        [Image] = @image,
        NavigateUrl = @code,
        ModifyUserId = @opUserId,
        ModifyDateTime = GETDATE()
      WHERE ParentId=@systemMenuId AND Name=@name AND Title=@title AND Category=3;

    FETCH NEXT FROM cur_buttons INTO @name, @title, @image, @code, @sort, @buttonId;
  END;

  CLOSE cur_buttons;
  DEALLOCATE cur_buttons;
END;
GO



-- =============================================
-- Author:      张枫林
-- Create date: 2016-07-21
-- Description: 获取无效的文件
-- =============================================
CREATE PROCEDURE [Storage].[GetInvalidFiles]
AS
BEGIN
  SET NOCOUNT ON;

  DELETE FROM
    Storage.BusinessFile
  WHERE FileId NOT IN (SELECT Id FROM Storage.[File]);

  WITH cte AS (
    SELECT a.SavedPath FROM Storage.[File] a
    LEFT JOIN Storage.[BusinessFile] b ON a.Id=b.FileId
    WHERE b.Id IS NULL
  )
  SELECT TOP 100 * into #invalids FROM cte

  DELETE FROM [Storage].[File] where SavedPath in(select * from #invalids);

  SELECT * FROM #invalids;
END;
GO

