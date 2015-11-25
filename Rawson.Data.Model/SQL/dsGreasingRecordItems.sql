USE [SRD]
GO
/****** Object:  StoredProcedure [dbo].[rpt_GreasingRecordFieldReport]    Script Date: 11/24/2015 8:49:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 12/19/2010
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[dsGreasingRecordItems] 
	-- Add the parameters for the stored procedure here
	@GreasingRecordId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
	  [GreasingRecordItemID]
      ,[GreasingRecordID]
      ,[ServiceItemID]
      ,[SerialNum]
      ,[Description]
      ,[SapEquipNum]
      ,[ServiceItemTypeDisplay]
      ,[ManufacturerName]
      ,[Model]
      ,[ModelSize]
      ,[ValveLocation]
      ,[ActuatorInspected]
      ,[ActuatorInspectedDisplay]
      ,[ActuatorLubed]
      ,[ActuatorLubedDisplay]
      ,[PercentCycled]
      ,[ValveSecured]
      ,[ValveSecuredDisplay]
      ,[FlangeOrScrew]
      ,[EaseOfOperation]
      ,[SeatsChecked]
      ,[SeatsCheckedDisplay]
      ,[SeatsLubed]
      ,[SeatsLubedDisplay]
      ,[Leaking]
      ,[LeakingDisplay]
      ,[LubeTypeID]
      ,[LubeTypeDisplay]
      ,[AmountInjected]
      ,[Notes]
      ,[CreatedBy]
      ,[CreatedDate]
	FROM vw_GreasingRecordItems
	WHERE [GreasingRecordID] = @GreasingRecordID

END
