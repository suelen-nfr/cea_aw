with
    renamed as (
        select
            addressid
            , stateprovinceid
            , addressline1
            , addressline2
            , city
            , postalcode
        from {{ source('adventure_works','address') }} as source
    ) 
select *
from renamed
