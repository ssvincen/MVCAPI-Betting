CREATE PROCEDURE [dbo].[pr_UpdateTournament]
	@IsUpdated BIT OUT,
	@TournamentID BIGINT,
	@TournamentName NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 TournamentID FROM [dbo].[Tournament] WHERE TournamentID = @TournamentID )
		BEGIN
			UPDATE [dbo].[Tournament]
			SET TournamentName = @TournamentName
			WHERE TournamentID = @TournamentID
			SET @IsUpdated = 'True'
		END
	ELSE
		BEGIN
			SET @IsUpdated = 'False'
		END
END
