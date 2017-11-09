CREATE TABLE [dbo].[Payment] (
    [PaymentId]       INT             NOT NULL,
    [OrderId]         INT             NOT NULL,
    [PaymentMethodId] INT             NOT NULL,
    [Amount]          DECIMAL (18, 2) NOT NULL,
    [DatePaid]        DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([PaymentId] ASC),
    CONSTRAINT [FK_Payment_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([OrderId])
);

