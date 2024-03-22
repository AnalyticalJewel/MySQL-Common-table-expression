/* Exercise #1: Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to find out how many male
 employees have never signed a contract with a salary value higher than or equal to the all-time company salary average. */ 

with cte as 
(select avg(salary) as avg_salary from salaries)
select
 sum(case when s.salary < c.avg_salary then 1 else 0 end ) as no_salaries_below_avg,
count(s.salary) as no_of_salary_contracts 
from salaries s join employees e on s.emp_no=e.emp_no
and e.gender='M' join cte c; 