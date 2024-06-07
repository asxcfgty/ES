USE [ES]
GO
DECLARE @site_id INT;
SET @site_id = 0;
 
WHILE @site_id <= 1000000
BEGIN
INSERT INTO [dbo].[Доп_данные]
           ([ID_Связи]
           ,[Значение_текст]
           ,[Значение_Blob]
           ,[ID_Связи_доп_вывода])
     VALUES
           (254
           ,'qwe5674567'
           ,NULL
           ,NULL)
		   ;
SET @site_id = @site_id + 1;
END;
GO


