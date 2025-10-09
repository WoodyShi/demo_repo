{{config(
    materialized='view',
    schema='bronze',
)}}

with source_data as (
    select
        *
    from {{ source('ax', 'SALESTABLE') }} 
),
renamed as (
select 
    TEC_MARKETCODE_id as TEC_MARKETCODE_id,
    salesid as salesid
from source_data
)

select 
    *
from renamed