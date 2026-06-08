{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    fact_key,
    return_flag,
    line_status,
    order_status,
    priority_category
from {{ ref('fact_orders') }}
where return_flag not in ('A', 'N', 'R')
   or line_status not in ('F', 'O')
   or order_status not in ('F', 'O', 'P')
   or priority_category not in ('high', 'medium', 'low')
   or return_flag is null
   or line_status is null
   or order_status is null
   or priority_category is null
