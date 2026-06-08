{{ config(
    severity='error',
    error_if='>0',
    warn_if='>0',
    store_failures=true
) }}

select
    lineitem_key,
    return_flag,
    return_status_desc
from {{ ref('int_lineitem_enriched') }}
where (return_flag = 'R' and return_status_desc <> 'Returned')
   or (return_flag = 'A' and return_status_desc <> 'Approved return adjustment')
   or (return_flag = 'N' and return_status_desc <> 'Not returned')
   or (return_flag not in ('R', 'A', 'N'))
   or return_flag is null
