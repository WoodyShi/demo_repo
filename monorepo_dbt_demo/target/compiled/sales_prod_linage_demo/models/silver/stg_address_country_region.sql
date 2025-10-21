

with address_region as (
    select
        *
    from "memory"."main_bronze"."AX__address_country_region" 
),
address_region as (
select 
    name as vendor_country
from source_data
)

select 
    *
from address_region