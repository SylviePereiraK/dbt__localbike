select 
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    SAFE_CAST(shipped_date AS DATE) AS shipped_date,
    store_id,
    staff_id
from {{source('localbike','orders')}}