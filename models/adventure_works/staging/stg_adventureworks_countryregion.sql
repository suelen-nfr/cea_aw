with
    renamed as (
        select
            countryregioncode
            , name as country
        from {{ source('adventure_works','countryregion') }} as source
    ) 
select *
from renamed
