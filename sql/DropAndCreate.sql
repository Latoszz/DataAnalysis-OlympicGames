--Staging Tables

DROP TABLE IF EXISTS [dbo].[ResultSt];
DROP TABLE IF EXISTS [dbo].[AthleteSt]; 
DROP TABLE IF EXISTS [dbo].[CountryYearSt];
DROP TABLE IF EXISTS [dbo].[EventSt];
DROP TABLE IF EXISTS [dbo].[MedalSt];
DROP TABLE IF EXISTS [dbo].[PlacementSt];


CREATE TABLE [dbo].[AthleteSt](
	[idT] [int] NOT NULL,
	[name] [nvarchar](255),
	[height] [decimal](16, 2) NULL,
	[weight] [decimal](16, 2) NULL,
	[dateborn] [date] NULL,
	[datedied] [date] NULL,
	[country] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[NOC] [nvarchar](255) NULL,
);


CREATE TABLE [dbo].[CountryYearSt](
	[idT] [int] NOT NULL  IDENTITY (1,1) ,
	[year] [int] NULL,
	[NOC] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[region] [nvarchar](max) NULL,
);

CREATE TABLE [dbo].[EventSt](
	[idT] [int] NOT NULL IDENTITY (1,1),
	[name] [nvarchar](max) NULL,
	[gender] [nvarchar](max) NULL,
	[discipline] [nvarchar](max) NULL,
);

CREATE TABLE [dbo].[MedalSt](
	[idT] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
);

CREATE TABLE [dbo].[PlacementSt](
	[idT] [int] NOT NULL,
	[number] [int] NULL,
);

CREATE TABLE [dbo].[ResultSt](
   CountryYear_AthleteT int  NOT NULL,
   Athlete_idT int NOT NULL,
   CountryYear_OlympicsT int NOT NULL,
   Event_idT int NOT NULL,
   Medal_idT int NOT NULL,
   Placement_idT int NOT NULL,
);

ALTER TABLE [dbo].[AthleteSt] ADD CONSTRAINT PK_AthleteSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[CountryYearSt] ADD CONSTRAINT PK_CountryYearSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[EventSt] ADD CONSTRAINT PK_EventSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[MedalSt] ADD CONSTRAINT PK_MedalSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[PlacementSt] ADD CONSTRAINT PK_PlacementSt PRIMARY KEY (idT);

ALTER TABLE [dbo].[ResultSt] ADD CONSTRAINT PK_ResultSt PRIMARY KEY (CountryYear_AthleteT, Athlete_idT,CountryYear_OlympicsT,Event_idT,Medal_idT,Placement_idT);

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
	[name] [nvarchar](255) NOT NULL,
	[height] [decimal](16, 2) NOT NULL,
	[weight] [decimal](16, 2) NOT NULL,
	[dateborn] [date] NULL,
	[datedied] [date] NULL,
	[country] [nvarchar](255) NOT NULL,
	[gender] [nvarchar](255) NULL,
	[NOC] [nvarchar](255) NOT NULL,
);


CREATE TABLE [dbo].[CountryYear](
	[id] [int] NOT NULL,
	[year] [int] NOT NULL,
	[NOC] [nvarchar](max) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[region] [nvarchar](max) NOT NULL,
);

CREATE TABLE [dbo].[Event](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[gender] [nvarchar](max) NOT NULL,
	[discipline] [nvarchar](max) NOT NULL,
);

CREATE TABLE [dbo].[Medal](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
);

CREATE TABLE [dbo].[Placement](
	[id] [int] NOT NULL,
	[number] [int] NULL,
);

CREATE TABLE [dbo].[Result](
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

ALTER TABLE [dbo].[Result] ADD CONSTRAINT PK_Result PRIMARY KEY (CountryYear_Athlete, Athlete_id,CountryYear_Olympics,Event_id,Medal_id,Placement_id);


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
