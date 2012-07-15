USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[rpt_RateValveFieldReport]    Script Date: 07/15/2012 09:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 7/8/2012
-- Description:	Report procedure for Rate Valve Field Reports
-- =============================================
CREATE PROCEDURE [dbo].[rpt_RateValveFieldReport] 
	-- Add the parameters for the stored procedure here
	@RateValveTestIDs varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    EXEC ('SELECT        RateValveTests.FSRNum, RateValveTests.DateTested, RateValveTests.ConditionOfWearSleeve, RateValveTests.ConditionOfDisc, RateValveTests.PercentDiscWear, 
                         RateValveTests.ExternalCondition, RateValveTests.Remarks, RateValveTests.CustomerWitness, Employees.FirstName, Employees.LastName, 
                         ServiceItems.SerialNum, Clients.Name AS ClientName, Manufacturers.Manufacturer, ClientLocations.PropertyNumber, ClientLocations.Name AS LocationName, 
                         ManufacturerModels.Model, RateValveTests.RateValveTestID, RateValveTests.JobID, Jobs.SalesOrderNum
	FROM            ClientLocations INNER JOIN
                         Clients ON ClientLocations.ClientID = Clients.ClientID INNER JOIN
                         ServiceItems ON ClientLocations.ClientLocationID = ServiceItems.ClientLocationID INNER JOIN
                         RateValveTests ON ServiceItems.ServiceItemID = RateValveTests.ServiceItemID INNER JOIN
                         Manufacturers ON ServiceItems.ManufacturerID = Manufacturers.ManufacturerID INNER JOIN
                         ManufacturerModels ON ServiceItems.ManufacturerModelID = ManufacturerModels.ManufacturerModelID AND 
                         Manufacturers.ManufacturerID = ManufacturerModels.ManufacturerID INNER JOIN
                         Employees ON RateValveTests.TechID = Employees.EmployeeID INNER JOIN
                         Jobs ON RateValveTests.JobID = Jobs.JobID
	WHERE        (RateValveTests.RateValveTestID IN (' + @RateValveTestIDs + '))')

END
GO
/****** Object:  StoredProcedure [dbo].[rpt_RateValveParts]    Script Date: 07/15/2012 09:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 7/8/2012
-- Description:	Procedure for Rate Valve Parts Subreport
-- =============================================
CREATE PROCEDURE [dbo].[rpt_RateValveParts] 
	-- Add the parameters for the stored procedure here
	@RateValveTestID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #Parts
	(
		Quantity_CD1 int NULL,
		PartNumber_CD1 varchar(255) NULL,
		Description_CD1 varchar(255) NULL,
		
		Quantity_CD2 int NULL,
		PartNumber_CD2 varchar(255) NULL,
		Description_CD2 varchar(255) NULL,
		
		Quantity_CSK_SFDAL2015 int NULL,
		PartNumber_CSK_SFDAL2015 varchar(255) NULL,
		Description_CSK_SFDAL2015 varchar(255) NULL,
		
		Quantity_WSXA0066 int NULL,
		PartNumber_WSXA0066 varchar(255) NULL,
		Description_WSXA0066 varchar(255) NULL,
		
		Quantity_CST00022 int NULL,
		PartNumber_CST00022 varchar(255) NULL,
		Description_CST00022 varchar(255) NULL,
		
		Quantity_DRV38 int NULL,
		PartNumber_DRV38 varchar(255) NULL,
		Description_DRV38 varchar(255) NULL,
		
		Quantity_FT000024 int NULL,
		PartNumber_FT000024 varchar(255) NULL,
		Description_FT000024 varchar(255) NULL,
		
		Quantity_CSK_SFDAL2050_D2 int NULL,
		PartNumber_CSK_SFDAL2050_D2 varchar(255) NULL,
		Description_CSK_SFDAL2050_D2 varchar(255) NULL,
		
		Quantity_CST00051 int NULL,
		PartNumber_CST00051 varchar(255) NULL,
		Description_CST00051 varchar(255) NULL,
		
		Quantity_CRK_FBA2006 int NULL,
		PartNumber_CRK_FBA2006 varchar(255) NULL,
		Description_CRK_FBA2006 varchar(255) NULL,
		
		Quantity_BSE00001 int NULL,
		PartNumber_BSE00001 varchar(255) NULL,
		Description_BSE00001 varchar(255) NULL,
		
		Quantity_BBL00025 int NULL,
		PartNumber_BBL00025 varchar(255) NULL,
		Description_BBL00025 varchar(255) NULL,
		
		Quantity_BST00008 int NULL,
		PartNumber_BST00008 varchar(255) NULL,
		Description_BST00008 varchar(255) NULL,
		
		Quantity_SB140125 int NULL,
		PartNumber_SB140125 varchar(255) NULL,
		Description_SB140125 varchar(255) NULL,
		
		Quantity_51974200 int NULL,
		PartNumber_51974200 varchar(255) NULL,
		Description_51974200 varchar(255) NULL,
		
		Quantity_52070434 int NULL,
		PartNumber_52070434 varchar(255) NULL,
		Description_52070434 varchar(255) NULL,
		
		Quantity_51961525 int NULL,
		PartNumber_51961525 varchar(255) NULL,
		Description_51961525 varchar(255) NULL,
		
		Quantity_52119435 int NULL,
		PartNumber_52119435 varchar(255) NULL,
		Description_52119435 varchar(255) NULL,
		
		Quantity_51960230 int NULL,
		PartNumber_51960230 varchar(255) NULL,
		Description_51960230 varchar(255) NULL
	)
	
	INSERT INTO #Parts VALUES(
		NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
		NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
		NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
		
	UPDATE #Parts SET
		Quantity_CD1 = Quantity,
		PartNumber_CD1 = PartNumber,
		Description_CD1 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 1
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_CD2 = Quantity,
		PartNumber_CD2 = PartNumber,
		Description_CD2 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 2
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_CSK_SFDAL2015 = Quantity,
		PartNumber_CSK_SFDAL2015 = PartNumber,
		Description_CSK_SFDAL2015 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 3
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_WSXA0066 = Quantity,
		PartNumber_WSXA0066 = PartNumber,
		Description_WSXA0066 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 4
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_CST00022 = Quantity,
		PartNumber_CST00022 = PartNumber,
		Description_CST00022 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 5
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_DRV38 = Quantity,
		PartNumber_DRV38 = PartNumber,
		Description_DRV38 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 6
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_FT000024 = Quantity,
		PartNumber_FT000024 = PartNumber,
		Description_FT000024 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 7
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_CSK_SFDAL2050_D2 = Quantity,
		PartNumber_CSK_SFDAL2050_D2 = PartNumber,
		Description_CSK_SFDAL2050_D2 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 8
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_CST00051 = Quantity,
		PartNumber_CST00051 = PartNumber,
		Description_CST00051 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 9
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_CRK_FBA2006 = Quantity,
		PartNumber_CRK_FBA2006 = PartNumber,
		Description_CRK_FBA2006 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 10
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_BSE00001 = Quantity,
		PartNumber_BSE00001 = PartNumber,
		Description_BSE00001 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 11
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_BBL00025 = Quantity,
		PartNumber_BBL00025 = PartNumber,
		Description_BBL00025 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 12
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_BST00008 = Quantity,
		PartNumber_BST00008 = PartNumber,
		Description_BST00008 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 13
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_SB140125 = Quantity,
		PartNumber_SB140125 = PartNumber,
		Description_SB140125 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 14
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_51974200 = Quantity,
		PartNumber_51974200 = PartNumber,
		Description_51974200 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 15
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_52070434 = Quantity,
		PartNumber_52070434 = PartNumber,
		Description_52070434 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 16
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_51961525 = Quantity,
		PartNumber_51961525 = PartNumber,
		Description_51961525 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 17
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_52119435 = Quantity,
		PartNumber_52119435 = PartNumber,
		Description_52119435 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 18
		AND rvpu.RateValveTestID = @RateValveTestID
		
	UPDATE #Parts SET
		Quantity_51960230 = Quantity,
		PartNumber_51960230 = PartNumber,
		Description_51960230 = [Description]
	FROM RateValveParts rvp
		INNER JOIN RateValveTestPartsUsed rvpu ON rvp.RateValvePartID = rvpu.RateValvePartID
	WHERE rvp.RateValvePartID = 19
		AND rvpu.RateValveTestID = @RateValveTestID
	
    SELECT * FROM #Parts
    
	DROP TABLE #Parts 
	
END
GO
/****** Object:  Table [dbo].[RateValveParts]    Script Date: 07/15/2012 09:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RateValveParts](
	[RateValvePartID] [int] IDENTITY(1,1) NOT NULL,
	[PartNumber] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[LayoutColumn] [int] NOT NULL,
	[LayoutOrder] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_RateValveParts] PRIMARY KEY CLUSTERED 
(
	[RateValvePartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RateValveTests]    Script Date: 07/15/2012 09:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RateValveTests](
	[RateValveTestID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[ServiceItemID] [int] NOT NULL,
	[FSRNum] [varchar](50) NULL,
	[DateTested] [smalldatetime] NOT NULL,
	[ConditionOfWearSleeve] [int] NOT NULL,
	[ConditionOfDisc] [int] NOT NULL,
	[PercentDiscWear] [int] NOT NULL,
	[ExternalCondition] [int] NOT NULL,
	[Remarks] [varchar](4000) NULL,
	[TechID] [int] NULL,
	[CustomerWitness] [varchar](255) NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [smalldatetime] NULL,
	[ModifiedBy] [int] NULL,
	[DateModified] [smalldatetime] NULL,
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_RateValveTests] PRIMARY KEY CLUSTERED 
(
	[RateValveTestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RateValveTestPartsUsed]    Script Date: 07/15/2012 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateValveTestPartsUsed](
	[RateValveTestID] [int] NOT NULL,
	[RateValvePartID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_RateValveTestPartsUsed] PRIMARY KEY CLUSTERED 
(
	[RateValveTestID] ASC,
	[RateValvePartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_RateValveTestPartsUsed_RateValveParts]    Script Date: 07/15/2012 09:30:18 ******/
ALTER TABLE [dbo].[RateValveTestPartsUsed]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTestPartsUsed_RateValveParts] FOREIGN KEY([RateValvePartID])
REFERENCES [dbo].[RateValveParts] ([RateValvePartID])
GO
ALTER TABLE [dbo].[RateValveTestPartsUsed] CHECK CONSTRAINT [FK_RateValveTestPartsUsed_RateValveParts]
GO
/****** Object:  ForeignKey [FK_RateValveTestPartsUsed_RateValveTests]    Script Date: 07/15/2012 09:30:18 ******/
ALTER TABLE [dbo].[RateValveTestPartsUsed]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTestPartsUsed_RateValveTests] FOREIGN KEY([RateValveTestID])
REFERENCES [dbo].[RateValveTests] ([RateValveTestID])
GO
ALTER TABLE [dbo].[RateValveTestPartsUsed] CHECK CONSTRAINT [FK_RateValveTestPartsUsed_RateValveTests]
GO
/****** Object:  ForeignKey [FK_RateValveTests_CreatedBy]    Script Date: 07/15/2012 09:30:23 ******/
ALTER TABLE [dbo].[RateValveTests]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTests_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[RateValveTests] CHECK CONSTRAINT [FK_RateValveTests_CreatedBy]
GO
/****** Object:  ForeignKey [FK_RateValveTests_Employees]    Script Date: 07/15/2012 09:30:23 ******/
ALTER TABLE [dbo].[RateValveTests]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTests_Employees] FOREIGN KEY([TechID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[RateValveTests] CHECK CONSTRAINT [FK_RateValveTests_Employees]
GO
/****** Object:  ForeignKey [FK_RateValveTests_Jobs]    Script Date: 07/15/2012 09:30:23 ******/
ALTER TABLE [dbo].[RateValveTests]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTests_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[RateValveTests] CHECK CONSTRAINT [FK_RateValveTests_Jobs]
GO
/****** Object:  ForeignKey [FK_RateValveTests_ModifiedBy]    Script Date: 07/15/2012 09:30:23 ******/
ALTER TABLE [dbo].[RateValveTests]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTests_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[RateValveTests] CHECK CONSTRAINT [FK_RateValveTests_ModifiedBy]
GO
/****** Object:  ForeignKey [FK_RateValveTests_ServiceItems]    Script Date: 07/15/2012 09:30:23 ******/
ALTER TABLE [dbo].[RateValveTests]  WITH CHECK ADD  CONSTRAINT [FK_RateValveTests_ServiceItems] FOREIGN KEY([ServiceItemID])
REFERENCES [dbo].[ServiceItems] ([ServiceItemID])
GO
ALTER TABLE [dbo].[RateValveTests] CHECK CONSTRAINT [FK_RateValveTests_ServiceItems]
GO
