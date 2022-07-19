USE master
GO

BACKUP DATABASE SWDB
  TO DISK = '\\file-nug\backups\SWDB_full.bak'
GO

USE [SWDB]
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (1, N'The Phantom Menace', N'Rick McCallum', N'George Lucas', CAST(N'1999-05-19T00:00:00.000' AS DateTime), N'Turmoil has engulfed the
Galactic Republic. The taxation
of trade routes to outlying star
systems is in dispute.

Hoping to resolve the matter
with a blockade of deadly
battleships, the greedy Trade
Federation has stopped all
shipping to the small planet
of Naboo.

While the Congress of the
Republic endlessly debates
this alarming chain of events,
the Supreme Chancellor has
secretly dispatched two Jedi
Knights, the guardians of
peace and justice in the
galaxy, to settle the conflict....')
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (2, N'Attack of the Clones', N'Rick McCallum', N'George Lucas', CAST(N'2002-05-16T00:00:00.000' AS DateTime), N'There is unrest in the Galactic
Senate. Several thousand solar
systems have declared their
intentions to leave the Republic.

This separatist movement,
under the leadership of the
mysterious Count Dooku, has
made it difficult for the limited
number of Jedi Knights to maintain 
peace and order in the galaxy.

Senator Amidala, the former
Queen of Naboo, is returning
to the Galactic Senate to vote
on the critical issue of creating
an ARMY OF THE REPUBLIC
to assist the overwhelmed
Jedi....')
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (3, N'Revenge of the Sith', N'Rick McCallum', N'George Lucas', CAST(N'2005-05-19T00:00:00.000' AS DateTime), N'War! The Republic is crumbling
under attacks by the ruthless
Sith Lord, Count Dooku.
There are heroes on both sides.
Evil is everywhere.

In a stunning move, the
fiendish droid leader, General
Grievous, has swept into the
Republic capital and kidnapped
Chancellor Palpatine, leader of
the Galactic Senate.

As the Separatist Droid Army
attempts to flee the besieged
capital with their valuable
hostage, two Jedi Knights lead a
desperate mission to rescue the
captive Chancellor....')
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (4, N'A New Hope', N'Gary Kurtz, Rick McCallum', N'George Lucas', CAST(N'1977-05-25T00:00:00.000' AS DateTime), N'It is a period of civil war.
Rebel spaceships, striking
from a hidden base, have won
their first victory against
the evil Galactic Empire.

During the battle, Rebel
spies managed to steal secret
plans to the Empire''s
ultimate weapon, the DEATH
STAR, an armored space
station with enough power
to destroy an entire planet.

Pursued by the Empire''s
sinister agents, Princess
Leia races home aboard her
starship, custodian of the
stolen plans that can save her
people and restore
freedom to the galaxy....')
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (5, N'The Empire Strikes Back', N'Gary Kurtz, Rick McCallum', N'Irvin Kershner', CAST(N'1980-05-17T00:00:00.000' AS DateTime), N'It is a dark time for the
Rebellion. Although the Death
Star has been destroyed,
Imperial troops have driven the
Rebel forces from their hidden
base and pursued them across
the galaxy.

Evading the dreaded Imperial
Starfleet, a group of freedom
fighters led by Luke Skywalker
has established a new secret
base on the remote ice world
of Hoth.

The evil lord Darth Vader,
obsessed with finding young
Skywalker, has dispatched
thousands of remote probes into
the far reaches of space....')
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (6, N'Return of the Jedi', N'Howard G. Kazanjian, George Lucas, Rick McCallum', N'Richard Marquand', CAST(N'1983-05-25T00:00:00.000' AS DateTime), N'Luke Skywalker has returned to
his home planet of Tatooine in
an attempt to rescue his
friend Han Solo from the
clutches of the vile gangster
Jabba the Hutt.

Little does Luke know that the
GALACTIC EMPIRE has secretly
begun construction on a new
armored space station even
more powerful than the first
dreaded Death Star.

When completed, this ultimate
weapon will spell certain doom
for the small band of rebels
struggling to restore freedom
to the galaxy...')
GO
INSERT [dbo].[Films] ([FilmID], [Title], [Producer], [Director], [Released], [OpeningText]) VALUES (7, N'The Force Awakens', N'Kathleen Kennedy, J. J. Abrams, Bryan Burk', N'J. J. Abrams', CAST(N'2015-12-11T00:00:00.000' AS DateTime), N'Luke Skywalker has vanished.
In his absence, the sinister
FIRST ORDER has risen from
the ashes of the Empire
and will not rest until
Skywalker, the last Jedi,
has been destroyed.
 
With the support of the
REPUBLIC, General Leia Organa
leads a brave RESISTANCE.
She is desperate to find her
brother Luke and gain his
help in restoring peace and
justice to the galaxy.
 
Leia has sent her most daring
pilot on a secret mission
to Jakku, where an old ally
has discovered a clue to
Luke''s whereabouts....')
GO

BACKUP DATABASE SWDB
  TO DISK = '\\file-nug\backups\SWDB_diff1.bak'
  WITH DIFFERENTIAL
GO

GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (1, N'Luke Skywalker', N'1', N'male', N'19BBY', N'blue', N'blond', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (2, N'C-3PO', N'1', NULL, N'112BBY', N'yellow', NULL, N'gold')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (3, N'R2-D2', N'8', NULL, N'33BBY', N'red', NULL, N'white, blue')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (4, N'Darth Vader', N'1', N'male', N'41.9BBY', N'yellow', NULL, N'white')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (5, N'Leia Organa', N'2', N'female', N'19BBY', N'brown', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (6, N'Owen Lars', N'1', N'male', N'52BBY', N'blue', N'brown, grey', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (7, N'Beru Whitesun lars', N'1', N'female', N'47BBY', N'blue', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (8, N'R5-D4', N'1', NULL, NULL, N'red', NULL, N'white, red')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (9, N'Biggs Darklighter', N'1', N'male', N'24BBY', N'brown', N'black', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (10, N'Obi-Wan Kenobi', N'20', N'male', N'57BBY', N'blue-gray', N'auburn, white', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (11, N'Anakin Skywalker', N'1', N'male', N'41.9BBY', N'blue', N'blond', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (12, N'Wilhuff Tarkin', N'21', N'male', N'64BBY', N'blue', N'auburn, grey', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (13, N'Chewbacca', N'14', N'male', N'200BBY', N'blue', N'brown', N'unknown')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (14, N'Han Solo', N'22', N'male', N'29BBY', N'brown', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (15, N'Greedo', N'23', N'male', N'44BBY', N'black', NULL, N'green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (16, N'Jabba Desilijic Tiure', N'24', N'hermaphrodite', N'600BBY', N'orange', NULL, N'green-tan, brown')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (17, N'Wedge Antilles', N'22', N'male', N'21BBY', N'hazel', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (18, N'Jek Tono Porkins', N'26', N'male', NULL, N'blue', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (19, N'Yoda', NULL, N'male', N'896BBY', N'brown', N'white', N'green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (20, N'Palpatine', N'8', N'male', N'82BBY', N'yellow', N'grey', N'pale')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (21, N'Boba Fett', N'10', N'male', N'31.5BBY', N'brown', N'black', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (22, N'IG-88', NULL, NULL, N'15BBY', N'red', NULL, N'metal')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (23, N'Bossk', N'29', N'male', N'53BBY', N'red', NULL, N'green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (24, N'Lando Calrissian', N'30', N'male', N'31BBY', N'brown', N'black', N'dark')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (25, N'Lobot', N'6', N'male', N'37BBY', N'blue', NULL, N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (26, N'Ackbar', N'31', N'male', N'41BBY', N'orange', NULL, N'brown mottle')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (27, N'Mon Mothma', N'32', N'female', N'48BBY', N'blue', N'auburn', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (28, N'Arvel Crynyd', NULL, N'male', NULL, N'brown', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (29, N'Wicket Systri Warrick', N'7', N'male', N'8BBY', N'brown', N'brown', N'brown')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (30, N'Nien Nunb', N'33', N'male', NULL, N'black', NULL, N'grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (31, N'Qui-Gon Jinn', NULL, N'male', N'92BBY', N'blue', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (32, N'Nute Gunray', N'18', N'male', NULL, N'red', NULL, N'mottled green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (33, N'Finis Valorum', N'9', N'male', N'91BBY', N'blue', N'blond', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (34, N'Padmé Amidala', N'8', N'female', N'46BBY', N'brown', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (35, N'Jar Jar Binks', N'8', N'male', N'52BBY', N'orange', NULL, N'orange')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (36, N'Roos Tarpals', N'8', N'male', NULL, N'orange', NULL, N'grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (37, N'Rugor Nass', N'8', N'male', NULL, N'orange', NULL, N'green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (38, N'Ric Olié', N'8', N'male', NULL, N'blue', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (39, N'Watto', N'34', N'male', NULL, N'yellow', N'black', N'blue, grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (40, N'Sebulba', N'35', N'male', NULL, N'orange', NULL, N'grey, red')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (41, N'Quarsh Panaka', N'8', N'male', N'62BBY', N'brown', N'black', N'dark')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (42, N'Shmi Skywalker', N'1', N'female', N'72BBY', N'brown', N'black', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (43, N'Darth Maul', N'36', N'male', N'54BBY', N'yellow', NULL, N'red')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (44, N'Bib Fortuna', N'37', N'male', NULL, N'pink', NULL, N'pale')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (45, N'Ayla Secura', N'37', N'female', N'48BBY', N'hazel', NULL, N'blue')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (46, N'Ratts Tyerell', N'38', N'male', NULL, N'unknown', NULL, N'grey, blue')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (47, N'Dud Bolt', N'39', N'male', NULL, N'yellow', NULL, N'blue, grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (48, N'Gasgano', N'40', N'male', NULL, N'black', NULL, N'white, blue')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (49, N'Ben Quadinaros', N'41', N'male', NULL, N'orange', NULL, N'grey, green, yellow')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (50, N'Mace Windu', N'42', N'male', N'72BBY', N'brown', NULL, N'dark')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (51, N'Ki-Adi-Mundi', N'43', N'male', N'92BBY', N'yellow', N'white', N'pale')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (52, N'Kit Fisto', N'44', N'male', NULL, N'black', NULL, N'green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (53, N'Eeth Koth', N'45', N'male', NULL, N'brown', N'black', N'brown')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (54, N'Adi Gallia', N'9', N'female', NULL, N'blue', NULL, N'dark')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (55, N'Saesee Tiin', N'47', N'male', NULL, N'orange', NULL, N'pale')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (56, N'Yarael Poof', N'48', N'male', NULL, N'yellow', NULL, N'white')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (57, N'Plo Koon', N'49', N'male', N'22BBY', N'black', NULL, N'orange')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (58, N'Mas Amedda', N'50', N'male', NULL, N'blue', NULL, N'blue')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (59, N'Gregar Typho', N'8', N'male', NULL, N'brown', N'black', N'dark')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (60, N'Cordé', N'8', N'female', NULL, N'brown', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (61, N'Cliegg Lars', N'1', N'male', N'82BBY', N'blue', N'brown', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (62, N'Poggle the Lesser', N'11', N'male', NULL, N'yellow', NULL, N'green')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (63, N'Luminara Unduli', N'51', N'female', N'58BBY', N'blue', N'black', N'yellow')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (64, N'Barriss Offee', N'51', N'female', N'40BBY', N'blue', N'black', N'yellow')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (65, N'Dormé', N'8', N'female', NULL, N'brown', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (66, N'Dooku', N'52', N'male', N'102BBY', N'brown', N'white', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (67, N'Bail Prestor Organa', N'2', N'male', N'67BBY', N'brown', N'black', N'tan')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (68, N'Jango Fett', N'53', N'male', N'66BBY', N'brown', N'black', N'tan')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (69, N'Zam Wesell', N'54', N'female', NULL, N'yellow', N'blonde', N'fair, green, yellow')



BACKUP DATABASE SWDB
  TO DISK = '\\file-nug\backups\SWDB_diff2.bak'
  WITH DIFFERENTIAL
GO

GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (70, N'Dexter Jettster', N'55', N'male', NULL, N'yellow', NULL, N'brown')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (71, N'Lama Su', N'10', N'male', NULL, N'black', NULL, N'grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (72, N'Taun We', N'10', N'female', NULL, N'black', NULL, N'grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (73, N'Jocasta Nu', N'9', N'female', NULL, N'blue', N'white', N'fair')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (74, N'R4-P17', NULL, N'female', NULL, N'red, blue', NULL, N'silver, red')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (75, N'Wat Tambor', N'56', N'male', NULL, N'unknown', NULL, N'green, grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (76, N'San Hill', N'57', N'male', NULL, N'gold', NULL, N'grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (77, N'Shaak Ti', N'58', N'female', NULL, N'black', NULL, N'red, blue, white')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (78, N'Grievous', N'59', N'male', NULL, N'green, yellow', NULL, N'brown, white')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (79, N'Tarfful', N'14', N'male', NULL, N'blue', N'brown', N'brown')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (80, N'Raymus Antilles', N'2', N'male', NULL, N'brown', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (81, N'Sly Moore', N'60', N'female', NULL, N'white', NULL, N'pale')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (82, N'Tion Medon', N'12', N'male', NULL, N'black', NULL, N'grey')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (83, N'Finn', NULL, N'male', NULL, N'dark', N'black', N'dark')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (84, N'Rey', NULL, N'female', NULL, N'hazel', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (85, N'Poe Dameron', NULL, N'male', NULL, N'brown', N'brown', N'light')
GO
INSERT [dbo].[People] ([PersonID], [Name], [HomePlanetID], [Gender], [BirthYear], [EyeColor], [HairColor], [SkinColor]) VALUES (86, N'BB8', NULL, NULL, NULL, N'black', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO


BACKUP LOG SWDB
  TO DISK = '\\file-nug\backups\SWDB_log1.bak'
GO

INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (1, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (1, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (1, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (1, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (1, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (2, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (2, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (2, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (2, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (2, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (2, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (3, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (4, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (4, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (4, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (4, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (5, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (5, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (5, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (5, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (5, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (6, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (6, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (6, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (7, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (7, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (7, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (8, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (9, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (10, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (10, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (10, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (10, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (10, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (10, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (11, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (11, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (11, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (12, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (12, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (13, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (13, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (13, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (13, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (13, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (14, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (14, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (14, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (14, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (15, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (16, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (16, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (16, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (17, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (17, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (17, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (18, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (19, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (19, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (19, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (19, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (19, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (20, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (20, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (20, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (20, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (20, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (21, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (21, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (21, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (22, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (23, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (24, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (24, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (25, 5)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (26, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (26, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (27, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (28, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (29, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (30, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (31, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (32, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (32, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (32, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (33, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (34, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (34, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (34, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (35, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (35, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (36, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (37, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (38, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (39, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (39, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (40, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (41, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (42, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (42, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (43, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (44, 6)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (45, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (45, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (45, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (46, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (47, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (48, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (49, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (50, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (50, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (50, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (51, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (51, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (51, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (52, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (52, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (52, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (53, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (53, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (54, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (54, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (55, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (55, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (56, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (57, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (57, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (57, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (58, 1)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (58, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (59, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (60, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (61, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (62, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (62, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (63, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (63, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (64, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (65, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (66, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (66, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (67, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (67, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (68, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (69, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (70, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (71, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (72, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (73, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (74, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (74, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (75, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (76, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (77, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (77, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (78, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (79, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (80, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (80, 4)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (81, 2)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (81, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (82, 3)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (83, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (84, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (85, 7)
GO
INSERT [dbo].[PeopleToFilms] ([PersonID], [FilmID]) VALUES (86, 7)
GO

BACKUP LOG SWDB
  TO DISK = '\\file-nug\backups\SWDB_log2.bak'
GO

SET IDENTITY_INSERT [dbo].[Planets] ON 
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (1, N'Tatooine', 200000, 10465, N'arid', N'desert', N'1 standard', 23, 304)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (2, N'Alderaan', 2000000000, 12500, N'temperate', N'grasslands, mountains', N'1 standard', 24, 364)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (3, N'Yavin IV', 1000, 10200, N'temperate, tropical', N'jungle, rainforests', N'1 standard', 24, 4818)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (4, N'Hoth', NULL, 7200, N'frozen', N'tundra, ice caves, mountain ranges', N'1.1 standard', 23, 549)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (5, N'Dagobah', NULL, 8900, N'murky', N'swamp, jungles', NULL, 23, 341)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (6, N'Bespin', 6000000, 118000, N'temperate', N'gas giant', N'1.5 (surface), 1 standard (Cloud City)', 12, 5110)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (7, N'Endor', 30000000, 4900, N'temperate', N'forests, mountains, lakes', N'0.85 standard', 18, 402)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (8, N'Naboo', 4500000000, 12120, N'temperate', N'grassy hills, swamps, forests, mountains', N'1 standard', 26, 312)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (9, N'Coruscant', 1000000000000, 12240, N'temperate', N'cityscape, mountains', N'1 standard', 24, 368)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (10, N'Kamino', 1000000000, 19720, N'temperate', N'ocean', N'1 standard', 27, 463)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (11, N'Geonosis', 100000000000, 11370, N'temperate, arid', N'rock, desert, mountain, barren', N'0.9 standard', 30, 256)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (12, N'Utapau', 95000000, 12900, N'temperate, arid, windy', N'scrublands, savanna, canyons, sinkholes', N'1 standard', 27, 351)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (13, N'Mustafar', 20000, 4200, N'hot', N'volcanoes, lava rivers, mountains, caves', N'1 standard', 36, 412)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (14, N'Kashyyyk', 45000000, 12765, N'tropical', N'jungle, forests, lakes, rivers', N'1 standard', 26, 381)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (15, N'Polis Massa', 1000000, NULL, N'artificial temperate ', N'airless asteroid', N'0.56 standard', 24, 590)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (16, N'Mygeeto', 19000000, 10088, N'frigid', N'glaciers, mountains, ice canyons', N'1 standard', 12, 167)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (17, N'Felucia', 8500000, 9100, N'hot, humid', N'fungus forests', N'0.75 standard', 34, 231)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (18, N'Cato Neimoidia', 10000000, NULL, N'temperate, moist', N'mountains, fields, forests, rock arches', N'1 standard', 25, 278)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (19, N'Saleucami', 1400000000, 14920, N'hot', N'caves, desert, mountains, volcanoes', NULL, 26, 392)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (20, N'Stewjon', NULL, NULL, N'temperate', N'grass', N'1 standard', NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (21, N'Eriadu', 22000000000, 13490, N'polluted', N'cityscape', N'1 standard', 24, 360)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (22, N'Corellia', 3000000000, 11000, N'temperate', N'plains, urban, hills, forests', N'1 standard', 25, 349)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (23, N'Rodia', 1300000000, 7549, N'hot', N'jungles, oceans, urban, swamps', N'1 standard', 29, 305)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (24, N'Nal Hutta', 7000000000, 12150, N'temperate', N'urban, oceans, swamps, bogs', N'1 standard', 87, 413)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (25, N'Dantooine', 1000, 9830, N'temperate', N'oceans, savannas, mountains, grasslands', N'1 standard', 25, 378)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (26, N'Bestine IV', 62000000, 6400, N'temperate', N'rocky islands, oceans', NULL, 26, 680)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (27, N'Ord Mantell', 4000000000, 14050, N'temperate', N'plains, seas, mesas', N'1 standard', 26, 334)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (29, N'Trandosha', 42000000, NULL, N'arid', N'mountains, seas, grasslands, deserts', N'0.62 standard', 25, 371)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (30, N'Socorro', 300000000, NULL, N'arid', N'deserts, mountains', N'1 standard', 20, 326)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (31, N'Mon Cala', 27000000000, 11030, N'temperate', N'oceans, reefs, islands', N'1', 21, 398)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (32, N'Chandrila', 1200000000, 13500, N'temperate', N'plains, forests', N'1', 20, 368)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (33, N'Sullust', 18500000000, 12780, N'superheated', N'mountains, volcanoes, rocky deserts', N'1', 20, 263)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (34, N'Toydaria', 11000000, 7900, N'temperate', N'swamps, lakes', N'1', 21, 184)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (35, N'Malastare', 2000000000, 18880, N'arid, temperate, tropical', N'swamps, deserts, jungles, mountains', N'1.56', 26, 201)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (36, N'Dathomir', 5200, 10480, N'temperate', N'forests, deserts, savannas', N'0.9', 24, 491)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (37, N'Ryloth', 1500000000, 10600, N'temperate, arid, subartic', N'mountains, valleys, deserts, tundra', N'1', 30, 305)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (38, N'Aleen Minor', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (39, N'Vulpter', 421000000, 14900, N'temperate, artic', N'urban, barren', N'1', 22, 391)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (40, N'Troiken', NULL, NULL, NULL, N'desert, tundra, rainforests, mountains', NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (41, N'Tund', NULL, 12190, NULL, N'barren, ash', NULL, 48, 1770)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (42, N'Haruun Kal', 705300, 10120, N'temperate', N'toxic cloudsea, plateaus, volcanoes', N'0.98', 25, 383)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (43, N'Cerea', 450000000, NULL, N'temperate', N'verdant', N'1', 27, 386)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (44, N'Glee Anselm', 500000000, 15600, N'tropical, temperate', N'lakes, islands, swamps, seas', N'1', 33, 206)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (45, N'Iridonia', NULL, NULL, NULL, N'rocky canyons, acid pools', NULL, 29, 413)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (46, N'Tholoth', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (47, N'Iktotch', NULL, NULL, N'arid, rocky, windy', N'rocky', N'1', 22, 481)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (48, N'Quermia', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (49, N'Dorin', NULL, 13400, N'temperate', NULL, N'1', 22, 409)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (50, N'Champala', 3500000000, NULL, N'temperate', N'oceans, rainforests, plateaus', N'1', 27, 318)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (51, N'Mirial', NULL, NULL, NULL, N'deserts', NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (52, N'Serenno', NULL, NULL, NULL, N'rainforests, rivers, mountains', NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (53, N'Concord Dawn', NULL, NULL, NULL, N'jungles, forests, deserts', NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (54, N'Zolan', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (55, N'Ojom', 500000000, NULL, N'frigid', N'oceans, glaciers', NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (56, N'Skako', 500000000000, NULL, N'temperate', N'urban, vines', N'1', 27, 384)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (57, N'Muunilinst', 5000000000, 13800, N'temperate', N'plains, forests, hills, mountains', N'1', 28, 412)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (58, N'Shili', NULL, NULL, N'temperate', N'cities, savannahs, seas, plains', N'1', NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (59, N'Kalee', 4000000000, 13850, N'arid, temperate, tropical', N'rainforests, cliffs, canyons, seas', N'1', 23, 378)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (60, N'Umbara', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Planets] ([PlanetID], [Name], [Population], [Diameter], [Climate], [Terrain], [Gravity], [RotationPeriod], [OrbitalPeriod]) VALUES (61, N'Jakku', NULL, NULL, NULL, N'deserts', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Planets] OFF
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (1, 1)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (1, 2)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (1, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (1, 4)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (1, 6)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (2, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (2, 4)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (3, 4)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (4, 5)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (5, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (5, 5)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (5, 6)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (6, 5)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (7, 6)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (8, 1)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (8, 2)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (8, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (8, 6)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (9, 1)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (9, 2)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (9, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (9, 6)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (10, 2)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (11, 2)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (12, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (13, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (14, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (15, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (16, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (17, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (18, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (19, 3)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (27, 5)
GO
INSERT [dbo].[PlanetsToFilms] ([PlanetID], [FilmID]) VALUES (61, 7)
GO

CREATE CREDENTIAL [https://knoxbackup.blob.core.windows.net/sqlbak]
   WITH IDENTITY = 'SHARED ACCESS SIGNATURE'
   SECRET = 'sharedaccessignature'

BACKUP DATABASE SWDB
  TO URL = N'https://knoxbackup.blob.core.windows.net/sqlbak'
  WITH NAME = N'SWDB_full_backup'
GO