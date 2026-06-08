{% snapshot customer_snapshot %}

{{
    config(
      target_database='TPCH_DWH',
      target_schema='SNAPSHOTS',
      unique_key='C_CUSTKEY',
      strategy='check',
      check_cols=[
        'C_NAME',
        'C_ADDRESS',
        'C_NATIONKEY',
        'C_PHONE',
        'C_ACCTBAL',
        'C_MKTSEGMENT',
        'C_COMMENT'
      ]
    )
}}

select
    C_CUSTKEY,
    C_NAME,
    C_ADDRESS,
    C_NATIONKEY,
    C_PHONE,
    C_ACCTBAL,
    C_MKTSEGMENT,
    C_COMMENT
from {{ source('tpch', 'CUSTOMER') }}

{% endsnapshot %}
