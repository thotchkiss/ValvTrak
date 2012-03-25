USE [SRD]
GO

/****** Object:  Table [dbo].[ClientLocationServiceSchedules]    Script Date: 03/25/2012 00:05:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClientLocationServiceSchedules](
	[ClientLocationServiceScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[ClientLocationId] [int] NOT NULL,
	[JobTypeId] [int] NOT NULL,
	[ServiceIntervalId] [int] NOT NULL,
	[LastServiceDate] [smalldatetime] NOT NULL,
	[NextServiceDate]  AS ([dbo].[fn_GetNextLocationServiceDate]([LastServiceDate],[ServiceIntervalId])),
 CONSTRAINT [PK_ClientLocationServiceSchedules] PRIMARY KEY CLUSTERED 
(
	[ClientLocationServiceScheduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ClientLocationServiceSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ClientLocationServiceSchedules_ClientLocations] FOREIGN KEY([ClientLocationId])
REFERENCES [dbo].[ClientLocations] ([ClientLocationID])
GO

ALTER TABLE [dbo].[ClientLocationServiceSchedules] CHECK CONSTRAINT [FK_ClientLocationServiceSchedules_ClientLocations]
GO

ALTER TABLE [dbo].[ClientLocationServiceSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ClientLocationServiceSchedules_JobTypes] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([JobTypeID])
GO

ALTER TABLE [dbo].[ClientLocationServiceSchedules] CHECK CONSTRAINT [FK_ClientLocationServiceSchedules_JobTypes]
GO

ALTER TABLE [dbo].[ClientLocationServiceSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ClientLocationServiceSchedules_ServiceIntervals] FOREIGN KEY([ServiceIntervalId])
REFERENCES [dbo].[ServiceIntervals] ([ServiceIntervalId])
GO

ALTER TABLE [dbo].[ClientLocationServiceSchedules] CHECK CONSTRAINT [FK_ClientLocationServiceSchedules_ServiceIntervals]
GO


