/*

script just to check out the newly imported data

*/

  --making sure data got loaded
  
  -- the department table
  SELECT COUNT(*) AS "# of Departments"
    FROM department;
  -- 9 departments
  
  -- the dept_emp junction table (department to employee)
  SELECT COUNT(*) AS "# of Department/Employee Relationships"
    FROM dept_emp;
  -- 331,603 department/employee relationships
  
  -- just curious, seeing how many emps changed departments
  SELECT emp_no AS "Employee Number",
  		 COUNT(*) AS "Number of Departments Over Time"
    FROM dept_emp
GROUP BY emp_no
  --return only the employee ids having more than 1 occurrence
  HAVING COUNT(*) >1;

-- 31,579 (10.5%) of 300,024 employees changed departments over time

  -- department manager junction table
  SELECT COUNT(*) AS "# of Department/Manager Relationships"
    FROM dept_manager;
  -- 24 dept/manager combos over time
  
  --curious to see how many managers handled multiple departments
  SELECT emp_no,
  		 COUNT(*) AS "Number of Departments Managed"
    FROM dept_manager
GROUP BY emp_no
  HAVING COUNT(*)>1;
  -- 0 daring souls managed more than one department

  --employee table
  SELECT COUNT(*) AS "Employee Total Count",
  		 MIN(hire_date) AS "First Hire Date",
		 MAX(hire_date) AS "Last Hire Date"
    FROM employee;
  -- 300,024 employees, between 1/1/1985 and 1/28/2000
  
  -- salary table
  SELECT COUNT(*) 
    FROM salary;
  -- 300,024 (yikes, looks like nobody got a raise in 15 years!)

  -- just confirming suspicion
  SELECT emp_no
    FROM salary
GROUP BY emp_no
  HAVING COUNT(*)>1;
  --yep, 0 people got raises or paycuts  

  --title table
  SELECT COUNT(*) FROM title;
  -- 443,308 epmloyee/title relationships
  
  --how many people changed jobs?
    WITH multiple_titles (emp_no, title_change_count)
	  AS
	   (
		  SELECT emp_no,
				 COUNT(*) AS "Number of Title Changes"
			FROM title
		GROUP BY emp_no
		  HAVING COUNT(*)>1
	   )
  SELECT title_change_count AS "# Title Changes",
  		 COUNT(*) AS "Number of Employees"
    FROM multiple_titles
GROUP BY title_change_count
ORDER BY title_change_count
  -- 137,256 employees changed titles 2 times
  -- 3,014 employees changed titles 3 times
  -- 140,270 (46.7%) out of 300,024 employees changed titles at least twice
  
  
  
   
   
  		 
  
  
