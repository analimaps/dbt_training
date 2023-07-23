{{ config( severity = "error", error_if = ">20" ) }}

select 
    amount
from {{ ref('fct_orders')}}
where amount <= 5

/*The number that the tests fail is the same number of orders with amount <= 5*/