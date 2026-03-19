CREATE TABLE hrdata(
emp_no INT PRIMARY KEY ,
gender VARCHAR(50) NOT NULL ,
marital_status VARCHAR(80)  ,
age_band VARCHAR(50) ,
age	INT ,
department VARCHAR(50),
education VARCHAR(50),
education_field VARCHAR(50),
job_role VARCHAR(50),
business_travel VARCHAR(50),
employee_count INT , 
attrition VARCHAR(50), 
attrition_label VARCHAR(50),
job_satisfaction INT ,
active_employee INT 
)

select * from hrdata


select sum(employee_count) as employee_count from hrdata
--where education = 'High School'
--where department='Sales' 
--where department ='R&D'
where education_field='Medical'


select count(attrition) from hrdata
where attrition='Yes' and department ='R&D' and education_field ='Medical'

select round(((select count(attrition)from hrdata where attrition ='Yes' and department = 'Sales')/
sum(employee_count))*100,2) from hrdata

select sum(employee_count) - (select count (attrition) from hrdata where attrition='Yes' and gender='Male')
from hrdata where gender='Male'


select round(avg(age),0) as avg_age from hrdata


select gender, count(attrition) from hrdata
where attrition='Yes' and education='High School'
group by gender
order by count(attrition) desc


select department , count(attrition),
round((cast (count(attrition) as numeric )
/(select count(attrition) from hrdata where attrition='Yes' and gender='Female'))*100,2) AS pct
from hrdata
where attrition='Yes' and gender='Female'
group by department 
order by count(attrition) desc



select age, sum(employee_count) from hrdata
where department='R&D'
group by age 
order by age  

select education_field , count(attrition) from hrdata
where attrition='Yes' and department='Sales'
group by education_field
order by count(attrition)desc


select age_band, gender,count(attrition) from hrdata
where attrition='Yes'
group by age_band,gender
order by age_band,gender



select age_band, gender,count(attrition),
round(cast(count(attrition)as numeric)/(select count(attrition) from hrdata where attrition='Yes')*100,2) as pct
from hrdata
where attrition='Yes'
group by age_band,gender
order by age_band,gender



select * from crosstab (
'select job_role,job_satisfaction,sum(employee_count) from hrdata
group by job_role,job_satifaction
order by job_role,job_satifaction'
)as ct (job_role varchar(50),one numeric,two numeric , three numeric , four numeric )
order by job_role;


create extension if not exists tablefunc;



select age_band, gender, sum(employee_count) from hrdata
group by age_band,gender
order by age_band,gender desc 












































