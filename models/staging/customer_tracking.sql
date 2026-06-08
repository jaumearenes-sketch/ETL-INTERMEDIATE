with customer_snapshot as (

    select *
    from {{ ref('customer_snapshot') }}

)

select
    C_CUSTKEY as customer_key,
    C_NAME as customer_name,
    C_ADDRESS as address,
    C_NATIONKEY as nation_key,
    C_PHONE as phone,
    C_ACCTBAL as account_balance,
    C_MKTSEGMENT as market_segment,
    C_COMMENT as comment,
    dbt_scd_id,
    dbt_updated_at,
    dbt_valid_from,
    dbt_valid_to
from customer_snapshot
where dbt_valid_to is null
