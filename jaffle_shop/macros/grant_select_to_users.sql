{{ users | join(', ') }}
{{schema_name}}

{% macro grant_select_to_users(schema_name, users) %}
    {% set schema_name = 'dbt_alima' %}
    {% set users = ['alima', 'tableau', 'mbartee', 'redash', 'sflowers'] %}
    
    {% set sql %}
        GRANT SELECT ON ALL TABLES IN SCHEMA {{ schema_name }} TO {{ users | join(', ') }};
    {% endset %}

    {{ log('Granting select on all tables in schema ' ~ schema_name ~ ' to users ' ~ users | join(', '), info=True) }}
    {% do run_query(sql) %}
    {{ log('Privileges granted', info=True) }}

{% endmacro %}

--To run this macro is just run the following command in terminal: dbt run-operation grant_select_to_users
--The schema_name ,ust be inside the database informed in profiles.yml
