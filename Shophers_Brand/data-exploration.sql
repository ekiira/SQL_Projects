-- QUES 1. What are the most and least rated products
SELECT 
    name,
    rating
FROM 
    shophers.items 
ORDER BY rating DESC


-- QUES 2. Most ordered items 
SELECT 
   name as item_name,
   SUM(quantity) AS num_of_times_ordered
FROM 
    shophers.items AS items
JOIN shophers.orders AS orders
ON items.id = orders.item_id
GROUP BY name
ORDER by num_of_times_ordered DESC


-- QUES 3. Customers that ordered the most number of items
WITH customer_orders
AS (
    SELECT 
        customer_id,
        name ,
       SUM(quantity) AS num_of_items_ordered
    FROM 
        shophers.customers AS customers
    JOIN shophers.orders AS orders
    ON customers.id = orders.customer_id
    GROUP BY name, customer_id
),
max_order
AS (
    SELECT 
       MAX(num_of_items_ordered) AS max
    FROM customer_orders
)
SELECT 
    customer_id,
    name AS customer_name,
    num_of_items_ordered
FROM customer_orders, max_order
WHERE num_of_items_ordered = max


-- QUES 4. Customers that spent the most amount of money
WITH amount_spent
AS (
    SELECT 
        customer_id,
        name,
        '$' + CONVERT(varchar(10), SUM(total_price)) AS total_amount_spent,
        SUM(total_price)  AS total
    FROM 
        shophers.customers AS customers
    JOIN shophers.orders AS orders
    ON customers.id = orders.customer_id
    GROUP BY name, customer_id
),
max_price
AS (
    SELECT 
       MAX(total) AS max
    FROM amount_spent
)
SELECT 
    customer_id,
    name AS customer_name,
    total_amount_spent
FROM amount_spent, max_price
WHERE total = max


-- QUES 5. What day had the most number of orders
SELECT 
    CONVERT(DATE, date) AS date,
    COUNT(CONVERT(DATE, date)) AS num_of_orders
FROM 
    shophers.orders
GROUP BY CONVERT(DATE, date)
ORDER BY num_of_orders DESC


--  QUES 6. Number of orders in each location 
SELECT 
    city + ', ' + country AS location,
    COUNT(city) AS num_of_orders
FROM 
    shophers.orders 
GROUP BY city, country
ORDER BY num_of_orders DESC
