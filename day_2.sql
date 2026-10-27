use sql7challenge;

--orders is from-join-where-group by-having-select-distinc-order by(sorting)-limit
--Q1. Total orders(total orders =orders id's using count() function)

select count(*) as Total_orders from orders;

--Q2. Orders by status (count how many orders exits for each status())
--pending,completed,cancelled)

select status, count(*) as total_orders_status
from orders
group by status;

--Q3. Display the 10 most recent orders

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 10;

--Q4. find the 10 orders with the highest total amount

SELECT
    order_date,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY order_date ASC;

--Q5. count orders placed per day in chronological(ascending order) order

SELECT
    order_date,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY order_date ASC;

--Q6.monthly order trend group orders by month using date functions identify peak and low -volume months

SELECT
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month ASC;

--Q7. average order value (rounded)
--calculate the average order amount across all orders round results for clean reporting

SELECT
    ROUND(AVG(order_amount), 2) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_amount
    FROM order_items
    GROUP BY order_id
) AS order_totals;


## Question 8: Order Performance Insights & Business Findings

1\. Total Orders: Our store received 3,000 orders.

2\. Order Status: 1,796 orders were delivered. Some orders were shipped, processing, returned, or cancelled. Most orders were delivered successfully.

3\. Recent Orders: The latest orders in our results are from 30 September 2026. They have different statuses.

4\. Daily Orders: The number of orders changes every day. Some days had only 1 or 2 orders, while the highest shown was 11.

5\. Monthly Trend: August had the most orders (300), while October had the fewest (146). We should check whether October's data is complete.

6\. Average Order Value: The average order value was 20,886.06.

7\. Business Suggestions: We should give good customer service, find out why orders are returned or cancelled, and plan stock based on busy days and months. We should also check why some months have fewer orders.
