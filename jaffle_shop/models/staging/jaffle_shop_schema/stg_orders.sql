    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

--calling the source in src_jaffle_shop.yml (source_name, table_name)
    from {{ source('jaffle_shop','orders') }}

    {{ limit_data_in_dev('order_date', 10000) }} {# compile a macro with a where command (where order_date>= dateadd('day', -3, current_timestamp)) #}
                                                {# Optional sintaxe to make easy to ready:  {{ limit_data_in_dev(column_name = 'order_date', days_of_data = 1000) }} #}

                                            