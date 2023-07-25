with payments as (
    select *
    from {{ ref('stg_payments') }}
)

select sum(amount)
from payments
where status = 'success'