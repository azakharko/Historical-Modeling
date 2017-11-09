CREATE TABLE [dbo].[CustomerAddress] (
    [CustomerAddressId] INT           NOT NULL,
    [CustomerId]        INT           NOT NULL,
    [Address1]          NVARCHAR (50) NOT NULL,
    [Address2]          NVARCHAR (50) NULL,
    [City]              NVARCHAR (50) NOT NULL,
    [State]             NCHAR (2)     NULL,
    [ZipCode]           NCHAR (10)    NOT NULL,
    [Country]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED ([CustomerAddressId] ASC),
    CONSTRAINT [FK_CustomerAddress_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])
);

