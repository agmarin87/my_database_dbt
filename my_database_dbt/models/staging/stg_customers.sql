with source as (
    select * from {{ ref('customers') }}
)

SELECT * FROM source