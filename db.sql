-- ====================================================== --
-- Author:		Erick Adrián Lucio Villegas               --
-- Create date: 25/05/2020                                --
-- Description:	Script "example db"                       --
-- ====================================================== --

/*
Project description:
-----------------------------
1. Change language mode to SQL: Open a .sql file or press Ctrl+K M (Cmd+K M on Mac) and choose 'SQL'.
2. Connect to a database: Press F1 to show the command palette, type 'sqlcon' or 'sql' then click 'Connect'.
3. Use the T-SQL editor: Type T-SQL statements in the editor using T-SQL IntelliSense or type 'sql' to see a list of code snippets you can tweak & reuse.
4. Run T-SQL statements: Press F1 and type 'sqlex' or press Ctrl+Shift+e (Cmd+Shift+e on Mac) to execute all the T-SQL code in the editor.

Tip #1: Put GO on a line by itself to separate T-SQL batches.
Tip #2: Select some T-SQL text in the editor anlection
*/

-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE [master];
GO

-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'DatabaseName'
)
CREATE DATABASE DatabaseName;
GO

USE DatabaseName;
GO

CREATE SCHEMA SchemaName;
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.TableName', 'U') IS NOT NULL
	DROP TABLE SchemaName.TableName;
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.TableName (
	Id         INT IDENTITY (1,1) NOT NULL, 
	Column1    VARCHAR      (100)     NULL,
	Column2    VARCHAR      (100)     NULL,
	Column3    VARCHAR      (100)     NULL,
	Column4    VARCHAR      (100)     NULL,
	CreateUser INT                    NULL,
	CreateDate DATETIME               NULL,
	EditUser   INT                    NULL,
	EditDate   DATETIME               NULL,
	DeleteUser INT                    NULL,
	DeleteDate DATETIME               NULL,
	Active     BIT                NOT NULL,
	-- specify more columns here
	CONSTRAINT PK_TableName PRIMARY KEY (Id)
);
GO

IF OBJECT_ID('SchemaName.TableName', 'U') IS NOT NULL
	DROP TABLE SchemaName.TableName;
GO

CREATE TABLE SchemaName.TableName (
	Id          INT IDENTITY (1,1) NOT NULL,
	IdTableName INT                NOT NULL,
	Column1     VARCHAR      (100)     NULL,
	Column2     VARCHAR      (100)     NULL,
	Column3     VARCHAR      (100)     NULL,
	Column4     VARCHAR      (100)     NULL,
	CreateUser  INT                    NULL,
	CreateDate  DATETIME               NULL,
	EditUser    INT                    NULL,
	EditDate    DATETIME               NULL,
	DeleteUser  INT                    NULL,
	DeleteDate  DATETIME               NULL,
	Active      BIT                NOT NULL,
	CONSTRAINT  PK_TableName             PRIMARY KEY (Id),
	CONSTRAINT  FK_TableName_IdTableName FOREIGN KEY (IdTableName) REFERENCES SchemaName.TableName (Id)
);
GO
