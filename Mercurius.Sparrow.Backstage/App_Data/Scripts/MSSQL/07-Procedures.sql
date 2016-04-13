-- =============================================
-- Author:		  张枫林
-- Create date: 2016-4-13
-- Description:	为菜单分配按钮
-- Parameters: 
--              @systemMenuId 菜单编号
--				@buttonIds 按钮编号(以','分隔)
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
  END

  IF EXISTS(SELECT * FROM tempdb.dbo.sysobjects WHERE Id=object_id('tempdb..#buttonIds') AND type='U')
    DROP TABLE #buttonIds;

  CREATE TABLE #buttonIds(sort INT IDENTITY PRIMARY KEY,item NVARCHAR(36));

  INSERT INTO #buttonIds(item) SELECT Item FROM dbo.Split(@buttonIds,',');
  
  DELETE FROM RBAC.SystemMenu WHERE ParentId=@systemMenuId AND Name NOT IN(SELECT b.Name FROM #buttonIds a INNER JOIN RBAC.Button b ON a.item=b.Id);
  DELETE FROM RBAC.RolePermission WHERE SystemMenuId IN(SELECT Id FROM RBAC.SystemMenu WHERE ParentId=@systemMenuId AND Id NOT IN(SELECT b.Name FROM #buttonIds a INNER JOIN RBAC.Button b ON a.item=b.Id));
  DELETE FROM RBAC.UserPermission WHERE SystemMenuId IN(SELECT Id FROM RBAC.SystemMenu WHERE ParentId=@systemMenuId AND Id NOT IN(SELECT b.Name FROM #buttonIds a INNER JOIN RBAC.Button b ON a.item=b.Id));
  
  DECLARE @name NVARCHAR(100);
  DECLARE @title NVARCHAR(100);
  DECLARE @image NVARCHAR(100);
  DECLARE @code NVARCHAR(400);
  DECLARE @sort INT;
  DECLARE @buttonId NVARCHAR(100);
  
  DECLARE cur_buttons CURSOR FOR 
  SELECT
    b.Name,
    b.Title,
    b.[Image],
    b.Code,
    a.Sort,
    p.Id
  FROM #buttonIds a
  INNER JOIN RBAC.Button b ON a.item=b.Id
  OUTER APPLY(
    SELECT TOP 1 Id FROM RBAC.SystemMenu c
    WHERE c.Name=b.Name AND c.Category=3 AND c.ParentId=@systemMenuId
  )p;
  
  OPEN cur_buttons
  
  FETCH NEXT FROM cur_buttons INTO @name,@title,@image,@code,@sort,@buttonId;
  
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
       )
    ELSE
      UPDATE RBAC.SystemMenu
      SET 
        Sort=@sort,
        [Image]=@image,
        NavigateUrl=@code,
        ModifyUserId=@opUserId,
        ModifyDateTime=GETDATE()
      WHERE ParentId=@systemMenuId AND Name=@name AND Title=@title AND Category=3;
  
    FETCH NEXT FROM cur_buttons INTO @name,@title,@image,@code,@sort,@buttonId;
  END
  
  CLOSE cur_buttons;
  DEALLOCATE cur_buttons;
END
GO