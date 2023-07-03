with
    renamed as (
        select
            addressid
            , stateprovinceid
            , concat(addressline1,' ',addressline2) as address
            , city
            , postalcode
        from {{ source('adventure_works','address') }} as source
    ) 
select *
from renamed
