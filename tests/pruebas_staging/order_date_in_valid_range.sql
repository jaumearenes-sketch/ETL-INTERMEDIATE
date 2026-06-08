{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    order_key,
    order_date
from {{ ref('stg_orders') }}
where order_date > current_date
   or order_date < to_date('1990-01-01')
