/* Use two common table expressions and a COUNT() function in the SELECT statement of a
 query to obtain the number of male employees whose highest salaries have been below the all-time average.
 Project by: Jewel Alam */

 with cte1 as 
(select avg(salary)as avg_salary from salaries),
cte2 as 
( select s.emp_no,max(s.salary) as max_salary 
from 
salaries s 
join
employees e on e.emp_no=s.emp_no
and
e.gender='m' 
group by s.emp_no)
select 
count(case when c2.max_salary<c1.avg_salary then c2.max_salary else null end)
as max_salary
from employees e 
join cte2 c2 on c2.emp_no=e.emp_no
join cte1 c1;