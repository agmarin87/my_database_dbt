with source as (
    select * 
    ,{{ dbt.current_timestamp() }} as dbt_updated_at
    ,current_user() as dbt_updated_by
    from {{ ref('orders') }}
)

SELECT * FROM source