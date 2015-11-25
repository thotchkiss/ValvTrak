USE [SRD]
GO

/****** Object:  View [dbo].[vw_RateValveTests]    Script Date: 11/24/2015 10:19:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_RateValveTests]
AS
SELECT        dbo.RateValveTests.FSRNum, dbo.RateValveTests.DateTested, dbo.RateValveTests.ConditionOfWearSleeve, dbo.RateValveTests.ConditionOfDisc, dbo.RateValveTests.PercentDiscWear, 
                         dbo.RateValveTests.ExternalCondition, dbo.RateValveTests.Remarks, dbo.RateValveTests.CustomerWitness, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.ServiceItems.SerialNum, 
                         dbo.Clients.Name AS ClientName, dbo.Manufacturers.Manufacturer, dbo.ClientLocations.PropertyNumber, dbo.ClientLocations.Name AS LocationName, dbo.ManufacturerModels.Model, 
                         dbo.RateValveTests.RateValveTestID, dbo.RateValveTests.JobID, dbo.Jobs.SalesOrderNum
FROM            dbo.RateValveTests INNER JOIN
                         dbo.Jobs ON dbo.RateValveTests.JobID = dbo.Jobs.JobID INNER JOIN
                         dbo.ClientLocations ON dbo.Jobs.ClientLocationID = dbo.ClientLocations.ClientLocationID INNER JOIN
                         dbo.Clients ON dbo.ClientLocations.ClientID = dbo.Clients.ClientID INNER JOIN
                         dbo.ServiceItems ON dbo.RateValveTests.ServiceItemID = dbo.ServiceItems.ServiceItemID INNER JOIN
                         dbo.Manufacturers ON dbo.ServiceItems.ManufacturerID = dbo.Manufacturers.ManufacturerID INNER JOIN
                         dbo.ManufacturerModels ON dbo.ServiceItems.ManufacturerModelID = dbo.ManufacturerModels.ManufacturerModelID AND 
                         dbo.Manufacturers.ManufacturerID = dbo.ManufacturerModels.ManufacturerID INNER JOIN
                         dbo.Employees ON dbo.RateValveTests.TechID = dbo.Employees.EmployeeID

GO

