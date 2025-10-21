
    
    

select
    COUNTRYREGIONID as unique_field,
    count(*) as n_records

from "memory"."main_bronze"."AX__address_country_region"
where COUNTRYREGIONID is not null
group by COUNTRYREGIONID
having count(*) > 1


