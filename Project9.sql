/* Retrieve the highest contract salary values of all employees hired in 2000 or later
Task by: Jewel Alam */

With cte1 as (
select * from employees 
where hire_date>'2000-01-01'),
cte2 as (
select c1.emp_no, max(s.salary) from 
salaries s join cte1 c1 on c1.emp_no=s.emp_no
group by c1.emp_no)
select * from cte2;