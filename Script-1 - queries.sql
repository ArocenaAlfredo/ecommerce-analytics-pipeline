--SELECT name FROM sqlite_master WHERE type='table';
-- Objetivo de la consulta:

--Retornar una tabla con dos columnas:
--state → Identificación del estado (ubicación del cliente).
--Delivery_Difference → Diferencia promedio entre la fecha de entrega estimada y la fecha real de entrega.
SELECT 
    c.customer_state AS State,
    AVG(CAST(julianday(o.order_delivered_customer_date) - julianday(o.order_estimated_delivery_date) AS INTEGER)) AS Delivery_Difference
FROM olist_orders o
JOIN olist_customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered' 
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state;
