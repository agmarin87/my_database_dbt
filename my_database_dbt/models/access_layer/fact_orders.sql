/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with orders as (

    select order_id
    ,customer_id
    ,product
    ,quantity
    ,price
    ,order_date
    from {{ ref('stg_orders') }}
)

select orders.order_id as order_id
    ,orders.customer_id as customer_id
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

/*
    Uncomment the line below to remove records with null `id` values
*/