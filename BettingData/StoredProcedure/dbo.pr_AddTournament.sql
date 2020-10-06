CREATE PROCEDURE [dbo].[pr_AddTournament]
	@Id INT OUT,
	@TournamentName NVARCHAR(200)
AS
BEGIN
	INSERT INTO dbo.Tournament(TournamentName)
	VALUES(@TournamentName);

	SET @Id = (SELECT SCOPE_IDENTITY());
END
