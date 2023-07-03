select * from northeast_21

-- get state totals for 2021
select province_state, sum(confirmed), sum(deaths), avg(case_fatality_ratio)
from northeast_21
group by province_state

-- get state totals for 2022
select province_state, sum(confirmed), sum(deaths), avg(case_fatality_ratio)
from northeast_22
group by province_state

-- get state totals for 2023
select province_state, sum(confirmed), sum(deaths), avg(case_fatality_ratio)
from northeast_23
group by province_state

-- get region totals for 2021
select sum(confirmed), sum(deaths), avg(case_fatality_ratio)
from northeast_21;

-- get region totals for 2022
select sum(confirmed), sum(deaths), avg(case_fatality_ratio)
from northeast_22;

-- get region totals for 2023
select sum(confirmed), sum(deaths), avg(case_fatality_ratio)
from northeast_23;
