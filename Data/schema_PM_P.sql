-- Create tables for each data set
CREATE TABLE y2021_covid_data (
    FIPS integer,
    Admin2 text,
    Province_State text,
    Country_Region text,
    Last_Update timestamp,
    Lat float,
    Long_ float,
    Confirmed integer,
    Deaths integer,
    Recovered integer,
    Active integer,
    Combined_Key text,
    Incident_Rate float,
    Case_Fatality_Ratio float
);

CREATE TABLE y2022_covid_data (
    FIPS integer,
    Admin2 text,
    Province_State text,
    Country_Region text,
    Last_Update timestamp,
    Lat float,
    Long_ float,
    Confirmed integer,
    Deaths integer,
    Recovered integer,
    Active integer,
    Combined_Key text,
    Incident_Rate float,
    Case_Fatality_Ratio float
);

CREATE TABLE y2023_covid_data (
    FIPS integer,
    Admin2 text,
    Province_State text,
    Country_Region text,
    Last_Update timestamp,
    Lat float,
    Long_ float,
    Confirmed integer,
    Deaths integer,
    Recovered integer,
    Active integer,
    Combined_Key text,
    Incident_Rate float,
    Case_Fatality_Ratio float
);

--List the sum of confirmed cases, sum of deaths, and average of case fataility ratio for each state for each year
SELECT 
    Province_State,
    SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fataility_ratio
FROM y2021_covid_data 
WHERE Province_State IN ('Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming', 'Alaska', 'California', 'Hawaii', 'Oregon', 'Washington')
GROUP BY Province_State;

SELECT 
    Province_State,
    SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fataility_ratio
FROM y2022_covid_data 
WHERE Province_State IN ('Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming', 'Alaska', 'California', 'Hawaii', 'Oregon', 'Washington')
GROUP BY Province_State;

SELECT 
    Province_State,
    SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS case_fataility_ratio
FROM y2023_covid_data 
WHERE Province_State IN ('Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming', 'Alaska', 'California', 'Hawaii', 'Oregon', 'Washington')
GROUP BY Province_State;

--Group states in regions and list the sum of confirmed cases, sum of deaths, and average of case fataility ratio for each region for each year
SELECT 
    CASE
        WHEN Province_State IN ('Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming') THEN 'Rocky Mountain'
        WHEN Province_State IN ('Alaska', 'California', 'Hawaii', 'Oregon', 'Washington') THEN 'Pacific'
    END AS region,
    SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS avg_case_fatality_ratio
FROM y2021_covid_data
WHERE Province_State IN (
    'Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming', 
    'Alaska', 'California', 'Hawaii', 'Oregon', 'Washington'
)
GROUP BY region;

SELECT 
    CASE
        WHEN Province_State IN ('Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming') THEN 'Rocky Mountain'
        WHEN Province_State IN ('Alaska', 'California', 'Hawaii', 'Oregon', 'Washington') THEN 'Pacific'
    END AS region,
    SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS avg_case_fatality_ratio
FROM y2022_covid_data
WHERE Province_State IN (
    'Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming', 
    'Alaska', 'California', 'Hawaii', 'Oregon', 'Washington'
)
GROUP BY region;

SELECT 
    CASE
        WHEN Province_State IN ('Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming') THEN 'Rocky Mountain'
        WHEN Province_State IN ('Alaska', 'California', 'Hawaii', 'Oregon', 'Washington') THEN 'Pacific'
    END AS region,
    SUM(Confirmed) AS confirmed, 
    SUM(Deaths) AS deaths, 
    AVG(Case_Fatality_Ratio) AS avg_case_fatality_ratio
FROM y2023_covid_data
WHERE Province_State IN (
    'Colorado', 'Idaho', 'Montana', 'Nevada', 'Utah', 'Wyoming', 
    'Alaska', 'California', 'Hawaii', 'Oregon', 'Washington'
)
GROUP BY region;

