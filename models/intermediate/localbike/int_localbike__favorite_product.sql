SELECT
product_id,
CASE WHEN first_product_quantity = 1 then product_id
END AS favorite_product_id,
CASE WHEN first_product_price = 1 then product_id
END AS most_profitable_product,
FROM {{ ref('int_localbike__products_sold') }}

