CREATE TABLE [dbo].[EventDetail]
(
	[EventDetailID] INT PRIMARY KEY IDENTITY NOT NULL, 
	[EventID] BIGINT NOT NULL, 
    [EventDetailStatusID] INT NOT NULL, 
    [EventDetailName] NVARCHAR(50) NOT NULL, 
    [EventDetailNumber] SMALLINT NULL, 
    [EventDetailOdd] DECIMAL(18, 7) NULL, 
    [FinishingPosition] SMALLINT NULL, 
    [FirstTimer] BIT NULL, 
    CONSTRAINT [FK_EventDetail_Event] FOREIGN KEY (EventID) REFERENCES [Event]([EventID]),
    CONSTRAINT [FK_EventDetail_EventDetailStatus] FOREIGN KEY (EventDetailStatusID) REFERENCES[EventDetailStatus]([EventDetailStatusID])
)
