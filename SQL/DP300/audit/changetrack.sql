USE NuggetlabDB
GO

ALTER DATABASE NuggetlabDB  
SET CHANGE_TRACKING = ON  
(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON)

ALTER TABLE dbo.CreditCards 
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON)

-- Make Changes
UPDATE dbo.CreditCards SET CardNumber = '5555666677778888' WHERE CreditCardID = 4
INSERT INTO dbo.CreditCards VALUES (5,'9999888877776666',6666,11,2022)

-- Get init sync
declare @synchronization_version bigint;

-- Obtain the current synchronization version. This will be used next time that changes are obtained.
SET @synchronization_version = CHANGE_TRACKING_CURRENT_VERSION();

-- Obtain initial data set.
SELECT
    [CreditCardID], [CardNumber], [CardLast4], [CardExpMonth], [CardExpYear]
FROM
   dbo.CreditCards

-- Obtain change metadata
declare @last_synchronization_version bigint;

SELECT
    CT.CreditCardID, CT.SYS_CHANGE_OPERATION,
    CT.SYS_CHANGE_COLUMNS, CT.SYS_CHANGE_CONTEXT
FROM
    CHANGETABLE(CHANGES dbo.CreditCards, @last_synchronization_version) AS CT;

-- Join two results
SELECT
    CT.CreditCardID, C.CardNumber, C.CardLast4,
    CT.SYS_CHANGE_OPERATION, CT.SYS_CHANGE_COLUMNS,
    CT.SYS_CHANGE_CONTEXT
FROM
    dbo.CreditCards as C
RIGHT OUTER JOIN
    CHANGETABLE(CHANGES dbo.CreditCards, @last_synchronization_version) AS CT
ON
    C.CreditCardID = CT.CreditCardID;