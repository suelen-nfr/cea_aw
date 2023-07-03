with
    renamed as (
        select
            customerid
            , personid
            , storeid
            , territoryid
        from {{ source('adventure_works','customer') }} as source
    ) 
select *
from renamed
