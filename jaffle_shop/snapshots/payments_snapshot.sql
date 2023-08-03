{% snapshot payments_snapshot %}

{{
    config(
        target_database = 'warehouse',
        target_schema= 'dbt_alima',
        unique_key = 'id',

        strategy = 'check',
        check_cols = ['status', 'paymentmethod'],
    )
}}

select *
from {{ source("stripe","payment")}}

{% endsnapshot %}