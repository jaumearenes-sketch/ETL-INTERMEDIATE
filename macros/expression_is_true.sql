{% macro expression_is_true(expression, where=None) %}
    {% if where is not none %}
        (({{ where }}) and ({{ expression }}))
    {% else %}
        ({{ expression }})
    {% endif %}
{% endmacro %}
