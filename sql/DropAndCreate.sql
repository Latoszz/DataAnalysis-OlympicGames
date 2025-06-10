--Staging Tables
DROP TABLE IF EXISTS [dbo].[ResultSt];
DROP TABLE IF EXISTS [dbo].[AthleteSt]; 
DROP TABLE IF EXISTS [dbo].[CountryYearSt];
DROP TABLE IF EXISTS [dbo].[EventSt];
DROP TABLE IF EXISTS [dbo].[MedalSt];
DROP TABLE IF EXISTS [dbo].[PlacementSt];
DROP TABLE IF EXISTS [dbo].[RawResultClean]
DROP TABLE IF EXISTS [dbo].[ResultsSourceTemp]

CREATE TABLE [dbo].[ResultsSourceTemp] (
    [year] INT NULL,
    [type] NVARCHAR(255) NULL,
    discipline NVARCHAR(255) NULL,
    [event] NVARCHAR(255) NULL,
    athlete_name NVARCHAR(255) NULL,
    athlete_id INT NULL,
    NOC NVARCHAR(255) NULL,
    team NVARCHAR(255) NULL,
    place INT NULL,
    tied BIT NULL,
    medal NVARCHAR(255) NULL
);


CREATE TABLE AthleteSt(
	idT int PRIMARY KEY,
	height int NULL,
	[weight] int NULL,
	yearborn int NULL,
	idnew int NULL
)


CREATE TABLE [dbo].[CountryYearSt](
	[idT] [int] NOT NULL IDENTITY (1,1) ,
	[year] [int] NULL,
	[NOC] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[inflation] float NULL,
	gdp_per_capita float NULL,
	gdp_healthcare_percentage float NULL,
	total_population bigint NULL,
	avg_tariff float NULL,
	stability float NULL
);

CREATE TABLE [dbo].[EventSt](
	[idT] [int] NOT NULL IDENTITY (1,1),
	[name] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[discipline] [nvarchar](255) NULL,
);

CREATE TABLE [dbo].[MedalSt](
	[idT] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
);

CREATE TABLE [dbo].[PlacementSt](
	[idT] [int] NOT NULL,
	[number] [int] NULL,
);

CREATE TABLE [dbo].[ResultSt](
   [id] [int] NOT NULL IDENTITY (1,1) ,
   CountryYear_AthleteT int  NOT NULL,
   Athlete_idT int NOT NULL,
   CountryYear_OlympicsT int NOT NULL,
   Event_idT int NOT NULL,
   Medal_idT int NOT NULL,
   Placement_idT int NOT NULL,
);

CREATE TABLE [dbo].[RawResultClean](
	[year] int NULL,
	[type] nvarchar(255) NULL,
	[discipline] nvarchar(255)
)

ALTER TABLE [dbo].[CountryYearSt] ADD CONSTRAINT PK_CountryYearSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[EventSt] ADD CONSTRAINT PK_EventSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[MedalSt] ADD CONSTRAINT PK_MedalSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[PlacementSt] ADD CONSTRAINT PK_PlacementSt PRIMARY KEY (idT);

---Final tables

DROP TABLE IF EXISTS [dbo].[Result];
DROP TABLE IF EXISTS [dbo].[Athlete]; 
DROP TABLE IF EXISTS [dbo].[CountryYear];
DROP TABLE IF EXISTS [dbo].[Event];
DROP TABLE IF EXISTS [dbo].[Medal];
DROP TABLE IF EXISTS [dbo].[Placement];

--generate tables
CREATE TABLE [dbo].[Athlete](
	[id] [int] NOT NULL,
	[height] [int] NOT NULL,
	[weight] [int] NOT NULL,
	[yearborn] [int] NULL,
);


CREATE TABLE [dbo].[CountryYear](
	[id] [int] NOT NULL,
	[year] [int] NULL,
	[NOC] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[inflation] float NULL,
	gdp_per_capita float NULL,
	gdp_healthcare_percentage float NULL,
	total_population bigint NULL,
	avg_tariff float NULL,
	stability float NULL
);

CREATE TABLE [dbo].[Event](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[gender] [nvarchar](255) NOT NULL,
	[discipline] [nvarchar](255) NOT NULL,
);

CREATE TABLE [dbo].[Medal](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
);

CREATE TABLE [dbo].[Placement](
	[id] [int] NOT NULL,
	[number] [int] NULL,
);

CREATE TABLE [dbo].[Result](
   [id] [int] NOT NULL,
   CountryYear_Athlete int  NOT NULL,
   Athlete_id int  NOT NULL,
   CountryYear_Olympics int  NOT NULL,
   Event_id int  NOT NULL,
   Medal_id int  NOT NULL,
   Placement_id int  NOT NULL,
);
--add pk
ALTER TABLE [dbo].[Athlete] ADD CONSTRAINT PK_Athlete PRIMARY KEY (id);

ALTER TABLE [dbo].[CountryYear] ADD CONSTRAINT PK_CountryYear PRIMARY KEY (id);

ALTER TABLE [dbo].[Event] ADD CONSTRAINT PK_Event PRIMARY KEY (id);

ALTER TABLE [dbo].[Medal] ADD CONSTRAINT PK_Medal PRIMARY KEY (id);

ALTER TABLE [dbo].[Placement] ADD CONSTRAINT PK_Placement PRIMARY KEY (id);


--add fk
ALTER TABLE [dbo].[Result]
ADD CONSTRAINT FK_Result_CountryYear_Athlete FOREIGN KEY (CountryYear_Athlete) 
REFERENCES [dbo].[CountryYear] (id);

ALTER TABLE [dbo].[Result] 
ADD CONSTRAINT FK_Result_Athlete FOREIGN KEY (Athlete_id) 
REFERENCES [dbo].[Athlete] (id);

ALTER TABLE [dbo].[Result] 
ADD CONSTRAINT FK_Result_CountryYear_Olympics FOREIGN KEY (CountryYear_Olympics) 
REFERENCES [dbo].[CountryYear] (id);

ALTER TABLE [dbo].[Result] 
ADD CONSTRAINT FK_Result_Event FOREIGN KEY (Event_id) 
REFERENCES [dbo].[Event] (id);

ALTER TABLE [dbo].[Result] 
ADD CONSTRAINT FK_Result_Medal FOREIGN KEY (Medal_id) 
REFERENCES [dbo].[Medal] (id);

ALTER TABLE [dbo].[Result] 
ADD CONSTRAINT FK_Result_Placement FOREIGN KEY (Placement_id) 
REFERENCES [dbo].[Placement] (id);
