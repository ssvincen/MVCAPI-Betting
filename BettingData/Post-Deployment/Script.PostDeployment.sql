/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
CREATE TABLE #eventDetailStatus (EventDetailsStatusName NVARCHAR(50))
INSERT INTO #eventDetailStatus
VALUES ('Active'),
	   ('Scratched'),
	   ('Closed')
--Insert into physical table
INSERT INTO [dbo].[EventDetailStatus] (EventDetailsStatusName)
SELECT [EventDetailsStatusName] FROM #eventDetailStatus
WHERE [EventDetailsStatusName] NOT IN (SELECT [EventDetailsStatusName] FROM [dbo].[EventDetailStatus] WITH (NOLOCK))
DROP TABLE #eventDetailStatus

