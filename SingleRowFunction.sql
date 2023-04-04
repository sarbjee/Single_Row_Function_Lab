rem Lab Unit 10-11 Simple SELECT and Sorting 
set echo on
set linesize 120
set pagesize 66
spool C:\cprg250s\Single_Row_Function_Lab\unit13LabOutput.txt

rem Q1 - basic select columns with headers

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

rem Q2 

rem insert solution here!

rem Q3 

rem insert solution here!

rem Q4 

rem insert solution here!

rem Q5 

rem insert solution here!

spool off

