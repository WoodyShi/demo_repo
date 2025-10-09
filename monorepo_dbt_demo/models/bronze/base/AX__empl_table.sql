{{config(
    materialized='view',
    schema='bronze',
)}}

with source_data as (
    select
        *
    from {{ source('ax', 'EMPLTABLE') }} 
),
renamed as (
select 
    name as vendorname,
    countryregionid as countryregionid
from source_data
)

select 
    *
from renamed