USE [master]
GO

CREATE DATABASE [ES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ES] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ES] SET ARITHABORT OFF 
GO
ALTER DATABASE [ES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ES] SET  MULTI_USER 
GO
ALTER DATABASE [ES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ES] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ES] SET QUERY_STORE = ON
GO
ALTER DATABASE [ES] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ES]
GO
/****** Object:  User [User]    Script Date: 06.06.2024 10:16:54 ******/
CREATE USER [User] FOR LOGIN [User] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Guest1]    Script Date: 06.06.2024 10:16:54 ******/
CREATE USER [Guest1] FOR LOGIN [Guest] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminES]    Script Date: 06.06.2024 10:16:54 ******/
CREATE USER [AdminES] FOR LOGIN [AdminES] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Code]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Code](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Def] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DUAL]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DUAL](
	[DUMMY] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[ReqID] [nvarchar](50) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[LogDateEnd] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Action] [int] NULL,
	[ReqID] [nvarchar](50) NULL,
	[Date] [datetime] NOT NULL,
	[ID_User] [int] NULL,
	[Code] [datetime] NULL,
	[Def] [nvarchar](1000) NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Доп_данные]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Доп_данные](
	[ID_ДД] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_Связи] [numeric](18, 0) NULL,
	[Значение_текст] [varchar](500) NULL,
	[Значение_Blob] [varbinary](5000) NULL,
	[ID_Связи_доп_вывода] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ДД] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Значения_связи]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Значения_связи](
	[ID_СП] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_Связи] [numeric](18, 0) NULL,
	[ID_ПП] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_СП] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Переменные_предикаты]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Переменные_предикаты](
	[ID_ПП] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Значение] [varchar](50) NULL,
	[Наименование] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ПП] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Pass] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Sname] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
 CONSTRAINT [PK__Пользова] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь_Роль]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь_Роль](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[ID_Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Права]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Права](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Def] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Права_Роль]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Права_Роль](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Role] [int] NOT NULL,
	[ID_Rule] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Правила]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Правила](
	[ID_Правила] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_Связи] [numeric](18, 0) NULL,
	[Вывод] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Def] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Связи_ПП]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Связи_ПП](
	[ID_Связи] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Значение_важности] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Связи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [ID_СП]    Script Date: 06.06.2024 10:16:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_СП] ON [dbo].[Значения_связи]
(
	[ID_СП] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID_ПП]    Script Date: 06.06.2024 10:16:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_ПП] ON [dbo].[Переменные_предикаты]
(
	[ID_ПП] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20230516-071102]    Script Date: 06.06.2024 10:16:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20230516-071102] ON [dbo].[Правила]
(
	[ID_Правила] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20230516-071123]    Script Date: 06.06.2024 10:16:54 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230516-071123] ON [dbo].[Правила]
(
	[ID_Связи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID_Связи]    Script Date: 06.06.2024 10:16:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Связи] ON [dbo].[Связи_ПП]
(
	[ID_Связи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Add_User]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Add_User]
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
GO
/****** Object:  StoredProcedure [dbo].[AddLinkDD]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Функция добавления перенменной-предиката с описанием-текстом
*/
CREATE PROCEDURE [dbo].[AddLinkDD]
	@ID_LinkS NUMERIC(10)   ,     
	@ID_Link  NUMERIC(10) 
AS
BEGIN
	DECLARE @IdentityPP   NUMERIC(5);
	DECLARE @IdentityConn NUMERIC(5);

	INSERT INTO Доп_данные (ID_Связи,ID_Связи_доп_вывода) 
		VALUES (@ID_LinkS,@ID_Link);
END
GO
/****** Object:  StoredProcedure [dbo].[AddPP]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Функция добавления перенменной-предиката с описанием-текстом
*/
CREATE PROCEDURE [dbo].[AddPP]
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
GO
/****** Object:  StoredProcedure [dbo].[isLoginUser]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[isLoginUser]
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
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 06.06.2024 10:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoginUser]
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
GO
USE [master]
GO
ALTER DATABASE [ES] SET  READ_WRITE 
GO
