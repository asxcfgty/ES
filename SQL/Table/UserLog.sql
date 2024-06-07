USE [ES]
GO

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


