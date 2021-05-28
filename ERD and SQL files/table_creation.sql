DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	emp_title_id varchar NOT NULL,
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,	
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries(
	emp_no int NOT NULL,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments(
	dept_no varchar NOT NULL PRIMARY KEY,
	dept_name varchar
);
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no varchar NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager(
	dept_no varchar NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);