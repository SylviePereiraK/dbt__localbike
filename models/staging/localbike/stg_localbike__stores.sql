select 
    store_id,
    store_name,
    phone AS store_phone,
    email AS store_email,
    street AS store_street,
    city AS store_city,
    state AS store_state,
    zip_code AS store_zip_code
from {{source('localbike','stores')}}
