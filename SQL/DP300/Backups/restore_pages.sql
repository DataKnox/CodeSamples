
USE master
GO

DBCC IND(SWDB, 'dbo.People',1)
GO

ALTER DATABASE SWDB SET SINGLE_USER;
GO

DBCC WRITEPAGE('SWDB', 3, 8, 1, 1, 0x00, 1)
GO

ALTER DATABASE SWDB SET MULTI_USER;
GO

USE SWDB 
GO

SELECT * FROM dbo.People
SELECT * FROM msdb.dbo.suspect_pages

USE master
GO

--tail log backup
BACKUP LOG SWDB
    TO DISK = '\\file-nug\backups\swdb_tlog.bak'
    WITH NORECOVERY
GO


RESTORE DATABASE SWDB
  PAGE = '3:8'
  FROM DISK = '\\file-nug\backups\SWDB_full.bak'
  WITH NORECOVERY
GO

RESTORE DATABASE SWDB
  FROM DISK = '\\file-nug\backups\SWDB_diff.bak'
  WITH NORECOVERY
GO

RESTORE DATABASE SWDB
  FROM DISK = '\\file-nug\backups\SWDB_log.bak'
  WITH NORECOVERY
GO

RESTORE DATABASE SWDB
  FROM DISK = '\\file-nug\backups\swdb_tlog.bak'
  WITH RECOVERY
GO