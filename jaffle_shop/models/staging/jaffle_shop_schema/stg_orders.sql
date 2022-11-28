    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

--calling the source in src_jaffle_shop.yml (source_name, table_name)
    from {{ source('jaffle_shop','orders') }}