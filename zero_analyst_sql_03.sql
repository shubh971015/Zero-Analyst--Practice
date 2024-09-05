-- Day 03/50
use sql_challenge_zero_analyst;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity_sold INT
);
-- Step 2: Insert sample records into the products table
INSERT INTO products (product_id, product_name, category, quantity_sold) VALUES
(1, 'Samsung Galaxy S20', 'Electronics', 100),
(2, 'Apple iPhone 12 Pro', 'Electronics', 150),
(3, 'Sony PlayStation 5', 'Electronics', 80),
(4, 'Nike Air Max 270', 'Clothing', 200),
(5, 'Adidas Ultraboost 20', 'Clothing', 200),
(6, 'Levis Mens 501 Jeans', 'Clothing', 90),
(7, 'Instant Pot Duo 7-in-1', 'Home & Kitchen', 180),
(8, 'Keurig K-Classic Coffee Maker', 'Home & Kitchen', 130),
(9, 'iRobot Roomba 675 Robot Vacuum', 'Home & Kitchen', 130),
(10, 'Breville Compact Smart Oven', 'Home & Kitchen', 90),
(11, 'Dyson V11 Animal Cordless Vacuum', 'Home & Kitchen', 90);

select * from products;
/*

Questions : 
Write SQL query to find the top-selling products in each category

assuming products table has column 
product_id, product_name, category, quantity_sold
-- 1 product from each category
-- based on highest qty sold
-- rank
*/
select * from (
select *,rank() over (partition by category order by quantity_sold desc ) as rank_over_sold from products 
) as subquery
where rank_over_sold = 1;
 
-- Write SQL query to find the least-selling products in each category
select * from (
select *,rank() over (partition by category order by quantity_sold asc ) as rank_over_sold from products 
) as subquery
where rank_over_sold = 1;

