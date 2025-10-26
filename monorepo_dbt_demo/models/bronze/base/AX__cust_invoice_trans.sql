{{ config(
    materialized='view',
    schema='bronze',
) }}

with source_data as (
    select *
    from {{ source('ax', 'CUSTINVOICETRANS') }}
),

renamed as (
    select
        rec_id,
        invoice_id,
        dimension3_ as erp_industry
    from source_data
)

select *
from renamed
