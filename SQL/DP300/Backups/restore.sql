USE master;
GO

--tail log backup
BACKUP LOG SWDB
  TO DISK = '\\file-nug\backups\SWDB_tlog1.bak'
  WITH NORECOVERY;
GO

RESTORE DATABASE SWDB
    FROM DISK = '\\file-nug\backups\SWDB_full.bak'
    WITH NORECOVERY, REPLACE;
GO