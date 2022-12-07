
/*This block creates a table (insteade of a view)
{{ config (
    materialized="table"
)}}

Another option is put a standard way to create a table in dbt_project.yml for each folder
*/
with customers as (

    select * 
    from {{ ref('stg_customers') }}
),

orders as (

    select * 
    from {{ ref('stg_orders') }}
),

fct_orders as (

    select * 
    from {{ ref('fct_orders') }}

),

customer_orders as (

    select
        o.customer_id,
        min(o.order_date) as first_order_date,
        max(o.order_date) as most_recent_order_date,
        count(o.order_id) as number_of_orders,
        sum(fo.amount)    as lifetime_value

    from orders             as o
    left join fct_orders    as fo
        on o.customer_id = fo.customer_id

    group by 1

), 

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        coalesce(customer_orders.lifetime_value, 0) as lifetime_value

    from customers

    left join customer_orders using (customer_id)

)

select * from final