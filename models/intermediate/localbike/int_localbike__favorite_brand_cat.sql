SELECT
brand_id,
category_id,
CASE WHEN first_brand_quantity = 1 then brand_id
END AS favorite_brand_id,
CASE WHEN first_brand_price = 1 then brand_id
END AS most_profitable_brand,
CASE WHEN first_category_quantity = 1 then category_id
END AS favorite_category_id,
CASE WHEN first_category_price = 1 then category_id
END AS most_profitable_category
FROM {{ref('int_localbike__products_sold_by_brand_cat') }}

