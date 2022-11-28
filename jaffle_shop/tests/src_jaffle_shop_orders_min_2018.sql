--It mustn't have orders before 2018
select *
from {{ source('jaffle_shop','orders') }}
where DATE_PART(year, order_date::date) < 2018