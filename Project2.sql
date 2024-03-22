/* Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement 
of a query to find out how many male employees have never signed a contract with a salary value higher 
than or equal to the all-time company salary average. 
Project by : Jewel Alam*/

with cte as 
( select avg(salary) as avg_salary from salaries)
select 
count(case when s.salary <c.avg_salary then s.salary else 0 end) as salaries_below_avg,
count(s.salary) as no_of_contracts
from salaries s join employees e on s.emp_no=e.emp_no 
and e.gender ='m' join cte c;