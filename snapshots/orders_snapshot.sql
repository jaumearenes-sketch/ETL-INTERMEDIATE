{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='O_ORDERKEY',
      strategy='check',
      check_cols=[
        'O_CUSTKEY',
        'O_ORDERSTATUS',
        'O_TOTALPRICE',
        'O_ORDERDATE',
        'O_ORDERPRIORITY',
        'O_CLERK',
        'O_SHIPPRIORITY',
        'O_COMMENT'
      ]
    )
}}

select
    O_ORDERKEY,
    O_CUSTKEY,
    O_ORDERSTATUS,
    O_TOTALPRICE,
    O_ORDERDATE,
    O_ORDERPRIORITY,
    O_CLERK,
    O_SHIPPRIORITY,
    O_COMMENT
from {{ source('tpch', 'ORDERS') }}

{% endsnapshot %}
