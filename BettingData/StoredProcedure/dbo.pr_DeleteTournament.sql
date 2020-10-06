CREATE PROCEDURE [dbo].[pr_DeleteTournament]
	@IsDeleted BIT OUT,
	@TournamentID BIGINT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 TournamentID FROM [dbo].[Tournament] WHERE TournamentID = @TournamentID)
		BEGIN
			DELETE 
			FROM [dbo].[Tournament]
			WHERE TournamentID = @TournamentID
			SET @IsDeleted = 1
		END
	ELSE
		BEGIN
			SET @IsDeleted = 0
		END
END