with
    renamed as (
        select
            salesorderid
            , customerid
            , orderdate
            , duedate
            , shipdate
            , status as orderstatus
            , accountnumber
            , territoryid
            , shiptoaddressid
            , shipmethodid
            , creditcardid
            , currencyrateid
            , subtotal
            , taxamt
            , freight
            , totaldue
        from {{ source('adventure_works','salesorderheader') }} as source
    ) 
select *
from renamed
