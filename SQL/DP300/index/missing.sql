USE AdventureWorks2019;
GO

SELECT [Name], ModifiedDate
FROM Sales.Store
WHERE [Name] = 'Twin Cycles'

SELECT [Name], ModifiedDate
FROM Sales.Store
WHERE [Name] = 'Twin Cycles' AND ModifiedDate > '01/01/2010'

SELECT *
FROM sys.dm_db_missing_index_details

SELECT *
FROM sys.dm_db_missing_index_groups

SELECT *
FROM sys.dm_db_missing_index_group_stats


SELECT DISTINCT
    OBJECT_NAME(mid.object_id) as TableName,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns,
    migs.unique_compiles,
    migs.user_seeks,
    migs.last_user_seek,
    migs.avg_total_user_cost,
    migs.avg_user_impact
FROM sys.dm_db_missing_index_group_stats as migs
JOIN sys.dm_db_missing_index_groups as mig ON migs.group_handle = mig.index_group_handle
JOIN sys.dm_db_missing_index_details as mid ON mig.index_handle = mid.index_handle
WHERE mid.database_id = DB_ID();