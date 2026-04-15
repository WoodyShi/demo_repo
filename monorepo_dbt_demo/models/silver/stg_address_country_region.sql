{{ config(
    materialized='view',
    schema='silver',
) }}

with address_region as (
    select
        a,
        b
    from {{ ref('AX__address_country_region') }}
),

address_region as (
    select
    -- {{ dbt_utils.generate_surrogate_key(['field_a', 'field_b']) }} as uuid,
        uuid,
        name as vendor_country,
        trim(itemid) as itemid
    from source_data
)

select
    a,
    b,
    c
from address_region
