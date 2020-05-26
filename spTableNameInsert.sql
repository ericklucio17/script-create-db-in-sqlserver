-- ====================================================== --
-- Author:		Erick Adrián Lucio Villegas               --
-- Create date: 25/05/2020                                --
-- Description:	Script "spTableNameInsert"                --
-- ====================================================== --

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
    @Param1 /*parameter name*/ int /*datatype_for_param1*/ = 0, /*default_value_for_param1*/
    @Param2 /*parameter name*/ int /*datatype_for_param1*/ = 0, /*default_value_for_param2*/
    @Param3 /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param2*/
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    -- Insert rows into table 'TableName'
    INSERT INTO TableName
    ( -- columns to insert data into
     [Column1], [Column2], [Column3]
    )
    VALUES
    ( -- first row: values for the columns in the list above
     @Param1, @Param2, @Param3
    );
GO

-- example to execute the stored procedure we just created
EXECUTE SchemaName.StoredProcedureName 1 /*value_for_param1*/, 2 /*value_for_param2*/, 3 /*value_for_param3*/
GO

-- Method 2
CREATE PROCEDURE SchemaName.StoredProcedureName (
    @Param1 INT = 0,
    @Param2 INT = 0,
    @Param3 INT = 0
)
AS 
BEGIN 
    INSERT INTO TableName (Column1, Column2, Column3)
    VALUES (@Param1, @Param2, @Param3);
END 
GO

-- Example to execute the stored procedure we just created
EXEC SchemaName.StoredProcedureName 1, 2, 3
GO