-- Lab Unit 14 Single Row Functions 
set echo on
set linesize 120
set pagesize 66
spool C:\cprg250s\Single_Row_Function_Lab\unit13LabOutput.txt

-- Q1 - basic select columns with headers

column "Desc" format a20
column "Start Date" format a20
column "Dest desc" format a20
column "Duration" format a10
break on "Desc" on "Start Date" on "Duration"
select tour_description as "Desc",to_char(start_date,'fmMonthdd, yyyy') as "Start Date",concat(end_date-start_date,' Days')as "Duration" ,order# as "Num",substr(dest_description,1,15) "Dest desc",to_char(price,'$9,990.00') as "Price"
FROM rcv_customer join rcv_tour_customer using (customer_number)  
   join rcv_vacation_tour using (tour_code) 
   join rcv_tour_destination using (tour_code) 
   join rcv_destination using (dest_code) 
where first_name='Amy' and last_name='Folwer'
order by 1,4,5; 
clear breaks
clear columns

-- Q2 - All destination tours outside of Canada and United States, price converted to a number of dollar signs

column "Desc" format a40
column "Country" format a20
column "Cost" format a5
column "City" format a20
select dest_description  "Desc", 
   rpad('$', price / 100 + 2 , '$') "Cost", 
   upper(country) "Country", city "City"
from rcv_destination
where country not in 'Canada' and country not in 'United States'
order by 3, 4, 2;
clear columns

-- Q3 

column "Desc" format a80
column "Country" format a20
select dest_description "Desc", replace(country, 'United States', 'USA') "Country", nvl(state, 'NA') "State"
from rcv_destination
where dest_description like '%Cook%'or dest_description like '%Wine%'or dest_description like '%Dinner%'
order by 2, 1;

spool off

