{% macro limit_data_in_dev(column_name, days_of_data=30 ) %}

where {{column_name}} >= dateadd('day', - {{days_of_data }}, current_date)

{% endmacro %}