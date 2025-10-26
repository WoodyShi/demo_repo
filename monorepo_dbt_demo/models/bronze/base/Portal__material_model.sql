{{ config(
    materialized='view',
    schema='bronze',
) }}

with source_data as (
    select *
    from {{ source('portal', 'material_model') }}
),

renamed as (
    select
        tec_marketcode_id,
        salesid
    from source_data
)

select *
from renamed
