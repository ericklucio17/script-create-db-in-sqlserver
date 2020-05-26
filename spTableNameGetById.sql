-- ====================================================== --
-- Author:		Erick Adrián Lucio Villegas               --
-- Create date: 25/05/2020                                --
-- Description:	Script "spTableNameGetById"               --
-- ====================================================== --

-- Create a new stored procedure called 'StoredProcedureName' in schema 'SchemaName'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'SchemaName'
    AND SPECIFIC_NAME = N'StoredProcedureName'
)
DROP PROCEDURE SchemaName.StoredProcedureName;
GO

-- Method 1
-- Create the stored procedure in the specified schema
CREATE PROCEDURE SchemaName.StoredProcedureName
    @param1 /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param1*/
AS
    -- body of the stored procedure
    -- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
    SELECT Column1,
           Column2,
           Column3,
           Column4
    FROM SchemaName.TableOrViewName
    WHERE Active = 1 AND Id = @param1 /* add search conditions here */
GO

-- example to execute the stored procedure we just created
EXECUTE SchemaName.StoredProcedureName 1 /*value_for_param1*/
GO

-- Method 2
CREATE PROCEDURE SchemaName.StoredProcedureName (
    @Id INT = 0
)
AS 
BEGIN 
    SELECT Column1,
           Column2,
           Column3,
           Column4
    FROM SchemaName.TableOrViewName
    WHERE Active = 1 AND Id = @Id
END 
GO

-- Example to execute the stored procedure we just created
EXEC SchemaName.StoredProcedureName 1
GO




