with
    renamed as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , name as stateprovince
            , territoryid
        from {{ source('adventure_works','stateprovince') }} as source
    ) 
select *
from renamed
