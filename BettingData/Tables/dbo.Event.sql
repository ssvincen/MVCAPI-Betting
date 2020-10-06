CREATE TABLE [dbo].[Event]
(
	[EventID] BIGINT PRIMARY KEY IDENTITY NOT NULL, 
    [TournamentID] BIGINT NOT NULL, 
    [EventName] NVARCHAR(100) NOT NULL, 
    [EventNumber] SMALLINT NULL, 
    [EventDateTime] DATETIME2 NULL, 
    [EventEndDateTime] DATETIME2 NULL, 
    [AutoClose] BIT NULL, 
    CONSTRAINT [FK_Event_TournamentID] FOREIGN KEY (TournamentID) REFERENCES [Tournament](TournamentID)   

)
