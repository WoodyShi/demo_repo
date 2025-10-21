

with source_data as (
    select
        *
    from "ax"."ax"."CUSTTABLE" 
),
renamed as (
select 
    name as vendorname,
    countryregionid as countryregionid
from source_data
)

select 
    *
from renamed