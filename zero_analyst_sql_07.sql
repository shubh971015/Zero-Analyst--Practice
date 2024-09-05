use sql_challenge_zero_analyst ;
-- Create the employee_salary table
CREATE TABLE employees1 (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


select * from employees1;
-- Insert all records again to simulate duplicates
INSERT INTO employees1(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);

/*
Question:

How would you identify duplicate entries in
a SQL in given table employees columns are 
emp_id, name, department, salary

*/

-- ------------------------
-- My Solution
-- ------------------------
select * from employees1;

select *, count(*) from employees1	
group by emp_id,name,department,salary
having count(*) >1 ;

-- -- Identify employee details who is appearing more than twice in the table employees
select *, count(*) from employees1	
group by emp_id,name,department,salary
having count(*) >2;
