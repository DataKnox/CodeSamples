USE SWDB
GO

--Create SECONDARY filegroup
--Add new files into the filegroup

CREATE UNIQUE CLUSTERED INDEX PK_Planets
 ON dbo.Planets(PlanetID)
 WITH DROP_EXISTING
 ON SECONDARY
GO

CREATE UNIQUE CLUSTERED INDEX PK_People
 ON dbo.People(PersonID)
 WITH DROP_EXISTING
 ON SECONDARY
GO

BACKUP DATABASE SWDB
 FILEGROUP = 'SECONDARY'
 TO DISK = '\\file-nug\backups\SWDB_sec_fg.bak'
GO

BACKUP DATABASE SWDB
 FILEGROUP = 'SECONDARY'
 TO DISK = '\\file-nug\backups\SWDB_sec_fg_diff.bak'
 WITH DIFFERENTIAL
GO

BACKUP DATABASE SWDB
 FILE = 'SWDB_data'
 TO DISK = '\\file-nug\backups\SWDB_data_file1.bak'
GO