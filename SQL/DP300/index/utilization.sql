USE AdventureWorks2019;
GO

--operational stats
SELECT * 
FROM sys.dm_db_index_operational_stats(DB_ID(),NULL,NULL,NULL)
--usage stats with indexes
--look for write activity like updates but low read activity
SELECT 
OBJECT_NAME(ius.object_id) as TableName,
i.name as IndexName,
user_seeks,
user_scans,
user_lookups,
user_updates
FROM sys.dm_db_index_usage_stats ius
JOIN sys.indexes i on i.object_id = ius.object_id AND i.index_id=ius.index_id;


--big time 
SELECT 
'DROP INDEX' + OBJECT_NAME(ius.object_id)+'.'+i.name AS DropStatement,
user_seeks,
user_scans,
user_lookups,
user_updates
FROM sys.dm_db_index_usage_stats ius
JOIN sys.objects o ON ius.object_id=o.object_id
JOIN sys.indexes i on i.index_id = ius.index_id AND ius.object_id = i.object_id
WHERE 
i.is_primary_key = 0 AND
i.is_unique = 0 AND
ius.user_updates<>0 AND
ius.user_lookups = 0 AND
ius.user_seeks = 0 AND
ius.user_scans = 0
ORDER BY ius.user_updates DESC
