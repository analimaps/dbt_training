{% macro union_all_tables(schema_pattern, table_pattern) %}

  {% set tables = dbt_utils.get_relations_by_pattern(schema_pattern='dbt_alima', table_pattern='jinja_%') %}

  {{ log('Testing:  1' ~ tables, info=True) }}
  {% if tables %}
    SELECT *
    FROM (
      {% for table in tables %}
        SELECT * FROM {{ table }}
        {% if not loop.last %} UNION ALL {% endif %}
      {% endfor %}
    ) union_all_tables
  {% endif %}
  {{ log('Testing:  2', info=True) }}
{% endmacro %}

