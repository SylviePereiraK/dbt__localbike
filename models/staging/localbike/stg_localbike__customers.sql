select 
    customer_id,
    first_name AS customer_first_name,
    last_name AS customer_last_name,
    phone AS customer_phone,
    email AS customer_email,
    street AS customer_street,
    city AS customer_city,
    state AS customer_state,
    zip_code AS customer_zip_code
from {{source('localbike','customers')}}