-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no AS "Employee Number", last_name AS "Last name", first_name AS "First name", sex AS "Sex", s.salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT e.first_name, e.last_name, e.emp_no, d.dept_name, dept_manager.dept_no
FROM dept_manager
INNER JOIN departments AS d
	ON d.dept_no = dept_manager.dept_no
INNER JOIN employees AS e
	ON e.emp_no = dept_manager.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, dept_emp.dept_no, departments.dept_name
FROM employees AS e
INNER JOIN dept_emp ON dept_emp.emp_no = e.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, Last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name AS test
FROM employees as e
INNER JOIN dept_emp
ON dept_emp.emp_no = e.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;