/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with orders as (

    select stg_orders.order_id
    ,stg_orders.customer_name
    ,customers.customer_id -- Using stg_orders.customer_name to join with dim_customers and bring in customer_id.
    ,stg_orders.product
    ,products.product_id as product_id -- Using stg_orders.product to join with dim_products and bring in product_id.
    ,stg_orders.quantity
    ,stg_orders.price
    ,stg_orders.order_date
    from {{ ref('stg_orders') }} stg_orders
    left join {{ ref('dim_customers') }} as customers on stg_orders.customer_name = customers.name
    left join {{ ref('dim_products') }} as products on stg_orders.product = products.product_name
)

select orders.order_id as order_id
    ,orders.customer_id as customer_id
    ,orders.product_id as product_id
    ,orders.product as product
    ,orders.quantity as quantity
    ,orders.price as price
    ,orders.order_date as order_date
    ,customers.name as customer_name
    ,customers.location_id as customer_location_id
    ,locations.country_name as customer_country_name
    ,customers.address as customer_address
    ,customers.phone_number as customer_phone_number
from orders
left join {{ ref('dim_customers') }} as customers on orders.customer_id = customers.customer_id
left join {{ ref('dim_locations') }} as locations on customers.location_id = locations.location_id
left join {{ ref('dim_products') }} as products on orders.product_id = products.product_id