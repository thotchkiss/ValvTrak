USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[rpt_WellSafetyFieldReport]    Script Date: 11/24/2015 8:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 12/19/2010
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[dsWellSafetyFieldReport] 
	-- Add the parameters for the stored procedure here
	@WellSafetyTestIds varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #Results
	(
		WellSafetyTestID int, 
		JobID int, 
		ServiceItemID int, 
		ServiceItemManufacturer varchar(50), 
		ServiceItemModel varchar(50), 
		ServiceItemSerial varchar(50), 
		ServiceItemType varchar(50), 
		FSR_Num varchar(50), 
		SSV_SAP_Num varchar(50), 
		FormDate smalldatetime, 
        BodyMaterial varchar(2), 
		BodyMaterialDisplay varchar(15), 
		PlugMaterial varchar(2), 
		PlugMaterialDisplay varchar(15), 
		SteamMaterial varchar(2), 
		SteamMaterialDisplay varchar(15), 
		GateMaterial varchar(2), 
		GateMaterialDisplay varchar(15),
		PortSize varchar(50), 
		PressClass varchar(50), 
		ActuatorType varchar(2), 
		ActuatorTypeDisplay varchar(15), 
		ActuatorModel varchar(50), 
		ActuatorSerialNum varchar(50), 
		AirSupplyMedium varchar(1), 
		AirSupplyMediumDisplay varchar(3), 
		Condition varchar(50), 
		DateManufactured smalldatetime, 
        SystemLocation varchar(3), 
		SystemLocationDisplay varchar(11), 
		ControllerType varchar(50), 
		HI varchar(50), 
		LO varchar(50), 
		Notes varchar(2000), 
		CustomerWitness varchar(50), 
		ManualOverride varchar(3), 
		ManualOverrideDisplay varchar(10), 
		TestResultID int, 
        TestResultDisplay varchar(50), 
		CreatedBy int, 
		CreatedByDisplay varchar(101), 
		CreatedDate datetime, 
		CompletionDate smalldatetime, 
		SalesOrderNum varchar(50), 
		LocationWellName varchar(50), 
		[Description] varchar(2000), 
		ModelSize varchar(25), 
		TechnicianID int, 
        TechnicianDisplay varchar(101)
	)

	INSERT #Results
    EXEC ('SELECT WellSafetyTestID, JobID, ServiceItemID, ServiceItemManufacturer, ServiceItemModel, ServiceItemSerial, ServiceItemType, FSR_Num, SSV_SAP_Num, FormDate, 
                         BodyMaterial, BodyMaterialDisplay, PlugMaterial, PlugMaterialDisplay, SteamMaterial, SteamMaterialDisplay, GateMaterial, GateMaterialDisplay, PortSize, 
                         PressClass, ActuatorType, ActuatorTypeDisplay, ActuatorModel, ActuatorSerialNum, AirSupplyMedium, AirSupplyMediumDisplay, Condition, DateManufactured, 
                         SystemLocation, SystemLocationDisplay, ControllerType, HI, LO, Notes, CustomerWitness, ManualOverride, ManualOverrideDisplay, TestResultID, 
                         TestResultDisplay, CreatedBy, CreatedByDisplay, CreatedDate, CompletionDate, SalesOrderNum, LocationWellName, Description, ModelSize, TechnicianID, 
                         TechnicianDisplay
			FROM            vw_WellSafetyTests
			WHERE        (WellSafetyTestID IN (' + @WellSafetyTestIds + '))')

	SELECT * FROM #Results
END
