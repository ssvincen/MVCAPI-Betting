CREATE PROCEDURE [dbo].[pr_GetEvent]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [EventID] , 
           [TournamentID] , 
           [EventName] , 
           [EventNumber] , 
           [EventDateTime] , 
           [EventEndDateTime] , 
           [AutoClose]
	FROM dbo.[Event]
END