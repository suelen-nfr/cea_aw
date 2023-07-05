with
    renamed as (
        select
            salesorderid
            , salesreasonid
        from {{ source('adventure_works','salesorderheadersalesreason') }} as source
    ) 
select *
from renamed
