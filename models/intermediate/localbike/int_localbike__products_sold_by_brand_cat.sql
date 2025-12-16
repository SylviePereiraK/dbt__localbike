WITH brand_totals AS (
SELECT 
    p.product_id,
    brand_id,
    category_id,
    SUM(quantity_product_sold) OVER (PARTITION BY brand_id) AS quantity_sold_by_brand,
    SUM(price_product_sold) OVER (PARTITION BY brand_id) AS price_sold_by_brand,
    SUM(quantity_product_sold) OVER (PARTITION BY category_id) AS quantity_sold_by_category,
    SUM(price_product_sold) OVER (PARTITION BY category_id) AS price_sold_by_category
FROM {{ref('int_localbike__products_sold')}} ps
INNER JOIN {{ref('stg_localbike__products')}} p
ON ps.product_id = p.product_id
)
SELECT *,
    ROW_NUMBER() OVER (ORDER BY quantity_sold_by_brand DESC) AS first_brand_quantity,
    ROW_NUMBER() OVER (ORDER BY price_sold_by_brand DESC) AS first_brand_price,
    ROW_NUMBER() OVER (ORDER BY quantity_sold_by_category DESC) AS first_category_quantity,
    ROW_NUMBER() OVER (ORDER BY price_sold_by_category DESC) AS first_category_price
FROM brand_totals



