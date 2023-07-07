with
    renamed as (
        select
            stateprovinceid
            , territoryid
            , name as stateprovince            
            , stateprovincecode
            , countryregioncode
        from {{ source('adventure_works','stateprovince') }} as source
    ) 
select *
from renamed
