USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[dsRateValveFieldReport]    Script Date: 12/6/2015 10:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 7/8/2012
-- Description:	Report procedure for Rate Valve Field Reports
-- =============================================
ALTER PROCEDURE [dbo].[dsRateValveFieldReport] 
	-- Add the parameters for the stored procedure here
	@RateValveTestIDs varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #Results
	(
		FSRNum varchar(50), 
		DateTested smalldatetime, 
		ConditionOfWearSleeve int, 
		ConditionOfDisc int, 
		PercentDiscWear int, 
        ExternalCondition int, 
		Remarks varchar(4000), 
		CustomerWitness varchar(255), 
		FirstName varchar(50), 
		LastName varchar(50), 
        SerialNum varchar(255), 
		ClientName varchar(50), 
		Manufacturer varchar(50), 
		PropertyNumber varchar(50), 
		LocationName varchar(50), 
        Model varchar(50), 
		RateValveTestID int, 
		JobID int, 
		SalesOrderNum varchar(50)
	)

	INSERT #Results
    EXEC ('SELECT        FSRNum, DateTested, ConditionOfWearSleeve, ConditionOfDisc, PercentDiscWear, 
                         ExternalCondition, Remarks, CustomerWitness, FirstName, LastName, 
                         SerialNum, ClientName, Manufacturer, PropertyNumber, LocationName, 
                         Model, RateValveTestID, JobID, SalesOrderNum
	FROM            vw_RateValveTests
	WHERE        (RateValveTestID IN (' + @RateValveTestIDs + '))')

	SELECT * FROM #Results

--SELECT [FSRNum]
--      ,[DateTested]
--      ,[ConditionOfWearSleeve]
--      ,[ConditionOfDisc]
--      ,[PercentDiscWear]
--      ,[ExternalCondition]
--      ,[Remarks]
--      ,[CustomerWitness]
--      ,[FirstName]
--      ,[LastName]
--      ,[SerialNum]
--      ,[ClientName]
--      ,[Manufacturer]
--      ,[PropertyNumber]
--      ,[LocationName]
--      ,[Model]
--      ,[RateValveTestID]
--      ,[JobID]
--      ,[SalesOrderNum]
--  FROM [dbo].[vw_RateValveTests]



END
