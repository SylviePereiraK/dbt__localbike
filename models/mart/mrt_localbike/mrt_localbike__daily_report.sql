SELECT
    IF(favorite_product_id = p.product_id, 'Favorite product: ' || product_name || 'quantity: ' || quantity_product_sold, NULL) AS favorite_product,
    IF(most_profitable_product = p.product_id, 'Most profitable product: ' || product_name || 'quantity: ' || price_product_sold, NULL) AS profitable_product
    IF(favorite_brand_id = b.brand_id, 'Favorite brand: ' || brand_name || 'quantity: ' || quantity_sold_by_brand, NULL) AS favorite_brand,
    IF(most_profitable_brand = b.brand_id, 'Most profitable brand: ' || brand_name || 'quantity: ' || price_sold_by_brand, NULL) AS profitable_brand,
    IF(favorite_category_id = c.category_id, 'Favorite category: ' || category_name || 'quantity: ' || quantity_sold_by_category, NULL) AS favorite_category,
    IF(most_profitable_category = c.category_id, 'Most profitable category: ' || category_name || 'quantity: ' || price_sold_by_category, NULL) AS profitable_category
FROM {{ref('int_localbike__products_sold')}} ps
INNER JOIN {{ref('int_localbike__products_sold_by_brand_cat')}} psbc
ON ps.product_id = psbc.product_id
LEFT JOIN {{ref('int_localbike__favorite_product')}} fp
ON ps.product_id = fp.product_id
INNER JOIN {{ref('stg_localbike__products')}} p
ON ps.product_id = p.product_id
INNER JOIN {{ref('stg_localbike__brands')}} b
ON psbc.brand_id = b.brand_id
INNER JOIN {{ref('stg_localbike__categories')}} c
ON psbc.category_id = c.favorite_category_id
INNER JOIN {{ref('int_localbike__favorite_brand_cat')}} fbc
ON b.brand_id = fbc.brand_id
AND c.category_id = fbc.favorite_category_id