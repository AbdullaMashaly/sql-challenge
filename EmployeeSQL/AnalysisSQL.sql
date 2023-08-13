-- Employees list names, sex, and salaries
SELECT e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

-- Employees list names and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

-- Managers list names, employee number, department name and number
SELECT e.first_name, e.last_name, e.emp_no, dept_man.dept_no, dept.dept_name
FROM employees e
INNER JOIN dept_manager dept_man
ON e.emp_no = dept_man.emp_no
JOIN departments dept
ON dept_man.dept_no = dept.dept_no;

-- Employees list names, employees number, department name and number
SELECT e.first_name, e.last_name, e.emp_no, dept_emp.dept_no, dept.dept_name
FROM employees e
JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
JOIN departments dept
ON dept_emp.dept_no = dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%' ;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT first_name, last_name, emp_no
FROM employees 
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
    )
);

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.first_name, e.last_name, e.emp_no, departments.dept_name
FROM employees e
JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) AS "last_name_frequency"
FROM employees
GROUP BY last_name
ORDER BY "last_name_frequency" DESC;