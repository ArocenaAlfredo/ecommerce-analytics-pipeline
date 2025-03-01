-- TODO: 
-- This query will return a table with the differences between the real 
-- and estimated delivery times by month and year. 
-- It will have different columns: 
--      month_no, with the month numbers going FROM 01 to 12; 
--      month, with the 3 first letters of each month (e.g. Jan, Feb); 
--      Year2016_real_time, with the average delivery time per month of 2016 (NaN if it doesn't exist); 
--      Year2017_real_time, with the average delivery time per month of 2017 (NaN if it doesn't exist); 
--      Year2018_real_time, with the average delivery time per month of 2018 (NaN if it doesn't exist); 
--      Year2016_estimated_time, with the average estimated delivery time per month of 2016 (NaN if it doesn't exist); 
--      Year2017_estimated_time, with the average estimated delivery time per month of 2017 (NaN if it doesn't exist) and 
--      Year2018_estimated_time, with the average estimated delivery time per month of 2018 (NaN if it doesn't exist).

-- HINTS:
-- 1. You can use the julianday function to convert a date to a number.
-- 2. order_status == 'delivered' AND order_delivered_customer_date IS NOT NULL
-- 3. Take distinct order_id.


select month_no,
    case
        when a.month_no = '01' then 'Jan'
        when a.month_no = '02' then 'Feb'
        when a.month_no = '03' then 'Mar'
        when a.month_no = '04' then 'Apr'
        when a.month_no = '05' then 'May'
        when a.month_no = '06' then 'Jun'
        when a.month_no = '07' then 'Jul'
        when a.month_no = '08' then 'Aug'
        when a.month_no = '09' then 'Sep'
        when a.month_no = '10' then 'Oct'
        when a.month_no = '11' then 'Nov'
        when a.month_no = '12' then 'Dec'
        else 0
    end as month,
    AVG(case when a.year = '2016' then a.real_delivery_time end) as Year2016_real_time,
    AVG(case when a.year = '2017' then a.real_delivery_time end) as Year2017_real_time,
    AVG(case when a.year = '2018' then a.real_delivery_time end) as Year2018_real_time,
    AVG(case when a.year = '2016' then a.estimated_delivery_time end) as Year2016_estimated_time,
    AVG(case when a.year = '2017' then a.estimated_delivery_time end) as Year2017_estimated_time,
    AVG(case when a.year = '2018' then a.estimated_delivery_time end) as Year2018_estimated_time
FROM (
        SELECT order_id,
            customer_id,
            julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp) as real_delivery_time,
            julianday(order_estimated_delivery_date) - julianday(order_purchase_timestamp) as estimated_delivery_time,
            strftime('%Y', order_purchase_timestamp) as year,
            strftime('%m', order_purchase_timestamp) as month_no
        FROM olist_orders
        where order_status = 'delivered'
            and order_delivered_customer_date is not null
        group by 1
        order by order_purchase_timestamp asc
    ) a
group by month
order by month_no asc






