SELECT
    R_REGIONKEY AS region_key,
    R_NAME AS region_name,
    R_COMMENT AS comment
FROM {{ source('tpch', 'REGION') }}