{% macro trimmer(col, node) %}
   UPPER(TRIM({{ col }}))
{% endmacro %}