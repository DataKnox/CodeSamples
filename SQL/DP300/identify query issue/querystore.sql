USE NugDB
GO

ALTER DATABASE NugDB
SET QUERY_STORE = ON

ALTER DATABASE NugDB
	SET QUERY_STORE (
		OPERATION_MODE = READ_WRITE,
		CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 15),
		DATA_FLUSH_INTERVAL_SECONDS = 1500,
		MAX_STORAGE_SIZE_MB = 250,
		INTERVAL_LENGTH_MINUTES = 10,
		SIZE_BASED_CLEANUP_MODE = AUTO,
		QUERY_CAPTURE_MODE = AUTO,
		MAX_PLANS_PER_QUERY = 200);

SELECT * FROM sys.database_query_store_options

ALTER DATABASE NugDB
SET QUERY_STORE CLEAR ALL;


use WideWorldImporters
GO

CREATE PROCEDURE GetSalesByCustomer(
@CustomerId INT
)
AS 
    Select Customerid, SalespersonPersonId, BackorderOrderId, OrderDate
    FROM Sales.Orders
    WHERE CustomerId = @CustomerId
    Group By CustomerID
GO

EXEC GetSalesByCustomer 205;
GO 10

CREATE NONCLUSTERED INDEX NCIX_CustomerSales
ON sales.Orders(CustomerId,SalespersonPersonID,BackorderOrderId,OrderDate)