{{ config(
    materialized='table',
    schema='gold',
    tags=['tag1', 'tag2']
) }}


with invent_table as (
    select * from {{ ref('AX__invent_table') }}
),

customer_invoice_transaction as (
    select * from {{ ref('AX__cust_invoice_trans') }}
),

customers as (
    select * from {{ ref('AX__cust_table') }}
),

employees as (
    select * from {{ ref('AX__empl_table') }}
),

dim_inventories as (
    select * from {{ ref('AX__invent_dim') }}
),

sales as (
    select * from {{ ref('AX__sales_table') }}
),

dim_tec_market_codes as (
    select * from {{ ref('AX__tec_marketcode') }}
)

select
    invent_table.*,
    customer_invoice_transaction.invoiceid,
    customers.accountnum,
    employees.name as salesperson,
    dim_inventories.inventlocationid,
    sales.currencycode,
    dim_tec_market_codes.vendor_country
from invent_table
left join customer_invoice_transaction
    on invent_table.key = customer_invoice_transaction.key
left join customers
    on invent_table.key = customers.key
left join employees
    on invent_table.key = employees.key
left join dim_inventories
    on invent_table.key = dim_inventories.key
left join sales
    on invent_table.key = sales.key
left join dim_tec_market_codes
    on invent_table.key = dim_tec_market_codes.key
