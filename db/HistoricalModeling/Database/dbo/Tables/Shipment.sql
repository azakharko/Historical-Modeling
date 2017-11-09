CREATE TABLE [dbo].[Shipment] (
    [ShipmentId]     INT           NOT NULL,
    [OrderId]        INT           NOT NULL,
    [PaymentId]      INT           NOT NULL,
    [AddressId]      INT           NOT NULL,
    [TrackingNumber] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED ([ShipmentId] ASC),
    CONSTRAINT [FK_Shipment_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([OrderId]),
    CONSTRAINT [FK_Shipment_Payment] FOREIGN KEY ([PaymentId]) REFERENCES [dbo].[Payment] ([PaymentId])
);

