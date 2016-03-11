IF EXISTS(SELECT * FROM sys.objects WHERE type='TF' and name='Split')
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