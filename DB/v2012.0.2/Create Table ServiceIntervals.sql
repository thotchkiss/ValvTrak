USE [SRD]
GO

/****** Object:  Table [dbo].[ServiceIntervals]    Script Date: 03/24/2012 22:47:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ServiceIntervals](
	[ServiceIntervalId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Years] [int] NOT NULL,
	[Months] [int] NOT NULL,
	[Days] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceIntervals] PRIMARY KEY CLUSTERED 
(
	[ServiceIntervalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ServiceIntervals] ADD  CONSTRAINT [DF_ServiceIntervals_Years]  DEFAULT ((0)) FOR [Years]
GO

ALTER TABLE [dbo].[ServiceIntervals] ADD  CONSTRAINT [DF_ServiceIntervals_Months]  DEFAULT ((0)) FOR [Months]
GO

ALTER TABLE [dbo].[ServiceIntervals] ADD  CONSTRAINT [DF_ServiceIntervals_Days]  DEFAULT ((0)) FOR [Days]
GO

ALTER TABLE [dbo].[ServiceIntervals] ADD  CONSTRAINT [DF_ServiceIntervals_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO


