USE [ES]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[���_������](
	[ID_��] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_�����] [numeric](18, 0) NULL,
	[��������_�����] [varchar](500) NULL,
	[��������_Blob] [varbinary](5000) NULL,
	[ID_�����_���_������] [numeric](18, 0) NULL,
	[���_�������] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_��] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


