CREATE TABLE [dbo].[Invoice] (
    [InvoiceId]     INT        NOT NULL,
    [InvoiceNumber] NCHAR (10) NOT NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([InvoiceId] ASC),
    CONSTRAINT [IX_Invoice] UNIQUE NONCLUSTERED ([InvoiceId] ASC)
);

