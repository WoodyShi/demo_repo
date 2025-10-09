{{config(
    materialized='table',
    schema='gold',
    tags=['sales', 'finance']
)}}

select
    a.*,
    b.InvoiceId,
    c.AccountNum,
    d.Name as SalesPerson,
    e.InventLocationId,
    f.CurrencyCode,
    g.vendor_country
from {{  ref('stg_address_country_region')  }} as a
left join {{  ref('AX__tec_product_classify')  }} as b
left join {{  ref('Portal__product_component')  }} as c
left join {{  ref('Portal__material_model')  }} as d
left join {{  ref('Portal__material_code')  }} as e
left join {{  ref('JL__product_class_map')  }} as f
left join {{  ref('Material__rd_material_portal')  }} as g