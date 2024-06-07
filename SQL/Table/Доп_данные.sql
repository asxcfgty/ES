USE [ES]
GO

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
	[Кол_показов] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ДД] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


