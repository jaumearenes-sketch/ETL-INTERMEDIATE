{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    lineitem_key,
    quantity,
    extended_price,
    discount,
    tax
from {{ ref('stg_lineitem') }}
where quantity <= 0
   or extended_price < 0
   or discount < 0
   or discount > 1
   or tax < 0
