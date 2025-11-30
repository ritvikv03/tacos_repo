WITH

trucks AS (

    SELECT * FROM {{ ref('stg_salesforce_trucks') }}

),

orders AS (

    SELECT * FROM {{ ref('stg_square_orders') }}

),

truck_orders AS (

    SELECT

        truck_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date,
        COUNT(order_id) AS number_of_orders,
        SUM(order_amount) AS total_sales

    FROM orders

    GROUP BY truck_id

),

trucks_and_truck_orders_joined AS (

    SELECT

        t.truck_id,
        t.city,
        t.region,
        t.country,
        t.franchise_status,
        t.year,
        t.make,
        t.model,
        t.opening_date,
        
        o.first_order_date,
        o.most_recent_order_date,
        o.number_of_orders,
        o.total_sales

    FROM trucks t

    LEFT JOIN truck_orders o
    ON t.truck_id = o.truck_id

)

SELECT * FROM trucks_and_truck_orders_joined