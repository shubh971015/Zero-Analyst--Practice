-- 06/50 Days SQL Challenge
use sql_challenge_zero_analyst;
DROP TABLE IF EXISTS customers2;
CREATE TABLE customers2 (
    customer_id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);
desc customers2;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders1 (
    order_id INT ,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);
desc orders1;
-- Inserting sample customers
INSERT INTO customers2 (customer_id, name, email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Sam B', 'sb@example.com'),
(5, 'John Smith', 'j@example.com')	
;
select * from orders1;

-- Inserting sample orders
INSERT INTO orders1 (order_id, customer_id, order_date, amount) VALUES
(1, 1, '2024-03-05', 50.00),
(2, 2, '2024-03-10', 75.00),
(5, 4, '2024-04-02', 45.00),
(5, 2, '2024-04-02', 45.00)	,
(3, 4, '2024-04-15', 100.00),
(4, 1, '2024-04-01', 60.00),
(5, 5, '2024-04-02', 45.00);

select * from customers2;
select * from orders1;


/*
Given tables customers (columns: customer_id, 
name, email) and orders (columns: order_id, 
customer_id, order_date, amount), 

Write an SQL query to find customers who 
haven't made any purchases in the last month, 
assuming today's date is April 2, 2024. 
-- customers details 
-- who has not done purchase in last month (orders)
*/
select * from orders1
where customer_id not in (select customer_id from orders1 
							where extract(month from order_date)=extract(month from current_date)-1 and	
							extract(year from order_date)=extract(year from current_date));
                            
-- Find customer who has done purchase this month and also last month




