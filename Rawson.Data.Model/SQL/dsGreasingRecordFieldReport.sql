USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[dsGreasingRecordFieldReport]    Script Date: 12/6/2015 11:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 12/19/2010
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[dsGreasingRecordFieldReport] 
	-- Add the parameters for the stored procedure here
	@GreasingRecordIds varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #Results
	(
	  [GreasingRecordID] int
      ,[JobID] int
      ,[ClientFieldOffice] varchar(50)
      ,[PipelineSegment] varchar(100)
      ,[Field] varchar(50)
      ,[SapWO] varchar(50)
      ,[SapEquipNum] varchar(50)
      ,[FSRNum] varchar(50)
      ,[CreatedBy] int
      ,[CreatedByDisplay] varchar(101)
      ,[CreatedDate] datetime
      ,[ModifiedBy] int
      ,[ModifiedDate] datetime
      ,[CompletionDate] smalldatetime
      ,[ClientName] varchar(50)
      ,[ClientLocationName] varchar(50)
      ,[TechnicianID] int
      ,[TechnicianDisplay] varchar(101)
      ,[SalesOrderNum] varchar(50)
      ,[SapWoNum] varchar (50)
      ,[Longitude] varchar(50)
      ,[Latitude] varchar(50)
	)

	INSERT #Results
    EXEC ('select  [GreasingRecordID]
			  ,[JobID]
			  ,[ClientFieldOffice]
			  ,[PipelineSegment]
			  ,[Field]
			  ,[SapWO]
			  ,[SapEquipNum]
			  ,[FSRNum]
			  ,[CreatedBy]
			  ,[CreatedByDisplay]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
			  ,[CompletionDate]
			  ,[ClientName]
			  ,[ClientLocationName]
			  ,[TechnicianID]
			  ,[TechnicianDisplay]
			  ,[SalesOrderNum]
			  ,[SapWoNum]
			  ,[Longitude]
			  ,[Latitude] from vw_GreasingRecords
		where GreasingRecordID in (' + @GreasingRecordIds + ')')

	SELECT * FROM #Results

	--select  [GreasingRecordID]
	--		  ,[JobID]
	--		  ,[ClientFieldOffice]
	--		  ,[PipelineSegment]
	--		  ,[Field]
	--		  ,[SapWO]
	--		  ,[SapEquipNum]
	--		  ,[FSRNum]
	--		  ,[CreatedBy]
	--		  ,[CreatedByDisplay]
	--		  ,[CreatedDate]
	--		  ,[ModifiedBy]
	--		  ,[ModifiedDate]
	--		  ,[CompletionDate]
	--		  ,[ClientName]
	--		  ,[ClientLocationName]
	--		  ,[TechnicianID]
	--		  ,[TechnicianDisplay]
	--		  ,[SalesOrderNum]
	--		  ,[SapWoNum]
	--		  ,[Longitude]
	--		  ,[Latitude] 
	--from vw_GreasingRecords

END
