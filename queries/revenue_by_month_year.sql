-- TODO: 
-- This query will return a table with the revenue by month and year. 
-- It will have different columns: 
--      month_no, with the month numbers going from 01 to 12; 
--      month, with the 3 first letters of each month (e.g. Jan, Feb); 
--      Year2016, with the revenue per month of 2016 (0.00 if it doesn't exist); 
--      Year2017, with the revenue per month of 2017 (0.00 if it doesn't exist) and 
--      Year2018, with the revenue per month of 2018 (0.00 if it doesn't exist).

-- HINTS:
-- 1. olist_order_payments has multiple entries for some order_id values. 
-- For this query, make sure to retain only the entry with minimal payment_value for each order_id.
-- 2. order_status == 'delivered' AND order_delivered_customer_date IS NOT NULL

WITH min_payments AS (
    SELECT 
        order_id, 
        MIN(payment_value) AS payment_value
    FROM olist_order_payments
    GROUP BY order_id
)
SELECT 
    STRFTIME('%m', o.order_delivered_customer_date) AS month_no,
    SUBSTR(STRFTIME('%b', o.order_delivered_customer_date), 1, 3) AS month,
    COALESCE(SUM(CASE WHEN STRFTIME('%Y', o.order_delivered_customer_date) = '2016' 
        THEN p.payment_value ELSE NULL END), 0.00) AS Year2016,
    COALESCE(SUM(CASE WHEN STRFTIME('%Y', o.order_delivered_customer_date) = '2017' 
        THEN p.payment_value ELSE NULL END), 0.00) AS Year2017,
    COALESCE(SUM(CASE WHEN STRFTIME('%Y', o.order_delivered_customer_date) = '2018' 
        THEN p.payment_value ELSE NULL END), 0.00) AS Year2018
FROM olist_orders o
JOIN min_payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY month_no, month
ORDER BY month_no;