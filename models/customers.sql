SELECT

    customer_id,
    first_name,
    last_name,
    city,
    country,
    registration_date,
    DATEDIFF(year, registration_date, CURRENT_DATE()) AS years_as_customer,
    birth_date,
    DATEDIFF(year, birth_date, CURRENT_DATE()) AS age_years,
    email,
    phone_number

FROM {{ ref('stg_salesforce_customers') }}