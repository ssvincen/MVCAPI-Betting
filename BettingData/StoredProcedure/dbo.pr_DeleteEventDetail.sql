CREATE PROCEDURE [dbo].[pr_DeleteEventDetail]
	@IsDeleted BIT OUT,
	@EventDetailID INT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 EventDetailID FROM [dbo].[EventDetail] WHERE EventDetailID = @EventDetailID)
		BEGIN
			DELETE 
			FROM [dbo].[EventDetail]
			WHERE EventDetailID = @EventDetailID
			SET @IsDeleted = 1
		END
	ELSE
		BEGIN
			SET @IsDeleted = 0
		END
END