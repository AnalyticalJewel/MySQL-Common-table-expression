/* Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees
 have never signed a contract with a salary value higher than or equal to the all-time company salary average 
 (i.e. to obtain the same result as in the previous exercise). */ 


select 
sum( case when s.salary<a.avg_salary then 1 else 0 end ) as Number_of_salaries_below_average,
count(s.salary) as no_of_contracts 
from 
(select avg(salary) as avg_salary from salaries  s)as a 
join salaries s join employees e on e.emp_no=s.emp_no and e.gender ="m";