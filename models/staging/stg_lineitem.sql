{{
    config(
        materialized='incremental',
        unique_key='lineitem_key',
        incremental_strategy='merge'
    )
}}

select
    l_orderkey || '-' || l_linenumber as lineitem_key,
    l_orderkey as order_key,
    l_partkey as part_key,
    l_suppkey as supplier_key,
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount,
    l_tax as tax,
    l_returnflag as return_flag,
    l_linestatus as line_status,
    l_shipdate as ship_date,
    l_commitdate as commit_date,
    l_receiptdate as receipt_date,
    l_shipinstruct as ship_instruct,
    l_shipmode as ship_mode,
    l_comment as comment
from {{ source('tpch', 'LINEITEM') }}

{% if is_incremental() %}
    where l_shipdate >= dateadd(
        day,
        -30,
        (
            select coalesce(max(ship_date), to_date('1900-01-01'))
            from {{ this }}
        )
    )
{% endif %}
