with
    renamed as (
        select
            salesorderid
            , productid
            , specialofferid
            , carriertrackingnumber
            , orderqty
            , unitprice
            , unitpricediscount
        from {{ source('adventure_works','salesorderdetail') }} as source
    ) 
select *
from renamed
