{%- macro union_tables_by_pattern(schema_pattern, table_pattern) -%}
  {{ log('Testing:  1', info=True) }}

  {%- set tables = dbt_utils.get_relations_by_pattern(schema_pattern='dbt_alima', table_pattern='jinja\_%') -%}
  {{ log('Testing:  2' ~ tables, info=True) }}
  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.schema }}.{{ table.name }}
      
  {% endfor -%}
  
  
  {{ log('Testing:  3', info=True) }}
{%- endmacro -%}

