{{config(
    materialized='view',
    schema='silver',
)}}

with address_region as (
    select
        *
    from {{ ref('AX__address_country_region') }} 
),
address_region as (
select 
    {{ dbt_utils.generate_surrogate_key(['field_a', 'field_b']) }} as uuid,
    name as vendor_country,
    trim(itemid) as itemid
from source_data
)

select 
    *
from address_region

