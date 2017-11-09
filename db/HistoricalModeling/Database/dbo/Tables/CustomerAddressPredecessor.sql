CREATE TABLE [dbo].[CustomerAddressPredecessor] (
    [CustomerAddressId]      INT NOT NULL,
    [PriorCustomerAddressId] INT NOT NULL,
    CONSTRAINT [FK_CustomerAddressPredecessor_CustomerAddress] FOREIGN KEY ([CustomerAddressId]) REFERENCES [dbo].[CustomerAddress] ([CustomerAddressId]),
    CONSTRAINT [FK_CustomerAddressPredecessor_CustomerAddress1] FOREIGN KEY ([PriorCustomerAddressId]) REFERENCES [dbo].[CustomerAddress] ([CustomerAddressId])
);

