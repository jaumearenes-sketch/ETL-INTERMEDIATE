with orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        order_key,
        customer_key,
        order_status,
        total_price,
        order_date,
        order_priority,
        clerk,
        ship_priority,
        comment,
        case order_status
            when 'O' then 'Open'
            when 'F' then 'Fulfilled'
            when 'P' then 'Pending'
            else 'Unknown'
        end as order_status_desc,
        case
            when order_priority like '1-%' then 'high'
            when order_priority like '2-%' then 'high'
            when order_priority like '3-%' then 'medium'
            when order_priority like '4-%' then 'low'
            when order_priority like '5-%' then 'low'
            else 'unknown'
        end as priority_category
    from orders

)

select * from final
