{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    lineitem_key,
    ship_date,
    commit_date,
    receipt_date,
    delivery_days,
    ship_delay_days
from {{ ref('int_lineitem_enriched') }}
where receipt_date < ship_date
   or receipt_date < commit_date
