with
    renamed as (
        select
            salesorderid
            , carriertrackingnumber
            , orderqty
            , productid
            , specialofferid
            , unitprice
            , unitpricediscount
        from {{ source('adventure_works','salesorderdetail') }} as source
    ) 
select *
from renamed
