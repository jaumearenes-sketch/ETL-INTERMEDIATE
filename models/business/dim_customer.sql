SELECT
    c.customer_key,
    c.customer_name,
    c.address,
    c.phone,
    c.account_balance,
    c.market_segment,
    n.nation_name,
    r.region_name
    --comentario para slim ci //--
FROM {{ ref('stg_customer') }} c
LEFT JOIN {{ ref('stg_nation') }} n ON c.nation_key = n.nation_key
LEFT JOIN {{ ref('stg_region') }} r ON n.region_key = r.region_key
