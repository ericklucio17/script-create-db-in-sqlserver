-- ====================================================== --
-- Author:		Erick Adrián Lucio Villegas               --
-- Create date: 27/05/2020                                --
-- Description:	Script "spTableNameCrud"                  --
-- ====================================================== --

USE DatabaseName;
GO

-- Create a new stored procedure called 'StoredProcedureName' in schema 'SchemaName'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'SchemaName'
    AND SPECIFIC_NAME = N'StoredProcedureName'
)
DROP PROCEDURE SchemaName.StoredProcedureName
GO

-- Method 1
-- Create the stored procedure in the specified schema
CREATE PROCEDURE SchemaName.StoredProcedureName
	@Option /*parameter name*/ INT /*datatype_for_option*/ = 0, /*default_value_for_option*/  
	@Id /*parameter name*/ INT /*datatype_for_id*/ = 0, /*default_value_for_id*/  
    @Param1 /*parameter name*/ INT /*datatype_for_param1*/ = 0, /*default_value_for_param1*/
    @Param2 /*parameter name*/ INT /*datatype_for_param2*/ = 0, /*default_value_for_param2*/
    @Param3 /*parameter name*/ INT /*datatype_for_param3*/ = 0 /*default_value_for_param3*/
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
	-- Create
    IF @Option = 1
	BEGIN
		-- Insert rows into table 'TableName' in schema 'SchemaName'
		INSERT INTO SchemaName.TableName
		( -- columns to insert data into
			Column1, Column2, Column3
		)
		VALUES
		( -- first row: values for the columns in the list above
			@Param1, @Param2, @Param3
		);
	END
	-- Read
	ELSE IF @Option = 2
	BEGIN
		-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
		SELECT Id,
			   Column1,
               Column2,
               Column3
		FROM SchemaName.TableOrViewName
		WHERE Active = 1 /* add search conditions here */
	END
	-- Update
	ELSE IF @Option = 3
	BEGIN
		-- Update rows in table 'TableName' in schema 'SchemaName'
		UPDATE SchemaName.TableName
		SET Colum1 = @Param1,
			Colum2 = @Param2,
			Colum2 = @Param3
			-- add more columns and values here
		WHERE Active = 1 AND 
		      Id = @Id /* add search conditions here */
	END
	-- Delete
	ELSE IF @Option = 4
	BEGIN
		-- Update rows in table 'TableName' in schema 'SchemaName'
		UPDATE SchemaName.TableName
		SET Active = 0
			-- add more columns and values here
		WHERE Id = @Id /* add search conditions here */
	END
GO

-- example to execute the stored procedure we just created
EXECUTE SchemaName.StoredProcedureName 1 /*value_for_option*/, 2 /*value_for_id*/, 3 /*value_for_param1*/, 4 /*value_for_param2*/, 5 /*value_for_param3*/
GO

-- Method 2
CREATE PROCEDURE SchemaName.StoredProcedureName (
	@Option INT = NULL,   
	@Id     INT = NULL,   
    @Param1 INT = NULL, 
    @Param2 INT = NULL,  
    @Param3 INT = NULL
)
AS 
BEGIN 
	-- Create
    IF @Option = 1
	BEGIN
		INSERT INTO SchemaName.TableName (Column1, Column2, Column3)
		VALUES (@Param1, @Param2, @Param3);
	END
	-- Read
	ELSE IF @Option = 2
	BEGIN
		SELECT Id,
			   Column1,
               Column2,
               Column3
		FROM SchemaName.TableOrViewName
		WHERE Active = 1 
	END
	-- Update
	ELSE IF @Option = 3
	BEGIN
		UPDATE SchemaName.TableName
		SET Colum1 = @Param1,
			Colum2 = @Param2,
			Colum2 = @Param3
		WHERE Active = 1 AND 
		      Id = @Id 
	END
	-- Delete
	ELSE IF @Option = 4
	BEGIN
		UPDATE SchemaName.TableName
		SET Active = 0
		WHERE Id = @Id 
	END
END
GO

-- Example to execute the stored procedure we just created
EXEC SchemaName.StoredProcedureName 1, 2, 3, 4, 5
GO









