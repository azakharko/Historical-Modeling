CREATE TABLE [dbo].[OrderLine] (
    [OrderLineId] INT             NOT NULL,
    [OrderId]     INT             NOT NULL,
    [ProductId]   INT             NOT NULL,
    [UnitPrice]   DECIMAL (18, 2) NOT NULL,
    [Quantity]    INT             NOT NULL,
    CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED ([OrderLineId] ASC),
    CONSTRAINT [FK_OrderLine_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([OrderId])
);

