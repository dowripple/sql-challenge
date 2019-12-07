/*
# 1 List the following details of each employee: employee number, last name, first name, gender, and salary.
*/

  SELECT e.emp_no AS "Employee Number",
  		 e.last_name AS "Last Name",
		 e.first_name AS "First Name",
		 e.gender AS "Gender",
		 s.salary
    FROM employee e INNER JOIN salary s
	  ON e.emp_no = s.emp_no;

/*
2. List employees who were hired in 1986.
*/

  SELECT e.emp_no AS "Employee Number",
  		 e.last_name AS "Last Name",
		 e.first_name AS "First Name",
		 e.hire_date
    FROM employee e
	-- using postgres equivalent of SQL "YEAR" function to get only hire dates from 1986
   WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;
   
/*
3. List the manager of each department with the following information: department number, department name, 
	the manager's employee number, last name, first name, and start and end employment dates.

*/	  

  --query to return the department managers over time (note that i did test the inner joins by doing left/right, row counts match)
  SELECT dm.dept_no AS "Department Number",
  		 d.dept_name AS "Department Name",
		 dm.emp_no AS "Manager''s Employee Number",
		 e.last_name AS "Last Name",
		 e.first_name AS "First Name",
		 e.hire_date AS "Start Date",
		 dm.from_date AS "Position Start Date",
		 dm.to_date AS "Position End Date"
    FROM dept_manager dm INNER JOIN department d
	  ON dm.dept_no = d.dept_no INNER JOIN employee e
	  ON dm.emp_no = e.emp_no
--sorting by department and position start date, to see the progression (row count matches data analysis results)	 
ORDER BY "Department Name", "Position Start Date";
	  
/*
4. List the department of each employee with the following information: employee number, last name, first name, and department name.

*/

  --query to return employee departments
  SELECT de.emp_no AS "Employee Number",
  		 e.last_name AS "Last Name",
		 e.first_name AS "First Name",
		 d.dept_name AS "Department Name"
    FROM dept_emp de INNER JOIN employee e
	  ON de.emp_no = e.emp_no INNER JOIN department d
	  ON de.dept_no = d.dept_no
--sorting by department then employee
ORDER BY "Department Name",
		 "Last Name",
		 "First Name";

/*
5. List all employees whose first name is "Hercules" and last names begin with "B."

(20 of them)

*/

  SELECT e.emp_no AS "Employee Number",
  		 e.last_name AS "Last Name",
		 e.first_name AS "First Name"
    FROM employee e
   WHERE e.first_name = 'Hercules'
     AND LEFT(e.last_name,1) = 'B'
-- sort by names, just for fun
ORDER BY e.last_name,
		 e.first_name

/*
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
*/

  SELECT de.emp_no AS "Employee Number",
  		 e.last_name AS "Last Name",
		 e.first_name AS "First Name",
		 d.dept_name AS "Department Name"
    FROM dept_emp de INNER JOIN employee e
	  ON de.emp_no = e.emp_no INNER JOIN department d
	  ON de.dept_no = d.dept_no
   WHERE d.dept_name = 'Sales'	  
--sorting by employee
ORDER BY "Last Name",
		 "First Name";

/*
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
*/

  SELECT de.emp_no AS "Employee Number",
  		 e.last_name AS "Last Name",
		 e.first_name AS "First Name",
		 d.dept_name AS "Department Name"
    FROM dept_emp de INNER JOIN employee e
	  ON de.emp_no = e.emp_no INNER JOIN department d
	  ON de.dept_no = d.dept_no
   WHERE d.dept_name IN ('Sales','Development')
--sorting by department then employee
ORDER BY "Department Name",
		 "Last Name",
		 "First Name";
		 
/*
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

*/

  SELECT e.last_name AS "Shared Last Name",
  		 COUNT(*) AS "Number of Employees"
    FROM employee e
GROUP BY e.last_name
ORDER BY "Number of Employees" DESC;

