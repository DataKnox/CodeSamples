-- schema to contain user tables
CREATE SCHEMA Data;
GO

-- table with masked columns
CREATE TABLE Data.Customers(
    MemberID        int IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    FirstName        varchar(100) NULL,
    LastName        varchar(100) NOT NULL,
    Phone            varchar(12) NULL,
    Email            varchar(100) NOT NULL,
    DiscountCode    smallint NULL
    );

-- inserting sample data
INSERT INTO Data.Customers (FirstName, LastName, Phone, Email, DiscountCode)
VALUES   
('Darth', 'Vader', '555.123.4567', 'dvader@deathstar.com', 10),  
('Knox', 'Hutchinson', '555.123.4568', 'Khutchinson@cbtnuggets.com', 5),  
('Luke', 'Skywalker', '555.123.4570', 'lskywalker@tatooine.net', 50),  
('Leia', 'Skywalker', '555.123.4569', 'lskywalker@alderaan.net', 40);

SELECT * FROM Data.Customers;

--CREATE A USER
--TEST MASKING (CONFIRM NON EXISTS)
CREATE USER MaskingTestUser WITHOUT LOGIN;  

GRANT SELECT ON SCHEMA::Data TO db_datareader;  
  
  -- impersonate for testing:
EXECUTE AS USER = 'MaskingTestUser';  

SELECT * FROM Data.Customers;  

REVERT;

--ADD MASKING
ALTER TABLE Data.Customers  
ALTER COLUMN LastName varchar(100) MASKED WITH (FUNCTION = 'default()');

ALTER TABLE Data.Customers  
ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()');

ALTER TABLE Data.Customers  
ALTER COLUMN Phone ADD MASKED WITH (FUNCTION = 'partial(1,"xxxx",1)');

  -- impersonate for testing:
EXECUTE AS USER = 'MaskingTestUser';  

SELECT * FROM Data.Customers;  

REVERT;

--Grant Unmask Rights
GRANT UNMASK TO MaskingTestUser;
GRANT UNMASK ON SCHEMA::Data TO MaskingTestUser;  
GRANT UNMASK ON Data.Customers TO MaskingTestUser;  
GRANT UNMASK ON Data.Customers(Phone) TO MaskingTestUser;  

EXECUTE AS USER = 'MaskingTestUser';  

SELECT * FROM Data.Customers;  

REVERT;    
  
-- Removing the UNMASK permission  
REVOKE UNMASK TO MaskingTestUser;

--Remove a MASK from a column
ALTER TABLE Data.Customers   
ALTER COLUMN LastName DROP MASKED;