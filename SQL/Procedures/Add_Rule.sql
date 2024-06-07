
CREATE PROCEDURE Add_Rule
	-- Add the parameters for the stored procedure here
	@ValName VARCHAR(50) ,
	@Res     VARCHAR(500) ,
	@Val     VARCHAR(50) = NULL 
AS
BEGIN
DECLARE @Exist int;
DECLARE @IdentityC numeric;

SELECT COUNT(1) into @Exist from Значения_связи, Связи_ПП, Переменные_предикаты ПП where  Значения_связи.ID_Связи = Связи_ПП.ID_Связи and ПП.ID_ПП = Значения_связи.ID_ПП and ПП.Наименование like '%'|@ValName|'%';

IF (@Exist > 0) 
SELECT Связи_ПП.ID_Связи into @Exist from Значения_связи, Связи_ПП, Переменные_предикаты ПП where  Значения_связи.ID_Связи = Связи_ПП.ID_Связи and ПП.ID_ПП = Значения_связи.ID_ПП and ПП.Наименование like '%'|@ValName|'%';

DECLARE @IdentityPP numeric;
DECLARE @IdentityC numeric;

insert into Переменные_предикаты (Наименование,Значение) values (@Name,@Val);
SET @IdentityPP = SCOPE_IDENTITY();

insert into Связи_ПП (Значение_важности) values (0);
SET @IdentityC = SCOPE_IDENTITY();

insert into Значения_связи (ID_Связи,ID_ПП) values (@IdentityC,@IdentityPP);

insert into Доп_данные (ID_Связи,Значение_текст) values (@IdentityC,@Def);

END
GO