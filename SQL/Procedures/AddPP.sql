USE [ES]
GO

/*
Функция добавления перенменной-предиката с описанием-текстом
*/
ALTER PROCEDURE [dbo].[AddPP]
	@Name VARCHAR(50)   ,      -- Наименование переменной
	@Def  VARCHAR(5000) ,      -- Описательные данные об переменной
	@Val  VARCHAR(50)   = NULL -- Значение для переменной предиката (может быть пустым)
AS
BEGIN
	DECLARE @IdentityPP   NUMERIC(5);
	DECLARE @IdentityConn NUMERIC(5);

	INSERT INTO Переменные_предикаты (Наименование,Значение) 
		VALUES (@Name,@Val);
	SET @IdentityPP = SCOPE_IDENTITY();

	INSERT INTO Связи_ПП (Значение_важности) 
		VALUES (0); --Изначально вставляем 0-значение оценки важности
	SET @IdentityConn = SCOPE_IDENTITY();

	INSERT INTO Значения_связи (ID_Связи,ID_ПП) 
		VALUES (@IdentityConn,@IdentityPP);

	INSERT INTO Доп_данные (ID_Связи,Значение_текст) 
		VALUES (@IdentityConn,@Def);
   
    return @IdentityConn; 
END
