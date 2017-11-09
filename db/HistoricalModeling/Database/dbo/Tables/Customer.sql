CREATE TABLE [dbo].[Customer] (
    [CustomerId]   INT              NOT NULL,
    [CustomerGuid] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

