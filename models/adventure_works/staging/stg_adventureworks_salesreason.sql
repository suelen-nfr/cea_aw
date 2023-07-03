with
    renamed as (
        select
            salesreasonid
            , name as reason
            , reasontype
        from {{ source('adventure_works','salesreason') }} as source
    ) 
select *
from renamed
