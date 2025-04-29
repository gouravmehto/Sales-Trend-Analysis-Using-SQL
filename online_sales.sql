create database onlinesales;
use onlinesales;

create table online_sales(
order_id int,
order_date date,
product_name varchar(100),
quantity int,
price decimal(10,2) );

select * from online_sales;



-- Query 1: Total Sales Amount

SELECT SUM(quantity * price) AS total_sales
FROM online_sales;

-- Query 2: Total Orders

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM online_sales;

-- Query 3: Total Quantity Sold

SELECT SUM(quantity) AS total_quantity_sold
FROM online_sales;

-- Query 4: Sales by Product

SELECT product_name, SUM(quantity * price) AS total_sales
FROM online_sales
GROUP BY product_name
ORDER BY total_sales DESC;

-- Query 5: Most Sold Product (by Quantity)

SELECT product_name, SUM(quantity) AS total_quantity
FROM online_sales
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- Query 6: Monthly Sales Trend

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity * price) AS monthly_sales
FROM online_sales
GROUP BY month
ORDER BY month;

-- Query 7: Daily Orders

SELECT order_date, COUNT(DISTINCT order_id) AS orders_per_day
FROM online_sales
GROUP BY order_date
ORDER BY order_date;

-- Query 8: Top 3 Months by Revenue

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity * price) AS revenue
FROM online_sales
GROUP BY month
ORDER BY revenue DESC
LIMIT 3;

-- Query 9: Year-Month Wise Revenue Using EXTRACT

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(quantity * price) AS revenue
FROM online_sales
GROUP BY year , month
ORDER BY year , month;


-- Query 10: Highest Revenue Day

SELECT order_date, SUM(quantity * price) AS revenue
FROM online_sales
GROUP BY order_date
ORDER BY revenue DESC
LIMIT 1;