/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with locations as (

    select location_id
    ,country_name
    from {{ ref('stg_locations') }}
)

select * from locations

/*
    Uncomment the line below to remove records with null `id` values
*/