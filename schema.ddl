drop schema if exists projectschema cascade;
create schema projectschema;
set search_path to projectschema;

--Neighbourhood robbery rate
--name is the neighbourhood's name, Hood_ID is a numerical identifier for the
--neighbourhood. population is the projected number of people living in a
--neighbourhood in 2020, robberies_20xx is the number of robberies that took
--place in that neighbourhood in the 20xx year.
CREATE TABLE Neighbourhood (
	name TEXT NOT NULL,
	Hood_ID INT NOT NULL,
	population INT NOT NULL,
	robberies_2014 INT NOT NULL,
	robberies_2016 INT NOT NULL,
	robberies_2018 INT NOT NULL,
	robberies_2020 INT NOT NULL,
	PRIMARY KEY (Hood_ID)
);

--Neighbourhoods ranked by their equity score.
--rank is the neighbourhood's rank sorted by lowest to highest
--equity score, name is the neighbourhood's name, and score
--is the equity score of a neighbourhood (which roughly translates
--to how well off a neighbourhood is)
CREATE TABLE EquityScore (
	rank INT NOT NULL,
	name TEXT NOT NULL,
	score FLOAT NOT NULL,
	PRIMARY KEY (rank, name)
);

--Table of crimes that took place in Toronto
--Index is the identifier for an occurrence of a crime,
--Event_ID represents the event that the occurrence belongs to,
--ODate is the timestamp of when the crime event occurred,
--Premise is the setting that the crime took place in,
--OHour is the hour of the day the crime took place,
--Crime is the category of crime that took place,
--Hood_ID is a numerical identifier for the neighbourhood
CREATE TABLE CrimeIndicator (
	Index INT NOT NULL,
	Event_ID TEXT NOT NULL,
	ODate TIMESTAMP NOT NULL,
	Premise TEXT NOT NULL,
	OHour INT NOT NULL,
	Crime TEXT NOT NULL,
	Hood_ID INT,
	PRIMARY KEY (Index),
	FOREIGN KEY (Hood_ID) REFERENCES Neighbourhood(Hood_ID)
);

--Table of shootings that took place in Toronto
--Index is the identifier for an occurrence of a crime,
--Event_ID represents the event that the occurrence belongs to,
--ODate is the timestamp of when the crime event occurred,
--OHour is the hour of the day the crime took place,
--OTime_Range is whether the crime took place in the morning, evening, etc,
--Hood_ID is a numerical identifier for the neighbourhood
CREATE TABLE Shootings (
	Index INT NOT NULL,
	Event_ID TEXT NOT NULL,
	ODate TIMESTAMP NOT NULL,
	OHour INT NOT NULL,
	OTime_Range TEXT NOT NULL,
	Hood_ID INT,
	PRIMARY KEY (Index),
	FOREIGN KEY (Hood_ID) REFERENCES Neighbourhood(Hood_ID)
);