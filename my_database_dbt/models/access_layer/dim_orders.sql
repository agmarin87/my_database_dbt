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

select * from orders

/*
    Uncomment the line below to remove records with null `id` values
*/