with
    renamed as (
        select
            customerid
            , personid
        from {{ source('adventure_works','customer') }} as source
    ) 
select *
from renamed
