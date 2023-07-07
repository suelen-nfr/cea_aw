with
    renamed as (
        select
            businessentityid
            , persontype
            , title
            , firstname
            , middlename
            , lastname
        from {{ source('adventure_works','person') }} as source
    ) 
select *
from renamed
