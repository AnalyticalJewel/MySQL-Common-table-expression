/* Use a cross join in a query to find out how many male employees have never signed a contract with a
 salary value higher than or equal to the all-time company salary average (i.e. to obtain the same result
  as in the previous exercise).*/

with cte as( select avg(salary) as avg_salary from salaries)
select 
sum(case when s.salary<c.avg_salary then 1 else 0 end) as number_of_employees_signed_contract_lower_than_average,
count(s.salary) as total_contracts
from
employees e join salaries s on e.emp_no=s.emp_no and e.gender='m'
cross join cte c;