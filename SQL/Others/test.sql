USE [ES]
GO
DECLARE @site_id INT;
SET @site_id = 0;
 
WHILE @site_id <= 1000000
BEGIN
INSERT INTO [dbo].[���_������]
           ([ID_�����]
           ,[��������_�����]
           ,[��������_Blob]
           ,[ID_�����_���_������])
     VALUES
           (254
           ,'qwe5674567'
           ,NULL
           ,NULL)
		   ;
SET @site_id = @site_id + 1;
END;
GO


