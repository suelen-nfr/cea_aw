with
    renamed as (
        select
            businessentityid
            , persontype
            , title
            , concat(firstname, ' ', middlename, ' ', lastname) as completename
            , emailpromotion
        from {{ source('adventure_works','person') }} as source
    ) 
select *
from renamed
