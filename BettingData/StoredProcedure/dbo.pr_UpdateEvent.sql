CREATE PROCEDURE [dbo].[pr_UpdateEvent]
	@IsUpdated BIT OUT,
	@EventID BIGINT,
	@TournamentID BIGINT, 
    @EventName NVARCHAR(100), 
    @EventNumber SMALLINT, 
    @EventDateTime DATETIME2, 
    @EventEndDateTime DATETIME2, 
    @AutoClose BIT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 EventID FROM [dbo].[Event] WHERE EventID = @EventID AND TournamentID = @TournamentID)
		BEGIN
			UPDATE [dbo].[Event]
			SET EventName = @EventName, 
				EventNumber = @EventNumber, 
				EventDateTime = @EventDateTime, 
				EventEndDateTime = @EventEndDateTime,
				AutoClose = @AutoClose
			WHERE EventID = @EventID 
			AND TournamentID = @TournamentID
			SET @IsUpdated = 'True'
		END
	ELSE
		BEGIN
			SET @IsUpdated = 'False'
		END
END
