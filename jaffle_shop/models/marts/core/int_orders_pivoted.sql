--Pivoting a table with SQL
{#
    with payments as (
        select * from {{ref('stg_payments')}}
    ),
    pivoted as (
        select 
            order_id,
            sum(case when payment_method = 'bank_transfer' then amount else 0 end) as bank_tranfer_amount,
            sum(case when payment_method = 'credit_card' then amount else 0 end) as credit_card_amount,
            sum(case when payment_method = 'coupon' then amount else 0 end) as coupon_amount,
            sum(case when payment_method = 'gift_card' then amount else 0 end) as gift_card_amount,
            sum(case when payment_method = 'gift_card' then amount else 0 end) as bitcoin_amount
        from payments
        where status = 'success'
        group by 1       
    )
    select *
    from pivoted
#}

---------------
---------------
---------------

    --Pivoting a table with Jinja
    {% set payment_methods = ['bank_transfer','credit_card', 'coupon', 'gift_card', 'bitcoin'] -%}
    
    with payments as (
        select * from {{ref('stg_payments')}}
    ),
    pivoted as (
        select 
            order_id,
            {% for payment_method in payment_methods %}
            sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount 
            {%- if not loop.last -%}
                ,
            {%- endif -%}
            
            {% endfor %}

        from payments
        where status = 'success'
        group by 1       
    )
    select *
    from pivoted