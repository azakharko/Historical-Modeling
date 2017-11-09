/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE [HistoricalModelingDB]
GO
--------------------------------------------------------------------------------------
INSERT INTO [dbo].[Customer]
           ([CustomerId]
           ,[CustomerGuid])
     VALUES
           (1
           ,'14616B28-4F9B-4C8E-AF6C-4E4B62C8797B')
GO

--------------------------------------------------------------------------------------
INSERT INTO [dbo].[CustomerName]
           ([CustomerNameId]
           ,[CustomerId]
           ,[FirstName]
           ,[LastName])
     VALUES
           (1
           ,1
           ,'Andriy'
           ,'Zakharko')
GO

INSERT INTO [dbo].[CustomerName]
           ([CustomerNameId]
           ,[CustomerId]
           ,[FirstName]
           ,[LastName])
     VALUES
           (2
           ,1
           ,'Igor'
           ,'Tretyak')
GO

INSERT INTO [dbo].[CustomerName]
           ([CustomerNameId]
           ,[CustomerId]
           ,[FirstName]
           ,[LastName])
     VALUES
           (3
           ,1
           ,'Ihor'
           ,'Tretyak')
GO

--------------------------------------------------------------------------------------
INSERT INTO [dbo].[CustomerNamePredecessor]
           ([CustomerNameId]
           ,[PriorCustomerNameId]
           ,[DateModified])
     VALUES
           (1
           ,null
           ,'2017-11-05 00:00:00.0000000')
GO

INSERT INTO [dbo].[CustomerNamePredecessor]
           ([CustomerNameId]
           ,[PriorCustomerNameId]
           ,[DateModified])
     VALUES
           (2
           ,1
           ,'2017-11-06 01:01:00.0000000')
GO

INSERT INTO [dbo].[CustomerNamePredecessor]
           ([CustomerNameId]
           ,[PriorCustomerNameId]
           ,[DateModified])
     VALUES
           (3
           ,1
           ,'2017-11-06 01:02:00.0000000')
GO