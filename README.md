# SQL Homework - Employee Database: A Mystery in Two Parts

![sql.png](images/sql.png)

## Background

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

In this challenge, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform:

1. Data Engineering

3. Data Analysis

Note: You may hear the term "Data Modeling" in place of "Data Engineering," but they are the same terms. Data Engineering is the more modern wording instead of Data Modeling.

#### Data Modeling

CSV files were inspected and quick diagrams tool was used to sketch out an ERD of the tables. [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

![ERD.png](images/ERD.png)

#### Data Engineering

* Table schemas were have been created for each of the six CSV files. Data types, primary keys, foreign keys, and other constraints are specified.

#### Data Analysis

Once the database schema was created and the data was imported, SQL queries were used to return the following information:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

   `select e.emp_no, first_name, last_name,sex, s.salary from employees e inner join salaries s on e.emp_no = s.emp_no;
  `

2. List first name, last name, and hire date for employees who were hired in 1986.

   `select first_name, last_name, hire_date from employees where hire_date >= '1/1/1986' and hire_date < '1/1/1987'`

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

    `select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
	from dept_manager dm 
	left join employees e on dm.emp_no = e.emp_no
	left join departments d on d.dept_no = dm.dept_no`

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
  
    `select emp_no, last_name, first_name,employee_val(emp_no,'namedept') as emp_dept_name from employees`

    * Note: sql expression was used to return the employee department [EmployeeSQL/employee_val_function.sql](EmployeeSQL/employee_val_function.sql)

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

    `select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%'`

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

    `select emp_no, last_name, first_name,employee_val(emp_no,'namedept') as MaxDeptName from employees where emp_no in (select emp_no from dept_emp where dept_no in (select dept_no from departments where dept_name = 'Sales'))`

    * Note: Many employees belong to more than one department.
    
    Employee count of employess that are in sales and other departments: 52245

    `select emp_no, last_name, first_name,employee_val(emp_no,'namedept') from employees where employee_val(emp_no,'namedept') = 'Sales'`

    Employee count of employees only in sales department: 47730


7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

    `select emp_no, last_name, first_name,employee_val(emp_no,'namedept') from employees where emp_no in (select emp_no from dept_emp where dept_no in (select dept_no from departments where dept_name in ('Sales','Development')))`

    * Employees in sales or development departments, including employees that belong to other departments in addition to sales and development. Max department (in random order) will display for employees that belong to more than one department

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

    `SELECT COUNT(*), last_name FROM employees GROUP BY last_name HAVING COUNT(*) > 1 order by count(*) desc`

## Bonus

As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

1. SQL database was imported into Pandas using the following code:

   ```sql
   from sqlalchemy import create_engine
   from config import pg_user
   from config import pg_pass

   engine = create_engine(f'postgresql://{pg_user}:{pg_pass}@localhost:5432/employee_db')
   conn = engine.connect()
   ```

* [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) was used for reference.

* Username and password were imported from a config file and supressed from githup upload using gitignore. See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and [https://help.github.com/en/github/using-git/ignoring-files](https://help.github.com/en/github/using-git/ignoring-files) for more information.

2. Create a histogram to visualize the most common salary ranges for employees.

![Salary Distribution](images/figure1_salarydist.png)

3. Create a bar chart of average salary by title.

![Average Salary by Title](images/figure2_meansalarybytitle.png)

## Epilogue

Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

`select * from employees e 
	left join salaries s on e.emp_no = s.emp_no 
	left join titles t on e.emp_title_id = t.title_id
	where e.emp_no = 499942 
  returns name: April Foolsday!`

## Submission

* Create an image file of your ERD.

* Create a `.sql` file of your table schemata.

* Create a `.sql` file of your queries.

* (Optional) Create a Jupyter Notebook of the bonus analysis.

* Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

* Ensure your repository has regular commits (i.e. 20+ commits) and a thorough README.md file

