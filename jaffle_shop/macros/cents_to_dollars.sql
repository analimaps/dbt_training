{% macro cents_to_dollars(column_name, decimal_places=2 ) -%} --this number 2 is the default for the field
round( 1.0 * {{column_name}} / 100, {{ decimal_places }})
{%- endmacro %}