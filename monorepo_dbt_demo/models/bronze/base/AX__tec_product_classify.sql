{{ config(
    materialized='view',
    schema='bronze',
) }}

with source_data as (
    select *
    from {{ source('ax', 'TEC_PRODUCTCLASSIFY') }}
),

renamed as (
    select
        tec_marketcode_id,
        marketcodeid as brand_marketcode,
        region,
        name as brandname
    from source_data
)

select *
from renamed
