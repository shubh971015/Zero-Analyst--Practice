use sql_challenge_zero_analyst;
-- Day 10/50 SQL Challenge



-- Create Employee table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees10 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary NUMERIC(10, 2)
);

-- Insert sample records into Employee table
INSERT INTO employees10 (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'Finance', 75000.00),
(2, 'Jane', 'Smith', 'HR', 60000.00),
(3, 'Michael', 'Johnson', 'IT', 45000.00),
(4, 'Emily', 'Brown', 'Marketing', 55000.00),
(5, 'David', 'Williams', 'Finance', 80000.00),
(6, 'Sarah', 'Jones', 'HR', 48000.00),
(7, 'Chris', 'Taylor', 'IT', 72000.00),
(8, 'Jessica', 'Wilson', 'Marketing', 49000.00);
select * from employees10;

/*

Write a SQL query to classify employees into three categories based on their salary:

"High" - Salary greater than $70,000
"Medium" - Salary between $50,000 and $70,000 (inclusive)
"Low" - Salary less than $50,000

Your query should return the EmployeeID, FirstName, LastName, Department, Salary, and 
a new column SalaryCategory indicating the category to which each employee belongs.

*/
select * ,case 
				when salary > 70000 then  'high' 
				when  salary > 50000 and salary < 70000 then  'medium' 
                when  salary < 50000 then 'low' 
		  end as  salarycategory 
from employees10;