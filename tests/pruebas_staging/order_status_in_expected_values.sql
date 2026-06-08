{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    order_key,
    order_status
from {{ ref('stg_orders') }}
where order_status not in ('F', 'O', 'P')
   or order_status is null
