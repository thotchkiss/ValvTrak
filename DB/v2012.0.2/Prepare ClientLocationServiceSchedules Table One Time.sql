
DECLARE locations CURSOR FOR
SELECT cl.ClientLocationId,
       (SELECT MAX(CompletionDate) 
			FROM Jobs
			WHERE Jobs.ClientLocationId = cl.ClientLocationId 
				AND Jobs.JobTypeId = 5) as LastValveDate,
		(SELECT MAX(CompletionDate) 
			FROM Jobs
			WHERE Jobs.ClientLocationId = cl.ClientLocationId 
				AND Jobs.JobTypeId = 6) as LastGreasingDate,
		(SELECT MAX(CompletionDate) 
			FROM Jobs
			WHERE Jobs.ClientLocationId = cl.ClientLocationId 
				AND Jobs.JobTypeId = 11) as LastWellSafetyDate
FROM ClientLocations cl
WHERE cl.Active = 1

DECLARE @ClientLocationId int
DECLARE @LastValveDate smalldatetime
DECLARE @LastGreasingDate smalldatetime
DECLARE @LastWellSafetyDate smalldatetime

OPEN locations

FETCH NEXT FROM locations INTO @ClientLocationId, @LastValveDate, @LastGreasingDate, @LastWellSafetyDate

WHILE (@@FETCH_STATUS = 0)
BEGIN

	IF (@LastValveDate IS NOT NULL)
	BEGIN
	
		INSERT INTO ClientLocationServiceSchedules (ClientLocationId, JobTypeId, ServiceIntervalId, LastServiceDate)
		VALUES(@ClientLocationId, 5, 1, @LastValveDate)
	END
	
	IF (@LastGreasingDate IS NOT NULL)
	BEGIN
	
		INSERT INTO ClientLocationServiceSchedules (ClientLocationId, JobTypeId, ServiceIntervalId, LastServiceDate)
		VALUES(@ClientLocationId, 6, 1, @LastGreasingDate)
	END
	
	IF (@LastWellSafetyDate IS NOT NULL)
	BEGIN
	
		INSERT INTO ClientLocationServiceSchedules (ClientLocationId, JobTypeId, ServiceIntervalId, LastServiceDate)
		VALUES(@ClientLocationId, 11, 1, @LastWellSafetyDate)
	END

	FETCH NEXT FROM locations INTO @ClientLocationId, @LastValveDate, @LastGreasingDate, @LastWellSafetyDate
END     

CLOSE locations
DEALLOCATE locations

SELECT * FROM ClientLocationServiceSchedules
ORDER BY ClientLocationId, JobTypeId


