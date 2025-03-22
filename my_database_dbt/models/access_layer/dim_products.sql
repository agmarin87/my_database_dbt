/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with products as (

    select distinct product
    from {{ ref('stg_orders') }}
)

select {{ dbt_utils.generate_surrogate_key(['products.product']) }} as product_id
,products.product as product
from products

/*
    Uncomment the line below to remove records with null `id` values
*/