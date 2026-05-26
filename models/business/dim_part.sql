SELECT
    p.part_key,
    p.part_name,
    p.manufacturer,
    p.brand,
    p.type,
    p.size,
    p.container,
    p.retail_price
FROM {{ ref('stg_part') }} p