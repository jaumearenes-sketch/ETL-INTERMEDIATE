{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    fact_key,
    quantity,
    extended_price,
    discount,
    tax,
    discount_amount,
    net_amount,
    gross_amount
from {{ ref('fact_orders') }}
where quantity <= 0
   or extended_price < 0
   or discount < 0
   or discount > 1
   or tax < 0
   or net_amount < 0
   or gross_amount < 0
