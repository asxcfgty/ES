USE [ES]
GO

ALTER PROCEDURE [dbo].[Add_User]
	@Log VARCHAR(50) ,
	@Pass VARCHAR(50) ,
	@Role INT,
	@Name VARCHAR(50),
	@Sname VARCHAR(50),
	@Patronymic VARCHAR(50)
AS
BEGIN
DECLARE @IdentityUser numeric;
DECLARE @cntRole numeric;

select @cntRole = count(1) from Роли where ID = @Role;

if @cntRole > 0
  begin
    insert into Пользователи (Login, Pass, Name, Sname, Patronymic) values (@Log, @Pass, @Name, @Sname, @Patronymic);
    SET @IdentityUser = SCOPE_IDENTITY();

    insert into Пользователь_Роль (ID_User, ID_Role) values (@IdentityUser, @Role);

	insert into UserLog (ID_Action, Date, State, Def) values (1,  GETDATE(), 0 ,'Вставка пользователя с ID = ' + cast(@IdentityUser as varchar(10)) );
	return 0;
  end;
else
  begin
    insert into UserLog (ID_Action, Date, State, Code, Def) values (1,  GETDATE(), 201, 201,'Ошибка вставки пользователя');
	return 201;
  end;

END
