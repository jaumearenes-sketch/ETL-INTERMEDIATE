SELECT
    S_SUPPKEY AS supplier_key,
    S_NAME AS supplier_name,
    S_ADDRESS AS address,
    S_NATIONKEY AS nation_key,
    S_PHONE AS phone,
    S_ACCTBAL AS account_balance,
    S_COMMENT AS comment
FROM {{ source('tpch', 'SUPPLIER') }}