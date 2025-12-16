SELECT
    MAX(IF(favorite_brand_id IS NOT NULL, b.brand_id || ' - ' || b.brand_name, NULL)) AS favorite_brand,
    MAX(IF(most_profitable_brand IS NOT NULL, b.brand_id || ' - ' || b.brand_name, NULL)) AS most_profitable_brand,
    MAX(IF(favorite_category_id IS NOT NULL, c.category_id || ' - ' || c.category_name, NULL)) AS favorite_category,
    MAX(IF(most_profitable_category IS NOT NULL, c.category_id || ' - ' || c.category_name, NULL)) AS most_profitable_category
FROM {{ref('int_localbike__favorite_brand_cat')}} fbc
INNER JOIN {{ref('stg_localbike__brands')}} b
ON fbc.brand_id = b.brand_id
INNER JOIN {{ref('stg_localbike__categories')}} c
ON fbc.category_id = c.category_id
WHERE favorite_brand_id IS NOT NULL 
   OR most_profitable_brand IS NOT NULL
 OR  favorite_category_id IS NOT NULL 
   OR most_profitable_category IS NOT NULL