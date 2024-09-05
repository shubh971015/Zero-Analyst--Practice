-- Day 12/50 Days sql Challenge


DROP TABLE IF EXISTS Employees12;
-- Create Employees table
CREATE TABLE Employees12 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Insert sample data into Employees table
INSERT INTO Employees12 (id, name) VALUES
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');
select * from Employees12;
select * from EmployeeUNI12; 


DROP TABLE IF EXISTS EmployeeUNI12;
-- Create EmployeeUNI table
CREATE TABLE EmployeeUNI12 (
    id INT PRIMARY KEY,
    unique_id INT
);

-- Insert sample data into EmployeeUNI table
INSERT INTO EmployeeUNI12 (id, unique_id) VALUES
    (3, 1),
    (11, 2),
    (90, 3);
    
select * from Employees12;
select * from EmployeeUNI12; 
s
/*

Write a solution to show the unique ID of each user, 
If a user does not have a unique ID replace just show null.

Return employee name and their unique_id.

Table: Employees

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains the id and the name of an employee in a company.
 
Table: EmployeeUNI

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, unique_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.

*/
select e.name ,emp.unique_id from Employees12 e
left join  EmployeeUNI12 emp  on e.id=emp.id) as temp


-- Your task to replace null values to 0 for the employee who doesn't have unique id
select * from (
select e.name ,emp.unique_id from Employees12 e
left join  EmployeeUNI12 emp  on e.id=emp.id) as temp
;

SELECT 
    name, 
    COALESCE(unique_id, 0) AS unique_id
FROM (
    SELECT 
        e.name,
        emp.unique_id 
    FROM 
        Employees12 e
    LEFT JOIN  
        EmployeeUNI12 emp ON e.id = emp.id
) AS temp;
-- The COALESCE function is used to replace NULL values with 0 in the unique_id column within the subquery.










