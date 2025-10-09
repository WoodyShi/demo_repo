{{config(
    materialized='view',
    schema='bronze',
)}}

with source_data as (
    select
        *
    from {{ source('ax', 'TEC_PRODUCTCLASSIFY') }} 
),
renamed as (
select 
    TEC_MARKETCODE_id as TEC_MARKETCODE_id,
    MARKETCODEID as brand_marketcode,
    region as region,
    name as brandname
from source_data
)

select 
    *
from renamed