CREATE TABLE [dbo].[InvoiceCustomer] (
    [InvoiceId]  INT NOT NULL,
    [CustomerId] INT NOT NULL,
    CONSTRAINT [FK_InvoiceCustomer_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId]),
    CONSTRAINT [FK_InvoiceCustomer_Invoice] FOREIGN KEY ([InvoiceId]) REFERENCES [dbo].[Invoice] ([InvoiceId])
);

