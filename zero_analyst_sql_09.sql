-- Day 09/50


use  sql_challenge_zero_analyst;
-- Create Customers table
DROP TABLE IF EXISTS customers09;
CREATE TABLE Customers09 (
    CustomerID INT,
    CustomerName VARCHAR(50)
);

-- Create Purchases table
DROP TABLE IF EXISTS purchases09;
CREATE TABLE Purchases09 (
    PurchaseID INT,
    CustomerID INT,
    ProductName VARCHAR(50),
    PurchaseDate DATE
);

-- Insert sample data into Customers table
INSERT INTO Customers09 (CustomerID, CustomerName) VALUES
(1, 'John'),
(2, 'Emma'),
(3, 'Michael'),
(4, 'Ben'),
(5, 'John')	;

-- Insert sample data into Purchases table
INSERT INTO Purchases09(PurchaseID, CustomerID, ProductName, PurchaseDate) VALUES
(100, 1, 'iPhone', '2024-01-01'),
(101, 1, 'MacBook', '2024-01-20'),	
(102, 1, 'Airpods', '2024-03-10'),
(103, 2, 'iPad', '2024-03-05'),
(104, 2, 'iPhone', '2024-03-15'),
(105, 3, 'MacBook', '2024-03-20'),
(106, 3, 'Airpods', '2024-03-25'),
(107, 4, 'iPhone', '2024-03-22'),	
(108, 4, 'Airpods', '2024-03-29'),
(110, 5, 'Airpods', '2024-02-29'),
(109, 5, 'iPhone', '2024-03-22');

select *  from Purchases09;
select *  from customers09;

/*
Apple data analyst interview question

Given two tables - Customers and Purchases, 
where Customers contains information about 
customers and Purchases contains information 
about their purchases, 

write a SQL query to find customers who 
bought Airpods after purchasing an iPhone.

*/

-- Find out all customers who bought iPhone
-- All customers who bought Airpods
-- Customer has to buy Airpods after purchasing the iPhone 

	
select distinct c.* from customers09 c
join Purchases09 p1 on c.CustomerID=p1.CustomerID
JOIN Purchases09 p2
ON c.customerid = p2.customerid	
WHERE p1.productname = 'iPhone'
AND
p2.productname = 'Airpods'	
AND
p1.purchasedate < p2.purchasedate;

select distinct * from customers09 c where  
c.CustomerID in
(
			SELECT p1.CustomerID from Purchases09 as p1 -- self join
			join Purchases09 p2 on p1.CustomerID=p2.CustomerID
			where p1.productname='iphone' and p2.productname='airpods'
			and p1.PurchaseDate < p2.PurchaseDate
);

/*
-- Find out what is the % of chance is there that the 
-- customer who bought MacBook will buy an Airpods
*/
/*
Count the number of customers who bought both a MacBook and Airpods.
Count the total number of customers who bought a MacBook.. 
Calculate the percentage by dividing the count of customers who bought both items by the total count of MacBook buyers and then multiplying by 100.
*/

select *  from Purchases09;
select *  from customers09;

select count(*) from Purchases09
where ProductName = 'macbook' and ProductName = 'airpods'
group by CustomerID
HAVING COUNT(DISTINCT ProductName) = 2;
select count(*) from Purchases09
where ProductName = 'macbook';

select *,
nullif(case count(*) when  ProductName = 'macbook' and ProductName = 'airpods' then end / 
count(*) case  when ProductName = 'macbook' then end) from Purchases09;