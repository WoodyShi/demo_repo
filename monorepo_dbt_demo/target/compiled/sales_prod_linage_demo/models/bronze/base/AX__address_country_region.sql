

with source_data as (
    select
        *
    from "ax"."ax"."ADDRESSCOUNTRYREGION" 
),
renamed as (
select 
    name as vendor_country
from source_data
)

select 
    *
from renamed