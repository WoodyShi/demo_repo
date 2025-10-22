{% macro calc_final_price(sales_price, qty, discounted_amount, tax_rate) %}
    (({{ sales_price }} * {{ qty }}) - {{ discounted_amount }}) / NULLIF({{ tax_rate }}, 0)
{% endmacro %}