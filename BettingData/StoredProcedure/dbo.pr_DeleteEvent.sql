CREATE PROCEDURE [dbo].[pr_DeleteEvent]
	@IsDeleted BIT OUT,
	@EventID BIGINT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 EventID FROM [dbo].[Event] WHERE EventID = @EventID)
		BEGIN
			DELETE 
			FROM [dbo].[Event]
			WHERE EventID = @EventID
			SET @IsDeleted = 1
		END
	ELSE
		BEGIN
			SET @IsDeleted = 0
		END
END