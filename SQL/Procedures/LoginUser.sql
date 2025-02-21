USE [ES]
GO

ALTER PROCEDURE [dbo].[LoginUser]
	@Log VARCHAR(50) ,
	@Pass VARCHAR(50) 
AS
BEGIN
DECLARE @IdentityUser numeric;
DECLARE @cnt   NUMERIC(5);
set @IdentityUser = -1;

select @cnt = count(1) from [dbo].[Пользователи] where [Login] = @Log and [Pass] = @Pass;

if @cnt > 0
  select @IdentityUser = ISNULL(ID,-1) from [dbo].[Пользователи] where [Login] = @Log and [Pass] = @Pass;

if @IdentityUser = -1
  begin
    insert into UserLog (ID_Action, Date, State, Code, Def) values (2,  GETDATE(), 202, 202,'Ошибка авторизации');
    return 202;
  end;

insert into [dbo].[Session] ([ID_User], [ReqID], [LogDate], [LogDateEnd]) values (@IdentityUser, NEWID(), GETDATE(), GETDATE() + 0.042); ;
insert into UserLog (ID_Action, Date, State, Def) values (2,  GETDATE(), 0, 'Авторизован пользователь ' + cast(@IdentityUser as varchar(10)) );

return 0;

END
