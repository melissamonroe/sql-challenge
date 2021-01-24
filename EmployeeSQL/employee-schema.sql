select * from salaries limit 100;
select * from employees limit 100;
select * from dept_emp limit 100;
select * from dept_manager limit 100;
select * from titles limit 100;
select * from departments limit 100;

drop table IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
drop table IF EXISTS dept_emp;
drop table IF EXISTS dept_manager;
drop table IF EXISTS titles;
drop table IF EXISTS departments;

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary int NOT NULL,
	PRIMARY KEY (emp_no),	
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

CREATE TABLE employees (
	emp_no INTEGER  NOT NULL,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	sex varchar(1),
	hire_date date,
	PRIMARY KEY(emp_no),  
	FOREIGN KEY(emp_no) REFERENCES salaries(emp_no)	
);



CREATE TABLE titles (
	title_id varchar(50) primary key,
	title varchar(50)
);

CREATE TABLE departments (
	dept_no varchar(4) primary key,
	dept_name varchar(50)
);

