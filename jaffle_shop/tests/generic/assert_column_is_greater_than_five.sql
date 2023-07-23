/*Promoting a singular test to a generic test*/

{% test assert_column_is_greater_than_five(model, column_name) %}

select 
    {{column_name}}
from {{ model}}
where {{column_name}} <= 5

{% endtest %}

/*The number that the tests fail is the same number of orders with amount <= 5*/