CREATE PROCEDURE [dbo].[pr_AddEventDetail]
	@Id INT OUT, 
	@EventID BIGINT, 
    @EventDetailStatusID INT, 
    @EventDetailName NVARCHAR(50), 
    @EventDetailNumber SMALLINT, 
    @EventDetailOdd DECIMAL(18, 7), 
    @FinishingPosition SMALLINT, 
    @FirstTimer BIT
AS
BEGIN
	INSERT INTO dbo.EventDetail(EventID, EventDetailStatusID, EventDetailName, EventDetailNumber, EventDetailOdd, FinishingPosition, FirstTimer)
	VALUES(@EventID, @EventDetailStatusID, @EventDetailName, @EventDetailNumber, @EventDetailOdd, @FinishingPosition, @FirstTimer);

	SET @Id = (SELECT SCOPE_IDENTITY());
END
