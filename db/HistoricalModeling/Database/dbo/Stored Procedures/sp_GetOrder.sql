
CREATE PROCEDURE [dbo].[sp_GetOrder]
	-- Add the parameters for the stored procedure here
	@CustomerId int,
	@OrderId int
	
AS
BEGIN

	DECLARE @Status int;	

	-- if order has a only Order record - this should be 'placed' status
	SET @Status = 0;

	-- if order has a Order and Shipped records - this should be in 'shipped' status
	IF EXISTS (SELECT TOP 1 1 
				FROM dbo.[Shipment] 
				INNER JOIN dbo.[Order] 
					ON [Shipment].[OrderId] = [Order].[OrderId] AND [Order].[OrderId] = @OrderId)
	BEGIN
		SET @Status = 1;
		GOTO Proceed;
	END
	-- if order has a Order, Shipped and Payed records - this should be in 'payed' status
	IF EXISTS (SELECT TOP 1 1 
				FROM dbo.[Payment] 
				INNER JOIN dbo.[Order] 
					ON [Payment].[OrderId] = [Order].[OrderId] AND [Order].[OrderId] = @OrderId
				INNER JOIN dbo.[Shipment] 
					ON [Shipment].[OrderId] = [Order].[OrderId] AND [Order].[OrderId] = @OrderId)
	BEGIN
		SET @Status = 2;
		GOTO Proceed;
	END

	-- if order has a Order, Payed but not Shipped records - this should be in 'payed, but not shipped' status
	IF EXISTS (SELECT TOP 1 1 
				FROM dbo.[Payment] 
				INNER JOIN dbo.[Order] 
					ON [Payment].[OrderId] = [Order].[OrderId] AND [Order].[OrderId] = @OrderId
				LEFT JOIN dbo.[Shipment] 
					ON [Shipment].[OrderId] = [Order].[OrderId] AND [Order].[OrderId] = @OrderId)
	BEGIN
		SET @Status = 3;
		GOTO Proceed;
	END

	Proceed:
	SELECT 
		o.OrderId,
		o.DatePlaced,
		'Status' = CASE @Status			
			WHEN 1 THEN 'Shipped'
			WHEN 2 THEN 'Payed'
			WHEN 3 THEN 'Payed, but not shipped'
			ELSE 'Placed'
		END
	FROM dbo.[Order] o 
	WHERE 1=1
		AND o.CustomerId = @CustomerId
		AND o.[OrderId] = @OrderId
END
