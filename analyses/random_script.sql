
select
    fact_key,
    extended_price,
    discount,
from {{ ref('fact_orders') }}

