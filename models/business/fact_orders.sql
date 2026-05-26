with lineitem_enriched as (

    select * from {{ ref('int_lineitem_enriched') }}

),

orders_enriched as (

    select * from {{ ref('int_orders_enriched') }}

),

final as (

    select
        lineitem_enriched.lineitem_key as fact_key,
        lineitem_enriched.order_key,
        lineitem_enriched.part_key,
        lineitem_enriched.supplier_key,
        orders_enriched.customer_key,
        orders_enriched.order_date as date_key,
        lineitem_enriched.ship_date,
        lineitem_enriched.quantity,
        lineitem_enriched.extended_price,
        lineitem_enriched.discount,
        lineitem_enriched.tax,
        lineitem_enriched.discount_amount,
        lineitem_enriched.discounted_price as net_amount,
        lineitem_enriched.total_charge as gross_amount,
        lineitem_enriched.delivery_days,
        lineitem_enriched.ship_delay_days,
        lineitem_enriched.return_flag,
        lineitem_enriched.return_status_desc,
        lineitem_enriched.line_status,
        lineitem_enriched.ship_mode,
        orders_enriched.order_status,
        orders_enriched.order_status_desc,
        orders_enriched.order_priority,
        orders_enriched.priority_category
    from lineitem_enriched
    inner join orders_enriched using (order_key)

)

select * from final