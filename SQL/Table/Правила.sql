USE [ES]
GO

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


