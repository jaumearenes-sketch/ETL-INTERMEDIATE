-- Fact table for orders and line items

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

order_date_dim as (

    select date_key from {{ ref('dim_date') }}

),

ship_date_dim as (

    select date_key from {{ ref('dim_date') }}

),

commit_date_dim as (

    select date_key from {{ ref('dim_date') }}

),

receipt_date_dim as (

    select date_key from {{ ref('dim_date') }}

),

final as (

    select
        lineitem_enriched.lineitem_key as fact_key,
        lineitem_enriched.order_key,
        part.part_key,
        supplier.supplier_key,
        customer.customer_key,
        order_date_dim.date_key as order_date_key,
        ship_date_dim.date_key as ship_date_key,
        commit_date_dim.date_key as commit_date_key,
        receipt_date_dim.date_key as receipt_date_key,
        lineitem_enriched.line_number,
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
    inner join order_date_dim on orders_enriched.order_date = order_date_dim.date_key
    inner join ship_date_dim on lineitem_enriched.ship_date = ship_date_dim.date_key
    inner join commit_date_dim on lineitem_enriched.commit_date = commit_date_dim.date_key
    inner join receipt_date_dim on lineitem_enriched.receipt_date = receipt_date_dim.date_key

)

select * from final
