/* Does the result from the previous exercise change if you used the Common Table Expression (CTE) 
for the male employees' highest salaries in a FROM clause, as opposed to in a join?

Answer : NO , no change in results 
Project by : Jewel Alam*/ 

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
from  
cte2 c2 
join cte1 c1;