{{ config(
    severity='error',
    error_if='>10',
    warn_if='>0',
    fail_calc='count(*)',
    store_failures=true
) }}

select
    fact_key,
    extended_price,
    discount,
    tax,
    discount_amount,
    net_amount,
    gross_amount
from {{ ref('fact_orders') }}
where abs(discount_amount - (extended_price * discount)) > 0.01
   or abs(net_amount - (extended_price * (1 - discount))) > 0.01
   or abs(gross_amount - (extended_price * (1 - discount) * (1 + tax))) > 0.01
