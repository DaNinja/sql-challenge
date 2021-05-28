-- 1)List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2)List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3)List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments
ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4)List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, dpt.dept_name
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no
LEFT JOIN departments as dpt
ON d.dept_no = dpt.dept_no
ORDER BY dept_name;

-- 5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
RIGHT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees as e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC, last_name;