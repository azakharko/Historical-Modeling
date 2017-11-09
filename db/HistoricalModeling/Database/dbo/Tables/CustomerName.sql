CREATE TABLE [dbo].[CustomerName] (
    [CustomerNameId] INT           NOT NULL,
    [CustomerId]     INT           NOT NULL,
    [FirstName]      NVARCHAR (50) NOT NULL,
    [LastName]       NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_CustomerName] PRIMARY KEY CLUSTERED ([CustomerNameId] ASC),
    CONSTRAINT [FK_CustomerName_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])
);

