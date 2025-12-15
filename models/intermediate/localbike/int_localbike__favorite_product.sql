SELECT
product_id AS favorite_product_id,
FROM {{ ref('int_localbike__products_sold') }}
WHERE first_product_quantity = 1
OR first_product_price = 1