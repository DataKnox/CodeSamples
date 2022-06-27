CREATE SCHEMA Sales
GO

CREATE TABLE [sales].[Customers](
CustomerID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FirstName varchar(100),
LastName varchar(100),
CreateDate DATETIME DEFAULT GETDATE()
)

CREATE TABLE [sales].[sales](
    SaleID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SaleDate DATETIME DEFAULT GETDATE(),
    ProductName varchar(100),
    ProductDescription varchar(200)
)

GRANT SELECT ON SCHEMA::Sales TO devTeam
GRANT INSERT ON SCHEMA::Sales TO devTeam
GRANT UPDATE ON SCHEMA::Sales TO devTeam
GRANT DELETE ON SCHEMA::Sales TO devTeam

--Revoking
REVOKE UPDATE ON SCHEMA::Sales to devTeam
REVOKE DELETE ON SCHEMA::Sales TO devTeam
USE master
GO
CREATE LOGIN [nuggetlab\luskywalker]
FROM WINDOWS
USE NuggetlabDB
GO
CREATE USER luskywalker
FOR LOGIN [nuggetlab\luskywalker]
GO
GRANT DELETE ON SCHEMA::Sales to devTeam

--Deny
DENY DELETE ON Sales.Customers to devTeam

--column level
GRANT SELECT on Sales.sales([SaleID],ProductName) TO devTeam