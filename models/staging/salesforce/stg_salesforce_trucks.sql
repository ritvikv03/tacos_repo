SELECT DISTINCT -- remove duplicates

    -- clarify the identifier
    id AS truck_id,
    
    -- capitalize first letters
    INITCAP(city) AS city,
    
    region,
    
    -- add country names
    CASE
        WHEN country = 1 THEN 'Australia'
        WHEN country = 2 THEN 'Brazil'
        WHEN country = 3 THEN 'Canada'
        WHEN country = 4 THEN 'Egypt'
        WHEN country = 5 THEN 'England'
        WHEN country = 6 THEN 'France'
        WHEN country = 7 THEN 'Germany'
        WHEN country = 8 THEN 'India'
        WHEN country = 9 THEN 'Japan'
        WHEN country = 10 THEN 'Poland'
        WHEN country = 11 THEN 'South Africa'
        WHEN country = 12 THEN 'South Korea'
        WHEN country = 13 THEN 'Spain'
        WHEN country = 14 THEN 'Sweden'
        WHEN country = 15 THEN 'United States'
        ELSE 'Unknown'
    END AS country,
    
    -- add franchise status
    CASE
        WHEN franchise_flag = 0 THEN 'Company'
        WHEN franchise_flag = 1 THEN 'Franchise'
        ELSE 'Unknown'
        END AS franchise_status,
    
    year,
    
    -- replace nulls
    COALESCE(make, 'Custom') AS make,
    
    -- trim blank space
    TRIM(model) AS model,
    
    opening_date

FROM {{source('salesforce', 'trucks')}}