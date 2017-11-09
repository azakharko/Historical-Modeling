CREATE TABLE [dbo].[CustomerNamePredecessor] (
    [CustomerNameId]      INT           NOT NULL,
    [PriorCustomerNameId] INT           NULL,
    [DateModified]        DATETIME2 (7) NULL,
    CONSTRAINT [FK_CustomerAddressPredecessor_CustomerName] FOREIGN KEY ([CustomerNameId]) REFERENCES [dbo].[CustomerName] ([CustomerNameId]),
    CONSTRAINT [FK_CustomerAddressPredecessor_CustomerName1] FOREIGN KEY ([PriorCustomerNameId]) REFERENCES [dbo].[CustomerName] ([CustomerNameId]),
    CONSTRAINT [IX_CustomerAddressPredecessor] UNIQUE NONCLUSTERED ([CustomerNameId] ASC, [PriorCustomerNameId] ASC)
);

