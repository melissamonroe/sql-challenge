select * from titles limit 100;
select * from salaries limit 100;
select * from dept_emp limit 100;
select * from dept_manager limit 100;
select * from departments limit 100;
select * from employees limit 100;

drop table IF EXISTS salaries;
drop table IF EXISTS titles;
drop table IF EXISTS dept_emp;
drop table IF EXISTS dept_manager;
drop table IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE titles (
	title_id varchar(50),
	title varchar(50),
	PRIMARY KEY (title_id)
);

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary int NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no varchar(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
	
);

CREATE TABLE dept_manager (
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	primary key (dept_no, emp_no)
);

CREATE TABLE departments (
	dept_no varchar(4),
	dept_name varchar(50),
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
	emp_no INTEGER  NOT NULL,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	sex varchar(1),
	hire_date date,
	PRIMARY KEY(emp_no)	
);

ALTER TABLE departments ADD CONSTRAINT fk_departments_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);



