with
    renamed as (
        select
            businessentityid
            , addressid
        from {{ source('adventure_works','businessentityaddress') }} as source
    ) 
select *
from renamed
