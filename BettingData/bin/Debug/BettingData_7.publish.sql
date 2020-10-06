﻿/*
Deployment script for HollywoodTest

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HollywoodTest"
:setvar DefaultFilePrefix "HollywoodTest"
:setvar DefaultDataPath "C:\Users\Sifiso Sikhakhane\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\"
:setvar DefaultLogPath "C:\Users\Sifiso Sikhakhane\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Event]...';


GO
CREATE TABLE [dbo].[Event] (
    [EventID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [TournamentID]     BIGINT         NOT NULL,
    [EventName]        NVARCHAR (100) NOT NULL,
    [EventNumber]      SMALLINT       NULL,
    [EventDateTime]    DATETIME2 (7)  NULL,
    [EventEndDateTime] DATETIME2 (7)  NULL,
    [AutoClose]        BIT            NULL,
    PRIMARY KEY CLUSTERED ([EventID] ASC)
);


GO
PRINT N'Creating [dbo].[EventDetail]...';


GO
CREATE TABLE [dbo].[EventDetail] (
    [EventDetailID]       INT             IDENTITY (1, 1) NOT NULL,
    [EventID]             BIGINT          NOT NULL,
    [EventDetailStatusID] INT             NOT NULL,
    [EventDetailName]     NVARCHAR (50)   NOT NULL,
    [EventDetailNumber]   SMALLINT        NULL,
    [EventDetailOdd]      DECIMAL (18, 7) NULL,
    [FinishingPosition]   SMALLINT        NULL,
    [FirstTimer]          BIT             NULL,
    PRIMARY KEY CLUSTERED ([EventDetailID] ASC)
);


GO
PRINT N'Creating [dbo].[EventDetailStatus]...';


GO
CREATE TABLE [dbo].[EventDetailStatus] (
    [EventDetailStatusID]    INT           IDENTITY (1, 1) NOT NULL,
    [EventDetailsStatusName] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([EventDetailStatusID] ASC)
);


GO
PRINT N'Creating [dbo].[Tournament]...';


GO
CREATE TABLE [dbo].[Tournament] (
    [TournamentID]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [TournamentName] NVARCHAR (200) NOT NULL,
    PRIMARY KEY CLUSTERED ([TournamentID] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Event_TournamentID]...';


GO
ALTER TABLE [dbo].[Event]
    ADD CONSTRAINT [FK_Event_TournamentID] FOREIGN KEY ([TournamentID]) REFERENCES [dbo].[Tournament] ([TournamentID]);


GO
PRINT N'Creating [dbo].[FK_EventDetail_Event]...';


GO
ALTER TABLE [dbo].[EventDetail]
    ADD CONSTRAINT [FK_EventDetail_Event] FOREIGN KEY ([EventID]) REFERENCES [dbo].[Event] ([EventID]);


GO
PRINT N'Creating [dbo].[FK_EventDetail_EventDetailStatus]...';


GO
ALTER TABLE [dbo].[EventDetail]
    ADD CONSTRAINT [FK_EventDetail_EventDetailStatus] FOREIGN KEY ([EventDetailStatusID]) REFERENCES [dbo].[EventDetailStatus] ([EventDetailStatusID]);


GO
PRINT N'Creating [dbo].[pr_AddEvent]...';


GO
CREATE PROCEDURE [dbo].[pr_AddEvent]
	@Id INT OUT,
	@TournamentID BIGINT, 
    @EventName NVARCHAR(100), 
    @EventNumber SMALLINT, 
    @EventDateTime DATETIME2, 
    @EventEndDateTime DATETIME2, 
    @AutoClose BIT
AS
BEGIN
	INSERT INTO dbo.[Event](TournamentID, EventName, EventNumber, EventDateTime, EventEndDateTime, AutoClose)
	VALUES(@TournamentID, @EventName, @EventNumber, @EventDateTime, @EventEndDateTime, @AutoClose);

	SET @Id = (SELECT SCOPE_IDENTITY());
END
GO
PRINT N'Creating [dbo].[pr_AddEventDetail]...';


GO
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
GO
PRINT N'Creating [dbo].[pr_AddTournament]...';


GO
CREATE PROCEDURE [dbo].[pr_AddTournament]
	@Id INT OUT,
	@TournamentName NVARCHAR(200)
AS
BEGIN
	INSERT INTO dbo.Tournament(TournamentName)
	VALUES(@TournamentName);

	SET @Id = (SELECT SCOPE_IDENTITY());
END
GO
PRINT N'Creating [dbo].[pr_DeleteEvent]...';


GO
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
GO
PRINT N'Creating [dbo].[pr_DeleteEventDetail]...';


GO
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
GO
PRINT N'Creating [dbo].[pr_DeleteTournament]...';


GO
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
GO
PRINT N'Creating [dbo].[pr_UpdateEvent]...';


GO
CREATE PROCEDURE [dbo].[pr_UpdateEvent]
	@IsUpdated BIT OUT,
	@EventID BIGINT,
	@TournamentID BIGINT, 
    @EventName NVARCHAR(100), 
    @EventNumber SMALLINT, 
    @EventDateTime DATETIME2, 
    @EventEndDateTime DATETIME2, 
    @AutoClose BIT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT TOP 1 EventID FROM [dbo].[Event] WHERE EventID = @EventID AND TournamentID = @TournamentID)
		BEGIN
			UPDATE [dbo].[Event]
			SET EventName = @EventName, 
				EventNumber = @EventNumber, 
				EventDateTime = @EventDateTime, 
				EventEndDateTime = @EventEndDateTime,
				AutoClose = @AutoClose
			WHERE EventID = @EventID 
			AND TournamentID = @TournamentID
			SET @IsUpdated = 'True'
		END
	ELSE
		BEGIN
			SET @IsUpdated = 'False'
		END
END
GO
PRINT N'Creating [dbo].[pr_UpdateEventDetails]...';


GO
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
GO
PRINT N'Creating [dbo].[pr_UpdateTournament]...';


GO
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
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1bb43b2b-3ce1-4abf-b5c2-193216306bfa')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1bb43b2b-3ce1-4abf-b5c2-193216306bfa')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2fb76fdb-e01b-46b1-aaf3-e4d948d9a6ad')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2fb76fdb-e01b-46b1-aaf3-e4d948d9a6ad')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4e0c328a-dfa8-4e01-a2b7-e14092c01ae6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4e0c328a-dfa8-4e01-a2b7-e14092c01ae6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '20ade856-ca01-4560-b913-a86a47b60558')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('20ade856-ca01-4560-b913-a86a47b60558')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
CREATE TABLE #eventDetailStatus (EventDetailsStatusName NVARCHAR(50))
INSERT INTO #eventDetailStatus
VALUES ('Active'),
	   ('Scratched'),
	   ('Closed')
--Insert into physical table
INSERT INTO [dbo].[EventDetailStatus] (EventDetailsStatusName)
SELECT [EventDetailsStatusName] FROM #eventDetailStatus
WHERE [EventDetailsStatusName] NOT IN (SELECT [EventDetailsStatusName] FROM [dbo].[EventDetailStatus] WITH (NOLOCK))
DROP TABLE #eventDetailStatus

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
