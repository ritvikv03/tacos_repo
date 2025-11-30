SELECT

    id AS order_id,
    truck_num AS truck_id,
    TO_DATE(timestamp) AS order_date, 
    timestamp AS order_timestamp,
    amount AS order_amount

FROM {{source('square', 'orders')}}