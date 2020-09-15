IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200915225618_InitialCreate')
BEGIN
    CREATE TABLE [Shows] (
        [Id] int NOT NULL IDENTITY,
        [Title] nvarchar(max) NULL,
        CONSTRAINT [PK_Shows] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200915225618_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Title') AND [object_id] = OBJECT_ID(N'[Shows]'))
        SET IDENTITY_INSERT [Shows] ON;
    EXEC(CONCAT(N'INSERT INTO [Shows] ([Id], [Title])', CHAR(13), CHAR(10), N'VALUES (1Game of Thrones'')'));
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Title') AND [object_id] = OBJECT_ID(N'[Shows]'))
        SET IDENTITY_INSERT [Shows] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200915225618_InitialCreate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200915225618_InitialCreate', N'5.0.0-rc.1.20451.13');
END;
GO

COMMIT;
GO

