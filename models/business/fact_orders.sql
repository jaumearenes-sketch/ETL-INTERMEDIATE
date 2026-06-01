with lineitem_enriched as (

    select * from {{ ref('int_lineitem_enriched') }}

),

orders_enriched as (

    select * from {{ ref('int_orders_enriched') }}

),

customer as (

    select customer_key from {{ ref('dim_customer') }}

),

part as (

    select part_key from {{ ref('dim_part') }}

),

supplier as (

    select supplier_key from {{ ref('dim_supplier') }}

),

date_dim as (

    select date_key from {{ ref('dim_date') }}

),

final as (

    select
        lineitem_enriched.lineitem_key as fact_key,
        lineitem_enriched.order_key,
        part.part_key,
        supplier.supplier_key,
        customer.customer_key,
        date_dim.date_key,
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
    inner join customer on orders_enriched.customer_key = customer.customer_key
    inner join part on lineitem_enriched.part_key = part.part_key
    inner join supplier on lineitem_enriched.supplier_key = supplier.supplier_key
    inner join date_dim on orders_enriched.order_date = date_dim.date_key

)

select * from final
