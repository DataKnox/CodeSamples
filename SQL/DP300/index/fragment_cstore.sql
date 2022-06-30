SELECT *
FROM dm.sys_db_column_store_row_group_physical_stats;

SELECT *
FROM dm.sys_db_column_store_row_group_operational_stats;

DECLARE @cnt INT;
DECLARE @OrderId INT;
DECLARE @ItemID INT;
DECLARE @OrderDesc NVARCHAR(100);
DECLARE @PackageTypeID INT;
DECLARE @Quantity INT;

SELECT @cnt = 0;
WHILE (@cnt<10000)
    BEGIN
        SET @OrderID = CAST(RAND()*70000 AS INT)+1;
        SET @ItemID = CAST(RAND() * 225 AS INT)+1;
        SET @OrderDesc = 'Desc: '+ CONVERT(NVARCHAR(255),@OrderID);
        SET @PackageTypeID = CAST(RAND()*5 AS INT)+1;
        SET @Quantity = CAST(RAND()*50 AS INT)+1;

        INSERT INTO Sales.OrderLines WITH (TABLOCK) (OrderId,StockItemID,Description,PackageTypeID,Quantity,TaxRate,PickedQuantity,LastEditedBy,LastEditedWhen)
        VALUES (@OrderId,@ItemID,@OrderDesc,@PackageTypeID,@Quantity,15,@Quantity,1,GETDATE())
        SELECT @cnt=@cnt+1;
    END
GO;


SELECT *
FROM dm.sys_db_column_store_row_group_physical_stats
WHERE object_id = object_id('Sales.OrderLines');
GO

ALTER INDEX NCCX_Sales_OrderLines ON Sales.OrderLines
REORGANIZE WITH (COMPRESS_ALL_ROW_GROUPS = ON);
GO

ALTER INDEX NCCX_Sales_OrderLines ON Sales.OrderLines
REBUILD WITH (DATA_COMPRESSION = COLUMNSTORE_ARCHIVE);
GO
