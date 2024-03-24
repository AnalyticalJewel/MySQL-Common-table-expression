/* how many female employees highest contact salary values were higher than the all time company salary average (across all gender).
Task By : Jewel Alam*/

with cte1 as (
select avg(salary) as Avg_salary from salaries),
cte2 as
(select s.emp_no,max(s.salary) as highest_salary from employees e join salaries s on e.emp_no=s.salary
and e.gender='f'
group by s.emp_no) 
select 
sum( case when c2.highest_salary>c1.Avg_salary then 1 else 0 end) as highest_salary_above_average,
count(c2.emp_no)as total_no_female_contract
from cte2 c2 cross join cte1 c1;
