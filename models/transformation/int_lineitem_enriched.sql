with lineitems as (

    select * from {{ ref('stg_lineitem') }}

),

final as (

    select
        lineitem_key,
        order_key,
        part_key,
        supplier_key,
        line_number,
        quantity,
        extended_price,
        discount,
        tax,
        return_flag,
        line_status,
        ship_date,
        commit_date,
        receipt_date,
        ship_instruct,
        ship_mode,
        comment,
        extended_price * discount as discount_amount,
        extended_price * (1 - discount) as discounted_price,
        extended_price * (1 - discount) * (1 + tax) as total_charge,
        datediff('day', ship_date, receipt_date) as delivery_days,
        datediff('day', commit_date, receipt_date) as ship_delay_days,
        case return_flag
            when 'R' then 'Returned'
            when 'A' then 'Approved return adjustment'
            when 'N' then 'Not returned'
            else 'Unknown'
        end as return_status_desc
    from lineitems

)

select * from final
