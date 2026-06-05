{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    order_key,
    order_status,
    order_status_desc,
    order_priority,
    priority_category
from {{ ref('int_orders_enriched') }}
where order_status_desc = 'Unknown'
   or priority_category = 'unknown'
