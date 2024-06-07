
CREATE PROCEDURE Add_Rule
	-- Add the parameters for the stored procedure here
	@ValName VARCHAR(50) ,
	@Res     VARCHAR(500) ,
	@Val     VARCHAR(50) = NULL 
AS
BEGIN
DECLARE @Exist int;
DECLARE @IdentityC numeric;

SELECT COUNT(1) into @Exist from ��������_�����, �����_��, ����������_��������� �� where  ��������_�����.ID_����� = �����_��.ID_����� and ��.ID_�� = ��������_�����.ID_�� and ��.������������ like '%'|@ValName|'%';

IF (@Exist > 0) 
SELECT �����_��.ID_����� into @Exist from ��������_�����, �����_��, ����������_��������� �� where  ��������_�����.ID_����� = �����_��.ID_����� and ��.ID_�� = ��������_�����.ID_�� and ��.������������ like '%'|@ValName|'%';

DECLARE @IdentityPP numeric;
DECLARE @IdentityC numeric;

insert into ����������_��������� (������������,��������) values (@Name,@Val);
SET @IdentityPP = SCOPE_IDENTITY();

insert into �����_�� (��������_��������) values (0);
SET @IdentityC = SCOPE_IDENTITY();

insert into ��������_����� (ID_�����,ID_��) values (@IdentityC,@IdentityPP);

insert into ���_������ (ID_�����,��������_�����) values (@IdentityC,@Def);

END
GO