

select
    a.*,
    b.InvoiceId,
    c.AccountNum,
    d.Name as SalesPerson,
    e.InventLocationId,
    f.CurrencyCode,
    g.vendor_country
from "memory"."main_silver"."stg_address_country_region" as a
left join "memory"."main_bronze"."AX__tec_product_classify" as b
left join "memory"."main_bronze"."Portal__product_component" as c
left join "memory"."main_bronze"."Portal__material_model" as d
left join "memory"."main_bronze"."Portal__material_code" as e
left join "memory"."main"."JL__product_class_map" as f
left join "memory"."main"."Material__rd_material_portal" as g