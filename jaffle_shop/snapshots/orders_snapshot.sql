/*This code is a valid example, but the orders table doesn't have a field called update_at*/



{# % snapshot orders_snapshot %}

{# {
    config(
        target_database = 'warehouse',
        target_schema= 'dbt_alima',
        unique_key = 'id',

        strategy = 'timestamp',
        check_cols = 'updated_at',
    )
} #}

select *
from {{ source('jaffle_shop', 'orders')}}

