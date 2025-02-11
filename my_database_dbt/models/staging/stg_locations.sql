with source as (
    select * from {{ ref('locations') }}
)

SELECT * FROM source