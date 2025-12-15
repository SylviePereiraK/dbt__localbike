SELECT
    product_name,
    brand_name,
    category_name,
    quantity_product_sold,
    price_product_sold,
    quantity_sold_by_brand,
    price_sold_by_brand,
    quantity_sold_by_category,
    price_sold_by_category,
    IF(favorite_product_id = p.product_id, 'Favorite product', NULL) AS favorite_product
FROM {{ref('int_localbike__products_sold')}} ps
INNER JOIN {{ref('int_localbike__products_sold_by_brand_cat')}} psbc
ON ps.product_id = psbc.product_id
LEFT JOIN {{ref('int_localbike__favorite_product')}} fp
ON ps.product_id = fp.favorite_product_id
INNER JOIN {{ref('stg_localbike__products')}} p
ON ps.product_id = p.product_id
INNER JOIN {{ref('stg_localbike__brands')}} b
ON psbc.brand_id = b.brand_id
INNER JOIN {{ref('stg_localbike__categories')}} c
ON psbc.category_id = c.category_id