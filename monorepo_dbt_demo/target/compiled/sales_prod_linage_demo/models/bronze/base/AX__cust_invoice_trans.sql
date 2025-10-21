

with source_data as (
    select
        *
    from "ax"."ax"."CUSTINVOICETRANS" 
),
renamed as (
select 
    rec_id as rec_id,
    invoice_id as invoice_id,
    dimension3_ as erp_industry,
from source_data
)

select 
    *
from renamed