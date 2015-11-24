CREATE TABLE #RESULT ([PK COLUMN] NVARCHAR(MAX), [COLUMN VALUE] NVARCHAR(MAX), [COLUMN Name] sysname, [TABLE SCHEMA] sysname, [TABLE Name] sysname)
DECLARE @Table_Name sysname, @SearchString NVARCHAR(MAX), @Table_Schema sysname
SET @SearchString = N'-79228162514264337593543950335'

DECLARE curAllTables CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
    FOR
    SELECT   Table_Schema, Table_Name
    FROM     INFORMATION_SCHEMA.Tables    
    WHERE TABLE_TYPE = 'BASE TABLE'
    ORDER BY Table_Schema, Table_Name
    
    OPEN curAllTables
    FETCH  curAllTables
    INTO @Table_Schema, @Table_Name    
	WHILE (@@FETCH_STATUS = 0) -- Loop through all tables in the database
      BEGIN
		INSERT #RESULT 
		EXECUTE spSearchStringInTable @SearchString, @Table_Schema, @Table_Name
    
        FETCH  curAllTables
        INTO @Table_Schema, @Table_Name
      END -- while
    CLOSE curAllTables
    DEALLOCATE curAllTables
  -- Return results 
  SELECT * FROM #RESULT ORDER BY [Table Name] 
  DROP TABLE #RESULT