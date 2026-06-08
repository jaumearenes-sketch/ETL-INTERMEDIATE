-- snapshots/orders_snapshot.sql
{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='O_ORDERKEY',
      strategy='check',
      check_cols=['O_ORDERSTATUS', 'O_TOTALPRICE']
    )
}}

SELECT * FROM {{ source('tpch', 'ORDERS') }}

{% endsnapshot %}