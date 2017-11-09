CREATE TABLE [dbo].[Order] (
    [OrderId]    INT              NOT NULL,
    [OrderGuid]  UNIQUEIDENTIFIER NOT NULL,
    [CustomerId] INT              NOT NULL,
    [DatePlaced] DATETIME2 (7)    NOT NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([OrderId] ASC),
    CONSTRAINT [IX_Order] UNIQUE NONCLUSTERED ([OrderId] ASC)
);

