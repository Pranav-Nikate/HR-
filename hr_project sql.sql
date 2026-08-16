CREATE DATABASE HR_DB;
USE hr_db;
select * from hr_emp;
-- How many total employees are there?
select count(employee_id) as  Total_Employee from hr_emp;

-- What is the gender distribution of employees?
select Gender , count(employee_id) as Total_Number from hr_emp
group by gender;

-- How many employees are in each department?
select department , count(employee_id) from hr_emp group by department;

-- What is the average age of employees?
select round(avg(age)) as Average_Age from hr_emp;

-- What is the average experience of employees?
select  round(avg(experience_years)) as average_experience from hr_emp;
---- Department Analysis

-- Which department has the highest number of employees?
select department , count(employee_id) highest_number from hr_emp 
group by department
order by highest_number desc limit 5;

-- Which department has the highest average salary?
select department , round(avg(salary)) as Average_Salary from hr_emp
group by department
order by Average_Salary desc;

-- Compare average performance rating by department.
select department , truncate(avg(performance_rating),1) as average_performance_rating from hr_emp
group by department
order by average_performance_rating desc;

-- Which department has the highest attrition rate?
select department , count(*) as Total_Emp, sum(case when attrition_status = 'yes' then 1 else 0 end) as attrition_count,
round((sum(case when attrition_status = 'yes' then 1 else 0 end) * 100.0 / count(*))) as attrition_rate
from hr_emp
group by department
order by attrition_rate;

-- Find the top 5 departments with the most experienced employees.
select department , round(avg(experience_years),1) as most_experienced from hr_emp
group by department 
order by most_experienced desc
limit 5;

---- 3. Salary Analysis

-- What is the average salary by department?
select department , round(avg(salary)) as Average_Salary from hr_emp
group by department 
order by Average_Salary desc
limit 5;

-- Who are the top 10 highest-paid employees?
select employee_name , max(salary) as highest_paid from hr_emp 
group by  employee_name
order by highest_paid desc;

-- What is the salary range in each department?
select department , min(salary) as minimum_salalry , max(salary) maximum_salary
from hr_emp
group by department;

-- Does higher experience lead to higher salary?
select experience_years , round(avg(salary)) as average_salary
from hr_emp
group by experience_years
order by experience_years;

-- Find employees earning above the company average salary.
select employee_id , employee_name , salary , department from hr_emp
where salary > (select avg(salary) from hr_emp) 
order by salary desc;

---- 4. Performance Analysis

-- What is the average performance rating?
select round(avg(performance_rating),1) as Average_Rating from hr_emp;

-- Which employees have the highest performance rating?
select	employee_id , employee_name , round(max(performance_rating),1) 
as highest_performance_rating 
from hr_emp
group by employee_id , employee_name
order by highest_performance_rating desc;

-- Which department has the best performance?
select department , round(avg(performance_rating),2) as best_performance
from hr_emp
group by department
order by best_performance desc;

-- Compare salary with performance rating.
select performance_rating , round(avg(salary)) as Salary from hr_emp
group by performance_rating
order by performance_rating;

-- Find high performers with low salary (promotion opportunities).
select employee_id , employee_name , department , performance_rating , salary from hr_emp
where performance_rating >=4 and salary > ( select avg(salary) from hr_emp)
order by performance_rating desc;

---- 5. Attrition Analysis

-- What is the total attrition count?
select count(attrition_status) as Total_attrition from hr_emp;

-- What percentage of employees left the company?
select  round((sum(case when attrition_status = 'no' then 1 else 0 end) * 100 / count(*)),2) 
as percentage_of_employees_left   from hr_emp;

-- Which department has the highest attrition?
select department , sum(case when attrition_status = 'yes' then 1 else 0 end)  as Total_attrition from hr_emp
group by department
order by Total_attrition desc
limit 1;

-- Is attrition higher among low-experience employees?
select experience_years  , count(*) as Total_Employee , 
round(sum(case when attrition_status = 'yes' then 1 else 0 end) * 100 / count(*)) as attrition_rates
from hr_emp
group by experience_years
order by attrition_rates desc;

-- Does salary affect employee attrition?
select attrition_status ,
 round(avg(salary)) as Average_salary ,
 count(*) as Total_emp
from hr_emp
group by attrition_status;

-- Compare attrition by work mode (Remote/Office/Hybrid).

select work_mode ,count(*) as Total_employee,  
sum(case when attrition_status = 'yes' then 1 else 0 end) as attrition_count ,
round(sum(case when attrition_status = 'yes' then 1 else 0 end) * 100 / count(*),1) as attrition_rates
from hr_emp
group by work_mode
order by attrition_count desc;

---- 6. Experience & Career Growth

-- Average experience by job role.
select job_role , round(avg(experience_years),1) as Average_experience from hr_emp
group by job_role
order by Average_experience desc;

-- Which job role has the highest salary?
select job_role , max(salary) as highest_salary from hr_emp
group by job_role
order by highest_salary desc;

-- Which job role has the highest performance rating?
select job_role , round(max(performance_rating),5) as highest_rating from hr_emp
group by job_role
order by highest_rating desc;

-- How many employees got promotions?
select sum(case when Promotion_status = 'yes' then 1 else 0 end)
 as Promotion_Got
 from hr_emp;
 
 -- Are promoted employees having better performance?
 select promotion_status , round(avg(performance_rating),3) as better_performance from hr_emp
 group by promotion_status
 order by better_performance desc;
 
 ---- 7. Attendance Analysis

 -- Average attendance percentage by department.
 select department , round(avg(attendance_percentage),2)
 as average_attendance_percentage
 from hr_emp
 group by department
 order by average_attendance_percentage desc;
 
 -- Find employees with attendance below 75%.
 select * from hr_emp
 where attendance_percentage < 75 
 order by attendance_percentage asc;
 
 -- Does attendance impact performance rating?
 select 
 case when attendance_percentage < 75 then 'below 75%'
 when attendance_percentage between 75 and 90 then '75% -90%'
 else 'above 90%' end as attendance_group ,
 round(avg(performance_rating),2) as average_performance
 from hr_emp
 group by attendance_group;
 
 -- Compare attendance between employees who left and stayed.
 select attrition_status , round(avg(attendance_percentage),2) as Average_attendance from hr_emp
 group by attrition_status
 order by Average_attendance desc;
 
 ---- 8. Training Analysis

 -- Average training hours by department.
 select department , round(avg(training_hours),2) as Average_Training_hours from hr_emp
 group by department
 order by Average_Training_hours desc;
 
 -- Does training improve performance rating?
 select case 
 when training_hours < 20 then 'below 20 hours'
 when training_hours between 20 and 40 then '20 -40 hours' 
 else 'above 40 hours' end as training_group ,
 round(avg(performance_rating),2) as average_performance
 from hr_emp
 group by training_group
 order by average_performance desc;

 -- Find employees with high training hours but low performance.
 select employee_id , employee_name , department , training_hours ,performance_rating 
 from hr_emp
 where training_hours > (select avg(training_hours) from hr_emp) 
 and
 performance_rating < ( select avg(performance_rating) from hr_emp)
 order by training_hours desc;
 
 -- Which job role receives the most training?
 select job_role , max(training_hours) as highest_training_hours
 from hr_emp
 group by job_role
 order by highest_training_hours desc;
 
---- 9. Location & Work Mode Analysis

-- Employee count by location.
select
location , count(*) as Total_Employee
from hr_emp
group by location
order by Total_Employee desc;

-- Which location has the highest salary?
select location , round(avg(salary))
 as highest_salary
from hr_emp
group by location
order by highest_salary desc;

-- Compare performance by work mode.
select work_mode , round(avg(performance_rating),2) as average_performance  from hr_emp
group by work_mode
order by average_performance desc;

-- Which work mode has the lowest attrition?
select work_mode , sum(case when attrition_status = 'yes' then 1 else 0 end) as total_attrition
from hr_emp group by work_mode
order by total_attrition asc
limit 1;

---- Advanced SQL Questions

-- Rank employees by salary within each department.
select employee_id , employee_name , department , salary,
rank() over (partition by department order by salary desc) as salary_rank
 from hr_emp;
 
 -- Find the second highest salary in each department.
 select department , employee_id , employee_name , salary
 from ( select department , employee_id , employee_name , salary , dense_rank() 
 over ( partition by department order by salary desc) as salary_rank
 from hr_emp)
 as ranked
 where salary_rank = 2;
 
 -- Find top 3 performers in each department.
 select department , employee_id , employee_name , performance_rating
 from ( select department , employee_id , employee_name , performance_rating , dense_rank() 
 over ( partition by department order by performance_rating desc) as performance_rank
 from hr_emp) as ranked
 where performance_rank <=3
 order by department ,
 performance_rank;
 
 -- Calculate department-wise attrition percentage.
 select department , count(*) as Total_Employees , sum(case when attrition_status = 'yes' then 1 else 0 end) as attrition_count , 
 round(sum(case when attrition_status = 'yes' then 1 else 0 end) * 100 / count(*),2) as attrition_percentage from hr_emp
 group by department
 order by attrition_percentage desc;
 
 -- Find employees who joined in the last 2 years.
 select employee_id , employee_name , department , joining_date from hr_emp
 where joining_date >= date_sub(curdate(), interval 2 year);
 
 -- Create an employee risk score for attrition prediction.
 select 
 employee_id , employee_name , department , case when attrition_status = 'yes' then 'high risk' 
 when performance_rating < 3 and attendance_percentage < 75 then 'medium risk' 
 else 'low risk' end as risk_level
 from hr_emp;