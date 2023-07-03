
-- create 2021 table
create table COVID_21
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
 case_fatality_ratio decimal
);
-- check table was created
select * from covid_21

-- create 2021 table
create table COVID_22
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
 case_fatality_ratio decimal
);
-- check table was created
select * from covid_22

-- create 2023 table
create table COVID_23
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
 case_fatality_ratio decimal
);
-- check table was created
select * from covid_23

-- creating tables for only US data for 2021
select * from covid_21

alter table covid_21
drop column fips;
alter table covid_21
drop column admin2;

create table covid_21_US
as select
*
from covid_21
where country_region = 'US';

select * from covid_21_US

-- creating table for only US data for 2022
select * from covid_22

alter table covid_22
drop column fips;
alter table covid_22
drop column admin2;

create table covid_22_US
as select
*
from covid_22
where country_region = 'US';

select * from covid_22_US

-- creating table for only US data for 2023
select * from covid_23

alter table covid_23
drop column fips;
alter table covid_23
drop column admin2;

create table covid_23_US
as select
*
from covid_23
where country_region = 'US';

select * from covid_23_US

-- drop old tables
drop table covid_21;
drop table covid_22;
drop table covid_23;

-- create table for northeast states for 2021
create table northeast_21
as select * from covid_21_us
where province_state = 'Massachusetts' 
OR province_state ='Maine' 
OR province_state ='New Hampshire' 
OR province_state ='New Jersey' 
OR province_state ='Maryland' 
OR province_state ='Virginia' 
OR province_state ='Conneticut' 
OR province_state ='Pennslyvania' 
OR province_state ='Vermont' 
OR province_state = 'New York' 
OR province_state ='Rhode Island' 
OR province_state ='Delaware';

-- create table for northeast states for 2022
create table northeast_22
as select * from covid_22_us
where province_state = 'Massachusetts' 
OR province_state ='Maine' 
OR province_state ='New Hampshire' 
OR province_state ='New Jersey' 
OR province_state ='Maryland' 
OR province_state ='Virginia' 
OR province_state ='Conneticut' 
OR province_state ='Pennslyvania' 
OR province_state ='Vermont' 
OR province_state = 'New York' 
OR province_state ='Rhode Island' 
OR province_state ='Delaware';

-- create table for northeast states 2023
create table northeast_23
as select * from covid_23_us
where province_state = 'Massachusetts' 
OR province_state ='Maine' 
OR province_state ='New Hampshire' 
OR province_state ='New Jersey' 
OR province_state ='Maryland' 
OR province_state ='Virginia' 
OR province_state ='Conneticut' 
OR province_state ='Pennslyvania' 
OR province_state ='Vermont' 
OR province_state = 'New York' 
OR province_state ='Rhode Island' 
OR province_state ='Delaware';

-- puerto rico data for each year
create table PR_21
as select * from covid_21_us
where province_state = 'Puerto Rico';

create table PR_22
as select * from covid_22_us
where province_state = 'Puerto Rico'; 

create table PR_23
as select * from covid_23_us
where province_state = 'Puerto Rico';
select * from PR_23