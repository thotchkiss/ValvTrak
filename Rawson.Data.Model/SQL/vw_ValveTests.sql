USE [SRD]
GO

/****** Object:  View [dbo].[vw_ValveTests]    Script Date: 11/30/2015 7:28:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[vw_ValveTests]
AS
SELECT     vt.ValveTestID, vt.JobID, j.SalesOrderNum, j.SapWoNum, vt.FSRNum, c.Name AS ClientName, cl.Name AS ClientLocationName, vt.ServiceItemID, vt.CostCenter, 
                      ISNULL(si.Latitude, case  when isnumeric(cl.Latitude) = 1 then cast(cl.Latitude as decimal(18,6)) else 0 end) AS Latitude, ISNULL(si.Longitude, case when isnumeric(cl.Longitude) = 1 then cast(cl.Longitude as decimal(18,6)) else 0 end) AS Longitude, 
					  si.Description, vt.PsvApplication AS SapPsv, vt.DateTested, 
                      model.Model, man.Manufacturer AS ManufacturerName, si.Threaded, si.Flanged, si.SerialNum, ISNULL(si.SapEquipNum, vt.SapPsv) AS SapEquipNum, si.InletSize, 
                      si.OutletSize, si.InletFlangeRating, si.OutletFlangeRating, dbo.fn_GetModelSize(si.ServiceItemID) AS ModelSize, vt.SetPressure, vt.BackPressure, 
                      vt.ColdDiffPressure, vt.TempCorr, vt.Capacity, vt.CapacityTypeID, capType.Display1 AS CapacityTypeDisplay, vt.SealNum, vt.GaugeNum, vt.CalibrationDue, 
                      vt.Coded AS CodedSource, CASE IsNull(vt.Coded, 0) WHEN '1' THEN 'Yes' ELSE 'No' END AS CodedDisplay, vt.ValveDate, vt.IsolationValve, vt.ReliefValveSupport, 
                      vt.TestPort, vt.WeatherCap, vt.DotLocation, vt.JsaComplete, vt.SetPressureFound, vt.SetPressureLeft, vt.Pop_1, vt.Pop_2, vt.Pop_3, vt.TestResultID, result.Result AS TestResultDisplay, vt.Notes, 
                      vt.ReviewItems, vt.TechID, j.AssignedToID AS TechnicianID, ISNULL(empTech.FirstName, '') + ' ' + ISNULL(empTech.LastName, '') AS TechnicianDisplay, 
                      vt.CustomerWitness, vt.CreatedBy, ISNULL(empCreated.FirstName, '') + ' ' + ISNULL(empCreated.LastName, '') AS CreatedByDisplay, vt.CreatedDate
FROM         dbo.ValveTests AS vt INNER JOIN
                      dbo.Jobs AS j ON vt.JobID = j.JobID INNER JOIN
                      dbo.ClientLocations AS cl ON j.ClientLocationID = cl.ClientLocationID INNER JOIN
                      dbo.Clients AS c ON cl.ClientID = c.ClientID INNER JOIN
                      dbo.ServiceItems AS si ON vt.ServiceItemID = si.ServiceItemID LEFT OUTER JOIN
                      dbo.ManufacturerModels AS model ON si.ManufacturerModelID = model.ManufacturerModelID LEFT OUTER JOIN
                      dbo.Manufacturers AS man ON model.ManufacturerID = man.ManufacturerID LEFT OUTER JOIN
                      dbo.Lists AS capType ON vt.CapacityTypeID = capType.ListValue AND capType.ListKey = 'ValveTestCapacity' LEFT OUTER JOIN
                      dbo.TestResults AS result ON vt.TestResultID = result.TestResultID LEFT OUTER JOIN
                      dbo.Employees AS empTech ON vt.TechID = empTech.EmployeeID LEFT OUTER JOIN
                      dbo.Employees AS empCreated ON vt.CreatedBy = empCreated.EmployeeID



GO



