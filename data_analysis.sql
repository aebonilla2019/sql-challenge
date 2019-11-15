--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.

SELECT * FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


--3. List the manager of each deparment with the following information:
--department number, department name, manager's employee number, last name, first name, start and end dates

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_managers as dm
JOIN employees as e ON
	e.emp_no = dm.emp_no
JOIN departments as d ON
	d.dept_no = dm.dep_no;
	
--4. List the deaprtment of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees as e ON
	e.emp_no = de.emp_no
JOIN departments as d ON
	de.dept_no = d.dept_no;
	
--5. List all employees whose first name is "Hercules" and last names begin with "B".

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT emp_no, last_name, first_name, 'Sales' AS dept_name
FROM employees WHERE emp_no IN
	(SELECT emp_no FROM Dept_emp WHERE dept_no IN
		(SELECT dept_no FROM departments WHERE dept_name = 'Sales'));

--7. List all employees in the Sales and Development departments, including their: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN Dept_emp as de ON
	e.emp_no = de.emp_no
JOIN departments d ON
	de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;