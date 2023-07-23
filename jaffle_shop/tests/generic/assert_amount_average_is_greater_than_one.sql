/*Promoting a singular test to a generic test*/

{% test assert_amount_average_is_greater_than_one(model, column_name, group_by_name) %}

select 
    {{group_by_name}},
    avg( {{column_name}} ) as average_amount
from {{ model}}
group by {{group_by_name}}
having count({{group_by_name}}) > 1 and average_amount < 1

{% endtest %}

/*The number that the tests fail is the same number of orders with amount <= 5*/