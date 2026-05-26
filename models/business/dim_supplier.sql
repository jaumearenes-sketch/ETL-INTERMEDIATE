SELECT
    s.supplier_key,
    s.supplier_name,
    s.address,
    s.phone,
    s.account_balance,
    n.nation_name,
    r.region_name
FROM {{ ref('stg_supplier') }} s
LEFT JOIN {{ ref('stg_nation') }} n ON s.nation_key = n.nation_key
LEFT JOIN {{ ref('stg_region') }} r ON n.region_key = r.region_key
