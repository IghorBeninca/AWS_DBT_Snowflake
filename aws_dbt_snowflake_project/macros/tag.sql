{% macro tag(col) %}
    case 
        when {{col}} < 100 then 'LOW'
        when {{col}} < 200 then 'MEDIUM'
        else 'HIGH'
    end
{% endmacro %}