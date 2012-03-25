-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hotchkiss
-- Create date: 03/24/2012
-- Description:	Abstracts the interpretation of the @Interval
--				variable to allow for a dynamic enumeration. 
-- =============================================
CREATE FUNCTION dbo.fn_GetNextLocationServiceDate 
(
	-- Add the parameters for the function here
	@LastServiceDate smalldatetime,
	@Interval int = 0
)
RETURNS smalldatetime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar smalldatetime
	
	DECLARE @Years int
	DECLARE @Months int
	DECLARE @Days int
	
	SET @ResultVar = @LastServiceDate

	SELECT @Years = [Years], @Months = [Months], @Days = [Days]
	FROM dbo.ServiceIntervals 
	WHERE ServiceIntervalId = @Interval
	 
	IF (@Days > 0)
	BEGIN
		SET @ResultVar = DATEADD(dd, @Days, @ResultVar)
	END
		
	IF (@Months > 0)
	BEGIN
		SET @ResultVar = DATEADD(mm, @Months, @ResultVar)
	END
		
	IF (@Years > 0)
	BEGIN
		SET @ResultVar = DATEADD(yy, @Years, @ResultVar)
	END
	
	-- Return the result of the function
	RETURN @ResultVar

END
GO

--select dbo.fn_GetNextLocationServiceDate('03/24/2012', 1)

