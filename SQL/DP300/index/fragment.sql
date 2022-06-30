USE master;
GO

--all dbs
SELECT * 
FROM sys.dm_db_index_physical_stats(NULL,NULL,NULL,NULL,NULL)
WHERE avg_fragmentation_in_percent > 0
ORDER BY avg_fragmentation_in_percent DESC;
GO
-- AW2019 db
DECLARE @DBID int;
SET @DBID = DB_ID('AdventureWorks2019')

SELECT * 
FROM sys.dm_db_index_physical_stats(@DBID,NULL,NULL,NULL,'LIMITED')
WHERE avg_fragmentation_in_percent > 0
ORDER BY avg_fragmentation_in_percent DESC;
GO

--aw2019 object
-- AW2019 db
DECLARE @DBID int, @OBJID int;
SET @DBID = DB_ID('AdventureWorks2019')
SET @OBJID = OBJECT_ID('AdventureWorks2019.Person.Person')

SELECT * 
FROM sys.dm_db_index_physical_stats(@DBID,@OBJID,NULL,NULL,'LIMITED')
ORDER BY avg_fragmentation_in_percent DESC;
GO

--REPAIR STEPS
SELECT 
OBJECT_NAME(i.object_id) AS TableName,
i.name as IndexName,
ips.index_type_desc as IndexType,
ips.avg_fragmentation_in_percent as FragPercent
FROM sys.dm_db_index_physical_stats(DB_ID(),NULL,NULL,NULL,NULL) as ips
JOIN sys.indexes i on i.object_id = ips.object_id AND i.index_id = ips.index_id
WHERE ips.avg_fragmentation_in_percent > 0 AND ips.avg_fragmentation_in_percent < 30
ORDER BY ips.avg_fragmentation_in_percent DESC;

--reorganize, quicker. Doesnt drop and rebuild. Less than 30%
ALTER INDEX ALL ON Purchasing.PurchaseOrderHeader REORGANIZE

--Rebuild
SELECT 
OBJECT_NAME(i.object_id) AS TableName,
i.name as IndexName,
ips.index_type_desc as IndexType,
ips.avg_fragmentation_in_percent as FragPercent
FROM sys.dm_db_index_physical_stats(DB_ID(),NULL,NULL,NULL,NULL) as ips
JOIN sys.indexes i on i.object_id = ips.object_id AND i.index_id = ips.index_id
WHERE ips.avg_fragmentation_in_percent >= 30
ORDER BY ips.avg_fragmentation_in_percent DESC;


ALTER INDEX ALL ON Person.BusinessEntityContact REBUILD