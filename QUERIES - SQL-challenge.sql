--
--  SQL-challenge QUERIES     Tim Gannaway
--

elect employees.emp_no, last_name, first_name, sex, salaries.salary
from employees
inner join salaries on salaries.emp_no = employees.emp_no
-- limit 5

select first_name, last_name, hire_date
from employees
where DATE_PART('year',hire_date) = 1986
-- limit 5

select de.dept_no, dept_name, de.emp_no, last_name, first_name
from  dept_emp de
inner join departments d on de.dept_no = d.dept_no
inner join employees e on de.dept_no = d.dept_no
-- limit 5

select de.emp_no, last_name, first_name, dept_name
from  dept_emp de
inner join departments d on de.dept_no = d.dept_no
inner join employees e on de.dept_no = d.dept_no
--limit 5

select first_name, last_name, sex
from  employees 
where first_name = 'Hercules' and left(last_name,1) = 'B'
--limit 5

select de.emp_no, last_name, first_name, dept_name
from  dept_emp de
inner join departments d on de.dept_no = d.dept_no and d.dept_name = 'Sales'
inner join employees e on de.dept_no = d.dept_no
--limit 5

select de.emp_no, last_name, first_name, dept_name
from  dept_emp de
inner join departments d on de.dept_no = d.dept_no and (d.dept_name = 'Sales' or d.dept_name = 'Development')
inner join employees e on de.dept_no = d.dept_no
--limit 5

select last_name, count(*) ct 
from employees
group by last_name
--having count(*) < 10  -- for fun, the only unique last_name is 'Foolsday'
order by count(*) desc