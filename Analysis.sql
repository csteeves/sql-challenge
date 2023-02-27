-- (1.) List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.Last_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s 
ON s.emp_no = e.emp_no;

-- (2.) List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- (3.) List the manager of each department along with their department number, department name, 
     -- employee number, last name, and first name.
SELECT DM.dept_no, D.dept_name, DM.emp_no, first_name, last_name
FROM dept_manager AS DM
	INNER JOIN Departments AS D 
	ON D.dept_no = DM.dept_no
	INNER JOIN employees AS e 
	ON e.emp_no = DM.emp_no;

-- (4.) List the department number for each employee along with that employee’s employee number, last name,
      --first name, and department name.
SELECT DE.dept_no, D.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees AS e
	INNER JOIN Dept_emp AS DE 
	ON DE.emp_no = e.emp_no
	INNER JOIN Departments AS D 
	ON D.dept_no = DE.dept_no;
	  
-- (5.) List first name, last name, and sex of each employee whose first name is Hercules and 
      --whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	  
-- (6.) List each employee in the Sales department, including their employee number, last name, and 
      --first name.
SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
	INNER JOIN Dept_emp AS DE 
	ON DE.emp_no = e.emp_no
	INNER JOIN Departments AS D 
	ON D.dept_no = DE.dept_no
	WHERE dept_name = 'Sales';

-- (7.) List each employee in the Sales and Development departments, including their employee number, last name, 
      --first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, D.dept_name	  
FROM employees AS e
	INNER JOIN Dept_emp AS DE 
	ON DE.emp_no = e.emp_no
	INNER JOIN Departments AS D 
	ON D.dept_no = DE.dept_no
	WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- (8.) List the frequency counts, in descending order, of all the employee last names 
      --(that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;

	  