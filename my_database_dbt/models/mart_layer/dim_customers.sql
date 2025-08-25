/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with customers as (

    select {{ dbt_utils.generate_surrogate_key(['name']) }} as customer_id
    ,name
    ,location_id
    ,address
    ,phone_number
    from {{ ref('stg_customers') }}
)

select * from customers