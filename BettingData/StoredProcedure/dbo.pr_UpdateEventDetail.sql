CREATE PROCEDURE [dbo].[pr_UpdateEventDetails]
	@IsUpdated BIT OUT,
	@EventDetailID INT,
	@EventID BIGINT, 
    @EventDetailStatusID INT, 
    @EventDetailName NVARCHAR(50), 
    @EventDetailNumber SMALLINT, 
    @EventDetailOdd DECIMAL(18, 7), 
    @FinishingPosition SMALLINT, 
    @FirstTimer BIT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 EventDetailID FROM [dbo].[EventDetail] WHERE EventDetailID = @EventDetailID)
		BEGIN
			UPDATE [dbo].[EventDetail]
			SET EventID = @EventID, 
				EventDetailStatusID = @EventDetailStatusID, 
				EventDetailName = @EventDetailName, 
				EventDetailNumber = @EventDetailNumber,
				EventDetailOdd = @EventDetailOdd,
				FinishingPosition = @FinishingPosition,
				FirstTimer = @FirstTimer
			WHERE EventDetailID = @EventDetailID 
			SET @IsUpdated = 1
		END
	ELSE
		BEGIN
			SET @IsUpdated = 0
		END
END
