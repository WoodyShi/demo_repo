{{ config(
    materialized='view',
    schema='bronze',
) }}

with source_data as (
    select *
    from {{ source('portal', 'product_component') }}
),

renamed as (
    select
        tec_marketcode_id,
        salesid
    from source_data
)

select *
from renamed
