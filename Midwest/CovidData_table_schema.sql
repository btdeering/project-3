-- Drop the table if created
DROP TABLE covid_data_2021;
DROP TABLE covid_data_2022;
DROP TABLE covid_data_2023;

DROP TABLE midWest_2021;
DROP TABLE midWest_2022;
DROP TABLE midWest_2023;

-- Create table for covid data 2021
CREATE TABLE covid_data_2021
( FIPS varchar,
 Admin2 varchar,
 Province_State varchar,
 country_region varchar,
 last_update date,
 lat varchar,
 long_ varchar,
 confirmed int,
 deaths int,
 recovered int,
 active int,
 combined_key varchar,
 incident_rate varchar,
 case_fatality_ratio float
);

-- Create table for covid data 2022
CREATE TABLE covid_data_2022
( FIPS varchar,
 Admin2 varchar,
 Province_State varchar,
 country_region varchar,
 last_update date,
 lat varchar,
 long_ varchar,
 confirmed int,
 deaths int,
 recovered int,
 active int,
 combined_key varchar,
 incident_rate varchar,
 case_fatality_ratio float
);

-- Create table for covid data 2023
CREATE TABLE covid_data_2023
( FIPS varchar,
 Admin2 varchar,
 Province_State varchar,
 country_region varchar,
 last_update date,
 lat varchar,
 long_ varchar,
 confirmed int,
 deaths int,
 recovered int,
 active int,
 combined_key varchar,
 incident_rate varchar,
 case_fatality_ratio float
);

SELECT * FROM covid_data_2021;
SELECT * FROM covid_data_2022;
SELECT * FROM covid_data_2023;

--- Create tabels for Mid-West Region  and get state total and regional total---

-- Midwest_2021
CREATE TABLE midWest_2021 AS 
SELECT * FROM covid_data_2021
WHERE country_region = 'US' AND (Province_State = 'Illinois' OR
								 Province_State = 'Michigan' OR
								 Province_State = 'Ohio' OR
								 Province_State = 'Wisconsin' OR
								 Province_State = 'Iowa' OR
								 Province_State = 'Kansas' OR
								 Province_State = 'Minnesota' OR
								 Province_State = 'Missouri' OR
								 Province_State = 'Nebraska' OR
								 Province_State = 'North Dakota' OR
								 Province_State = 'South Dakota' OR
								 Province_State = 'Indiana' 								 
								);


-- Query to find out unassigned area for case_fatality_ration
select * from midWest_2021
where admin2 = 'Unassigned';

-- Query to delete outliers
DELETE FROM midWest_2021
WHERE admin2 = 'Unassigned';

SELECT * FROM midWest_2021;


-- get state totals for 2021
SELECT province_state,
	SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fataility_ratio
FROM midWest_2021
GROUP BY province_state;

-- get region totals for 2021
SELECT 
    CASE
        WHEN Province_State IN (SELECT province_state FROM midWest_2021)
		THEN 'Mid West'        
    END AS region,
	SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fatality_ratio
FROM midWest_2021
GROUP BY region;

-- Midwest_2022
CREATE TABLE midWest_2022 AS 
SELECT * FROM covid_data_2022
WHERE country_region = 'US' AND (Province_State = 'Illinois' OR
								 Province_State = 'Michigan' OR
								 Province_State = 'Ohio' OR
								 Province_State = 'Wisconsin' OR
								 Province_State = 'Iowa' OR
								 Province_State = 'Kansas' OR
								 Province_State = 'Minnesota' OR
								 Province_State = 'Missouri' OR
								 Province_State = 'Nebraska' OR
								 Province_State = 'North Dakota' OR
								 Province_State = 'South Dakota' OR
								 Province_State = 'Indiana' 								 
								);
-- Query to find out unassigned area for case_fatality_ration
select * from midWest_2022
where admin2 = 'Unassigned';

-- Query to delete outliers
DELETE FROM midWest_2022
WHERE admin2 = 'Unassigned';

SELECT * FROM midWest_2022;

-- get state totals for 2022
SELECT province_state,
	SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fataility_ratio
FROM midWest_2022
GROUP BY province_state;

-- get region totals for 2022
SELECT 
    CASE
        WHEN Province_State IN (SELECT province_state FROM midWest_2022)
		THEN 'Mid West'        
    END AS region,
	SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fatality_ratio
FROM midWest_2022
GROUP BY region;

-- Midwest_2023
CREATE TABLE midWest_2023 AS 
SELECT * FROM covid_data_2023
WHERE country_region = 'US' AND (Province_State = 'Illinois' OR
								 Province_State = 'Michigan' OR
								 Province_State = 'Ohio' OR
								 Province_State = 'Wisconsin' OR
								 Province_State = 'Iowa' OR
								 Province_State = 'Kansas' OR
								 Province_State = 'Minnesota' OR
								 Province_State = 'Missouri' OR
								 Province_State = 'Nebraska' OR
								 Province_State = 'North Dakota' OR
								 Province_State = 'South Dakota' OR
								 Province_State = 'Indiana' 								 
								);
-- Query to find out unassigned area for case_fatality_ration
select * from midWest_2022
where admin2 = 'Unassigned';

-- Query to delete outliers
DELETE FROM midWest_2022
WHERE admin2 = 'Unassigned';

SELECT * FROM midWest_2022;

-- get state totals for 2023
SELECT province_state,
	SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fataility_ratio
FROM midWest_2023
GROUP BY province_state;

-- get region totals for 2023

SELECT 
    CASE
        WHEN Province_State IN (SELECT province_state FROM midWest_2023)
		THEN 'Mid West'        
    END AS region,
	SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fatality_ratio
FROM midWest_2023
GROUP BY region;


