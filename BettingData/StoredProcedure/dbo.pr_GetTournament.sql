CREATE PROCEDURE [dbo].[pr_GetTournament]

AS
BEGIN
	SET NOCOUNT ON;
	SELECT TournamentID,
		   TournamentName
	FROM dbo.Tournament
END
