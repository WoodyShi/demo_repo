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
