{{ config(
    materialized='view',
    schema='bronze',
) }}

with source_data as (
    select *
    from {{ source('ax', 'ADDRESSCOUNTRYREGION') }}
),

renamed as (
    select name as vendor_country
    from source_data
)

select *
from renamed
