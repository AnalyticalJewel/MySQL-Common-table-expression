/* Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain
 the number of male employees whose highest salaries have been below the all-time average.
 Project by: Jewel Alam*/ 

with cte1 as
( select avg(salary)
as avg_salary from
salaries),
cte2 as 
( select s.emp_no,max(s.salary)as max_salary 
from salaries s 
join 
employees e on e.emp_no=s.emp_no
and e.gender='m'
group by s.emp_no)
select sum(case when 
c2.max_salary<c1.avg_salary then 1 else 0 end) 
as highest_male_salaries_below_average,
count(s.salary) as total_salary_of_males
from 
employees e join salaries s on e.emp_no=s.emp_no
join cte2 c2 on c2.emp_no=e.emp_no 
join cte1 c1 where e.gender='m';