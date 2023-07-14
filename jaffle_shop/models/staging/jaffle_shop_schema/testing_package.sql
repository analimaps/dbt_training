select order_date, 
       {{ dbt_date.day_of_month("order_date") }} as day_of_month
from {{ source('jaffle_shop','orders') }}