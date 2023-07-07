with
    renamed as (
        select
            salesorderid
            , customerid
            , territoryid
            , shiptoaddressid
            , shipmethodid
            , creditcardid
            , currencyrateid
            , status as orderstatus
            , accountnumber
            , subtotal
            , taxamt
            , freight
            , totaldue
            , cast(cast(source.orderdate as timestamp) as date) as metric_date
            , duedate
            , shipdate
        from {{ source('adventure_works','salesorderheader') }} as source
    ) 
select *
from renamed
