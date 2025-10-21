

select
    a.*,
    b.InvoiceId,
    c.AccountNum,
    d.Name as SalesPerson,
    e.InventLocationId,
    f.CurrencyCode,
    g.vendor_country
from "memory"."main_bronze"."AX__invent_table" as a
left join "memory"."main_bronze"."AX__cust_invoice_trans" as b
left join "memory"."main_bronze"."AX__cust_table" as c
left join "memory"."main_bronze"."AX__empl_table" as d
left join "memory"."main_bronze"."AX__invent_dim" as e
left join "memory"."main_bronze"."AX__sales_table" as f
left join "memory"."main_bronze"."AX__tec_marketcode" as g