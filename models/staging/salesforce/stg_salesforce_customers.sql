SELECT

    id AS customer_id,
    first AS first_name,
    last AS last_name,
    city,
    country,
    registration AS registration_date,
    birthday AS birth_date,
    LOWER(email) AS email,
    phone_number

FROM tacos.raw.customers