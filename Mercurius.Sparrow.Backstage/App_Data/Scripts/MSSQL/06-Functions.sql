IF EXISTS(SELECT * FROM sys.objects WHERE type='TF' AND name='Split')
BEGIN
	DROP FUNCTION split;
END
GO
-- =============================================
-- Author:			张枫林
-- Create date: 2015-12-03
-- Description:	字符串分隔函数。
-- Parameters:
--              @string 要分隔的字符串。
--              @separator 分隔字符串。
-- =============================================
CREATE FUNCTION [Split] 
(
	 @string nvarchar(max),  
	 @separator nvarchar(10) = ','
)
RETURNS @array TABLE(Item nvarchar(500)) 
AS
BEGIN
	DECLARE @separatorIndex int,
					@tempString nvarchar(max),
					@tagString nvarchar(max);

	SET @tagString=@string;
	SET @separatorIndex=CHARINDEX(@separator,@tagString)  

	WHILE(@separatorIndex<>0)
	BEGIN
		SET @tempString = SUBSTRING(@tagString,1,@separatorIndex-1)  

		INSERT INTO @array(Item) VALUES(RTRIM(LTRIM(@tempString)));

		SET @tagString = SUBSTRING(@tagString,@separatorIndex+1,LEN(@tagString)-@separatorIndex);
		SET @separatorIndex=CHARINDEX(@separator,@tagString);
	END

	SET @tempString = @tagString;

	IF (LEN(RTRIM(LTRIM(@tempString)))>0)
		INSERT INTO @array(Item) VALUES(@tagString);
	RETURN
END
GO
IF EXISTS(
  SELECT * FROM sys.objects a
  INNER JOIN sys.schemas b ON a.schema_id=b.schema_id
  WHERE a.type='FN' AND b.name='RBAC' and a.name='GetNewEmployeeCode'
)
BEGIN
	DROP FUNCTION RBAC.GetNewEmployeeCode;
END
GO
-- =============================================
-- Author:	    张枫林
-- Create date: 2016-4-7
-- Description:	获取新工号
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
	SELECT @organizationCode=Code FROM RBAC.Organization WHERE Id=@organizationId
	
	IF @organizationCode IS NOT NULL
	BEGIN
		 DECLARE @maxCode INT;
		 SELECT
		   @maxCode = MAX(CAST(b.Code AS INT)) 
		 FROM RBAC.StaffOrganize a 
		 INNER JOIN RBAC.[User] b
			ON a.UserId=b.Id
		 WHERE OrganizationId=@organizationId;
		 
		 IF @maxCode IS NULL
		   SET @returnValue = @organizationCode+'1';
		 ELSE 
			 SET @returnValue = @maxCode+1;
	END
	
	RETURN @returnValue;
END