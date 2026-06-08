with orders_snapshot as (

    select *
    from {{ ref('orders_snapshot') }}

)

select
    O_ORDERKEY as order_key,
    O_CUSTKEY as customer_key,
    O_ORDERSTATUS as order_status,
    O_TOTALPRICE as total_price,
    O_ORDERDATE as order_date,
    O_ORDERPRIORITY as order_priority,
    O_CLERK as clerk,
    O_SHIPPRIORITY as ship_priority,
    O_COMMENT as comment,
    dbt_scd_id,
    dbt_updated_at,
    dbt_valid_from,
    dbt_valid_to
from orders_snapshot
where dbt_valid_to is null
