CREATE TABLE [dbo].[Patients](
[PatientID] int IDENTITY(1,1),
[SSN] char(11) NOT NULL,
[FirstName] nvarchar(50) NULL,
[LastName] nvarchar(50) NULL,
[MiddleName] nvarchar(50) NULL,
[StreetAddress] nvarchar(50) NULL,
[City] nvarchar(50) NULL,
[ZipCode] char(5) NULL,
[State] char(2) NULL,
[BirthDate] date NOT NULL
PRIMARY KEY CLUSTERED ([PatientID] ASC) ON [PRIMARY]);
GO