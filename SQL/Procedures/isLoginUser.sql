USE [ES]
GO

ALTER PROCEDURE [dbo].[isLoginUser]
	@ReqID VARCHAR(50) 
AS
BEGIN
DECLARE @cnt   NUMERIC(5);

select @cnt = count(1) from [dbo].[Session] where [ReqID] = @ReqID and [LogDateEnd] >= GETDATE();

if @cnt > 0
  begin
    insert into UserLog (ID_Action, Date, State, Def) values (3,  GETDATE(), 0, 'Проверка авторизации ReqID = ' + @ReqID );
    return 0;
  end;
else
  begin
    insert into UserLog (ID_Action, Date, State, Code, Def) values (3,  GETDATE(), 203, 203, 'Проверка авторизации ReqID = ' + @ReqID );
    return 203;
  end;

END
