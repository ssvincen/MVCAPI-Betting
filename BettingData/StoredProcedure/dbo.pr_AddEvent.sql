CREATE PROCEDURE [dbo].[pr_AddEvent]
	@Id INT OUT,
	@TournamentID BIGINT, 
    @EventName NVARCHAR(100), 
    @EventNumber SMALLINT, 
    @EventDateTime DATETIME2, 
    @EventEndDateTime DATETIME2, 
    @AutoClose BIT
AS
BEGIN
	INSERT INTO dbo.[Event](TournamentID, EventName, EventNumber, EventDateTime, EventEndDateTime, AutoClose)
	VALUES(@TournamentID, @EventName, @EventNumber, @EventDateTime, @EventEndDateTime, @AutoClose);

	SET @Id = (SELECT SCOPE_IDENTITY());
END
