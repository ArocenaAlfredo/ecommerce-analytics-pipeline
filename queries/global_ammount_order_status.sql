-- TODO: 
-- This query will return a table with two columns: order_status and Amount. 
-- The first one will have the different order status classes 
-- and the second one the total amount of each.

SELECT 
    order_status,
    COUNT(order_status) AS Ammount
FROM olist_orders
GROUP BY order_status





