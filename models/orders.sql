WITH

orders AS (

    SELECT * FROM {{ ref('stg_square_orders') }}

),

trucks AS (

    SELECT * FROM {{ ref('stg_salesforce_trucks') }}

),

orders_and_trucks_joined AS (

    SELECT

        o.order_id,
        o.truck_id,
        o.order_date, 
        o.order_timestamp,
        o.order_amount,

        t.city,
        t.region,
        t.country

    FROM orders o

    LEFT JOIN trucks t
    ON o.truck_id = t.truck_id

)

SELECT * FROM orders_and_trucks_joined