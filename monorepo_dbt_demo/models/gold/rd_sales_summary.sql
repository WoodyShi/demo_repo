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
from {{  ref('AX__invent_table')  }} as a
left join {{  ref('AX__cust_invoice_trans')  }} as b
left join {{  ref('AX__cust_table')  }} as c
left join {{  ref('AX__empl_table')  }} as d
left join {{  ref('AX__invent_dim')  }} as e
left join {{  ref('AX__sales_table')  }} as f
left join {{  ref('AX__tec_marketcode')  }} as g