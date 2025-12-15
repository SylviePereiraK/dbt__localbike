select 
    CONCAT(order_id, ' - ', item_id) AS order_item_id, 
    order_id,
    item_id,
    product_id,
    quantity AS item_quantity,
    list_price,
    discount
from {{source('localbike','order_items')}}