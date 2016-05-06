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
  DECLARE @index INT=0;
  DECLARE @location INT;
  DECLARE @table TABLE(item NVARCHAR(200));

  SET @location = CHARINDEX(@separator, @string);

  WHILE @location<>0
  BEGIN
	INSERT INTO @array( Item )VALUES(LTRIM(RTRIM(SUBSTRING(@string, @index, @location-@index))));

	SET @index=@location+LEN(@separator);
	SET @location=CHARINDEX(@separator, @string, @index);
  END

  INSERT INTO @array( Item )VALUES(LTRIM(RTRIM(SUBSTRING(@string, @index, LEN(@string)+1))));

  RETURN;
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
		INNER JOIN RBAC.[User] b ON a.UserId=b.Id
		WHERE OrganizationId=@organizationId;
		
		IF @maxCode IS NULL
		  SET @returnValue = @organizationCode+'1';
		ELSE 
		 SET @returnValue = @maxCode+1;
	END
	
	RETURN @returnValue;
END
GO