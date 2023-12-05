-- Q1. Find customers who never ordered
SELECT name FROM users WHERE user_id NOT IN (SELECT user_id FROM orders);


-- Q2. Average price per dish
SELECT f_name, AVG(price) 
FROM food
JOIN menu on food.f_id = menu.f_id
GROUP BY f_name;


-- Q3. Find top restaurant in terms of no of orders for a given month
SELECT r_name, COUNT(r_name) as 'No. of orders'
FROM orders
JOIN restaurants ON orders.r_id = restaurants.r_id
WHERE MONTHNAME(date) LIKE 'June' -- change month name to check top restaurants for other months
GROUP BY r_name
ORDER BY COUNT(r_name) DESC LIMIT 1; 


-- Q4. Restaurants with monthly sales > x for a given month 
SELECT r_name, SUM(amount)
FROM orders
JOIN restaurants ON orders.r_id = restaurants.r_id
WHERE MONTHNAME(date) LIKE 'July' -- change month name
GROUP BY r_name
HAVING SUM(amount) > 500
ORDER BY SUM(amount) DESC;


-- Q5. Show all orders with order details for a customer in a particular date range
SELECT f_name, date
FROM order_details
JOIN food ON order_details.f_id = food.f_id
JOIN orders ON order_details.order_id = orders.order_id
WHERE date BETWEEN '2022-06-15' AND '2022-07-01'
AND user_id = 1;
