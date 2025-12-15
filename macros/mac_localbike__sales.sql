{% macro calcul_sales()%}
    ROUND(
        (list_price * item_quantity),
        2
    )
{% endmacro %}