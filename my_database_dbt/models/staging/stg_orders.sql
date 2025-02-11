with source as (
    select * from {{ ref('orders') }}
)

SELECT * FROM source