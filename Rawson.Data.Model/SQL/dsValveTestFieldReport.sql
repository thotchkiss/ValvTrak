USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[rpt_ValveTestFieldReport]    Script Date: 11/24/2015 7:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 12/17/2010
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[dsValveTestFieldReport] 
	-- Add the parameters for the stored procedure here
	@ValveTestIds varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #Result (
		ValveTestID int, 
		JobID int, 
		SalesOrderNum varchar(50),
		SapWoNum varchar(50), 
		FSRNum varchar(50), 
		ClientName varchar(50), 
		ClientLocationName varchar(50), 
		ServiceItemID int, 
		CostCenter varchar(50), 
		Latitude decimal(18,6), 
		Longitude decimal(18,6), 
		[Description] varchar(2000), 
		SapPsv varchar(255), 
        DateTested datetime, 
		Model varchar(50), 
		ManufacturerName varchar(50), 
		Threaded bit, 
		Flanged bit, 
		SerialNum varchar(255), 
		SapEquipNum varchar(255), 
		InletSize decimal(9,3), 
		OutletSize decimal(9,3), 
		InletFlangeRating decimal(9,3), 
		OutletFlangeRating decimal(9,3), 
		ModelSize varchar(25), 
		SetPressure float,
		BackPressure float, 
		ColdDiffPressure float, 
		TempCorr float, 
		Capacity float, 
		CapacityTypeID int, 
		CapacityTypeDisplay varchar(50), 
		SealNum varchar(50), 
		GaugeNum varchar(50), 
		CalibrationDue datetime, 
		CodedSource bit, 
		CodedDisplay varchar(3), 
		ValveDate datetime, 
		IsolationValve bit, 
		ReliefValveSupport int, 
		TestPort bit, 
		WeatherCap int, 
		DotLocation bit, 
		JsaComplete bit, 
		SetPressureFound decimal(9,2), 
		SetPressureLeft decimal(9,2),
		Pop_1 decimal(9,2),
		Pop_2 decimal(9,2),
		Pop_3 decimal(9,2), 
		TestResultID int, 
        TestResultDisplay varchar(50), 
		Notes varchar(2000), 
		ReviewItems varchar(500), 
		TechID int, 
		TechnicianID int, 
		TechnicianDisplay varchar(101), 
		CustomerWitness varchar(50), 
		CreatedBy int, 
		CreatedByDisplay varchar(101), 
		CreatedDate datetime
	)

	INSERT #Result
    EXEC ('SELECT     ValveTestID, JobID, SalesOrderNum, SapWoNum, FSRNum, ClientName, ClientLocationName, ServiceItemID, CostCenter, Latitude, Longitude, Description, SapPsv, 
                      DateTested, Model, ManufacturerName, Threaded, Flanged, SerialNum, SapEquipNum, InletSize, OutletSize, InletFlangeRating, OutletFlangeRating, ModelSize, 
                      SetPressure, BackPressure, ColdDiffPressure, TempCorr, Capacity, CapacityTypeID, CapacityTypeDisplay, SealNum, GaugeNum, CalibrationDue, CodedSource, 
                      CodedDisplay, ValveDate, IsolationValve, ReliefValveSupport, TestPort, WeatherCap, DotLocation, JsaComplete, 
					  SetPressureFound, SetPressureLeft, Pop_1, Pop_2, Pop_3, TestResultID, 
                      TestResultDisplay, Notes, ReviewItems, TechID, TechnicianID, TechnicianDisplay, CustomerWitness, CreatedBy, CreatedByDisplay, CreatedDate
			FROM         vw_ValveTests
			WHERE     (ValveTestID IN (' + @ValveTestIds + '))')

	SELECT * FROM #Result

	-- exec [dbo].[dsValveTestFieldReport] '15062'

END
