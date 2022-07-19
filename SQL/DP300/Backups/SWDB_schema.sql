USE SWDB;
GO

/* CREATE TABLES */

-- films
CREATE TABLE dbo.Films(
	FilmID			INT				NOT NULL,
	Title			NVARCHAR(50)	NOT NULL,
	Producer		NVARCHAR(50)	NOT NULL,
	Director		NVARCHAR(50)	NOT NULL,
	Released		DATE			NOT NULL,
	OpeningText		NVARCHAR(MAX)	NOT NULL,
  CONSTRAINT PK_Films PRIMARY KEY (FilmID)
);
GO

-- characters
CREATE TABLE dbo.People(
	PersonID		INT				IDENTITY,
	[Name]			NVARCHAR(100)	NOT NULL,
	HomePlanetID	INT				NULL,
	Gender			NVARCHAR(15)	NULL,
	BirthYear		NVARCHAR(15)	NULL,
	EyeColor		NVARCHAR(20)	NULL,
	HairColor		NVARCHAR(20)	NULL,
	SkinColor		NVARCHAR(20)	NULL,
  CONSTRAINT PK_People PRIMARY KEY (PersonID)
);
GO

-- planets
CREATE TABLE dbo.Planets(
	PlanetID		INT				IDENTITY,
	[Name]			NVARCHAR(20)	NOT NULL,
	[Population]	BIGINT			NULL,
	Diameter		INT				NULL,
	Climate			NVARCHAR(25)	NULL,
	Terrain			NVARCHAR(50)	NULL,
	Gravity			NVARCHAR(50)	NULL,
	RotationPeriod	SMALLINT		NULL,
	OrbitalPeriod	SMALLINT		NULL,
  CONSTRAINT PK_Planets PRIMARY KEY (PlanetID) 
);
GO

-- people2films
CREATE TABLE dbo.PeopleToFilms(
	PersonID		INT				NOT NULL,
	FilmID			INT				NOT NULL
  CONSTRAINT PK_PeopleToFilms PRIMARY KEY (PersonID,FilmID) 
);
GO

-- planets2films
CREATE TABLE dbo.PlanetsToFilms(
	PlanetID		INT				NOT NULL,
	FilmID			INT				NOT NULL
  CONSTRAINT PK_PlanetsToFilms PRIMARY KEY (PlanetID,FilmID) 
);
GO


/* ALTER TABLES */

-- add column
ALTER TABLE dbo.People
	ADD IsForceUser	CHAR(3)	NULL;

-- modify column
ALTER TABLE dbo.People
	ALTER COLUMN IsForceUser BIT NOT NULL;

-- drop column
ALTER TABLE dbo.People
	DROP COLUMN IsForceUser;