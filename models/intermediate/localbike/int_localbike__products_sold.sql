select 
    product_id,
    SUM(item_quantity) AS quantity_product_sold,
    SUM({{ calcul_sales() }}) AS price_product_sold,
    ROW_NUMBER() OVER (ORDER BY SUM(item_quantity) DESC) AS first_product_quantity,
    ROW_NUMBER() OVER (ORDER BY SUM({{ calcul_sales() }}) DESC) AS first_product_price
FROM {{ref('stg_localbike__order_items')}} oi
group by product_id

