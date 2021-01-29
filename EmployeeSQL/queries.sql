-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select 	first_name,	last_name,sex, s.salary from employees e inner join salaries s on e.emp_no = s.emp_no;

select count(*) from employees;
--300,024

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees where hire_date >= '1/1/1986' and hire_date < '1/1/1987'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
	from dept_manager dm 
	left join employees e on dm.emp_no = e.emp_no
	left join departments d on d.dept_no = dm.dept_no

select count(*) from dept_manager 
--24 

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp_no, last_name, first_name,employee_val(emp_no,'namedept') as emp_dept_name from employees

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name,employee_val(emp_no,'namedept') as MaxDeptName from employees where emp_no in (select emp_no from dept_emp where dept_no in (select dept_no from departments where dept_name = 'Sales'))
select count(*) from employees where emp_no in (select emp_no from dept_emp where dept_no in (select dept_no from departments where dept_name = 'Sales'))
-- 52245

--employees only in sales department
select emp_no, last_name, first_name,employee_val(emp_no,'namedept') from employees where employee_val(emp_no,'namedept') = 'Sales'
select count(*) from employees where employee_val(emp_no,'namedept') = 'Sales'
--47730

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name,employee_val(emp_no,'namedept') from employees where employee_val(emp_no,'namedept') in ('Sales','Development')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(*), last_name FROM employees GROUP BY last_name HAVING COUNT(*) > 1 order by count(*) desc
