USE master;
GO

--tail log backup
BACKUP LOG SWDB
  TO DISK = '\\file-nug\backups\SWDB_tail1.bak'
  WITH NORECOVERY;
GO

RESTORE DATABASE SWDB
    FROM DISK = '\\file-nug\backups\SWDB_full.bak'
    WITH NORECOVERY, REPLACE;
GO

RESTORE DATABASE SWDB
    FROM DISK = '\\file-nug\backups\SWDB_diff2.bak'
    WITH NORECOVERY;
GO

RESTORE DATABASE SWDB
    FROM DISK = '\\file-nug\backups\SWDB_tlog1.bak'
    WITH NORECOVERY;
GO

RESTORE DATABASE SWDB
    FROM DISK = '\\file-nug\backups\SWDB_tlog2.bak'
    WITH NORECOVERY;
GO

RESTORE DATABASE SWDB 
    FROM DISK = '\\file-nug\backups\SWDB_tail1.bak'
    WITH RECOVERY;
GO

--Test backups
RESTORE DATABASE SWDB_test
    FROM DISK = '\\file-nug\backups\SWDB_full.bak'
    WITH 
    MOVE 'SWDB' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWDB_test.mdf',
    MOVE 'SWDB_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWDB_test_log.ldf',
    NORECOVERY, REPLACE;
GO

RESTORE DATABASE SWDB_test
    FROM DISK = '\\file-nug\backups\SWDB_diff2.bak'
    WITH NORECOVERY;
GO

RESTORE DATABASE SWDB_test
    FROM DISK = '\\file-nug\backups\SWDB_log1.bak'
    WITH NORECOVERY;
GO

RESTORE DATABASE SWDB_test
    FROM DISK = '\\file-nug\backups\SWDB_log2.bak'
    WITH NORECOVERY;
GO

RESTORE DATABASE SWDB_test 
    FROM DISK = '\\file-nug\backups\SWDB_tail1.bak'
    WITH RECOVERY;
GO