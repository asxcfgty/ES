USE [ES]
GO

/*
Функция добавления перенменной-предиката с описанием-текстом
*/
ALTER PROCEDURE [dbo].[AddLinkDD]
	@ID_LinkS NUMERIC(10)   ,     
	@ID_Link  NUMERIC(10) 
AS
BEGIN
	DECLARE @IdentityPP   NUMERIC(5);
	DECLARE @IdentityConn NUMERIC(5);

	INSERT INTO Доп_данные (ID_Связи,ID_Связи_доп_вывода) 
		VALUES (@ID_LinkS,@ID_Link);
END
