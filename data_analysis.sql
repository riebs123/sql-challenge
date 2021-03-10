select * from departments

select * from titles

select * from employees

select * from salaries

select * from dept_emp

select * from dept_manager

-- 1. List Employee Details

select 
e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
LEFT JOIN salaries s ON
e.emp_no = s.emp_no;

-- 2. List Employee Details who were hired in 1986 

select
first_name, last_name, hire_date
from employees
WHERE hire_date >= '1986-01-01' and
hire_date <= '1986-12-31';

-- 3. List the details for managers of each deparment

select 
mgr.dept_no, dept.dept_name, mgr.emp_no, e.last_name, e.first_name
FROM
dept_manager mgr
LEFT JOIN 
departments dept ON
dept.dept_no = mgr.dept_no
LEFT JOIN 
employees e on 
e.emp_no = mgr.emp_no;

-- 4. Employee info with department info
 
select e.emp_no, e.last_name, e.first_name, dept.dept_name
from 
employees e
left join 
dept_emp ON
dept_emp.emp_no = e.emp_no
left join
departments dept ON
dept.dept_no = dept_emp.dept_no
order by emp_no asc;

-- 5. List Employees with First Name 'Hercules' and last name begins with 'B'

select first_name, last_name, sex
from
employees
WHERE first_name = 'Hercules' and
last_name LIKE 'B%'

-- 6. List all employees in the Sales Department

select e.emp_no, e.last_name, e.first_name, dept.dept_name
from 
employees e
left join 
dept_emp ON
dept_emp.emp_no = e.emp_no
left join
departments dept ON
dept.dept_no = dept_emp.dept_no
WHERE dept.dept_name = 'Sales'

order by emp_no asc;

-- 7. List all employees in the Sales and Dev Departments

select e.emp_no, e.last_name, e.first_name, dept.dept_name
from 
employees e
left join 
dept_emp ON
dept_emp.emp_no = e.emp_no
left join
departments dept ON
dept.dept_no = dept_emp.dept_no
WHERE dept.dept_name = 'Sales' or dept.dept_name = 'Development'

order by emp_no asc;

--8. List the frequency count of employee last names

select last_name, COUNT(last_name)
from employees
group by 1
order by 2 desc;


