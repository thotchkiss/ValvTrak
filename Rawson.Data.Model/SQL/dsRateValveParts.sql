USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[dsRateValveParts]    Script Date: 12/6/2015 10:44:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 7/8/2012
-- Description:	Procedure for Rate Valve Parts Subreport
-- =============================================
ALTER PROCEDURE [dbo].[dsRateValveParts] 
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
