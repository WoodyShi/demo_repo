

with source_data as (
    select
        *
    from "ax"."ax"."INVENTDIM" 
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