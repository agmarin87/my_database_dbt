{{ config(materialized='table') }}

with products as (

    select {{ dbt_utils.generate_surrogate_key(['product_name']) }} as product_id
    ,product_name
    from {{ ref('stg_products') }}
)

select * from products