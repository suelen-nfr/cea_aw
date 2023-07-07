with
    renamed as (
        select
            businessentityid
            , persontype
            , title
            , concat(firstname,' ',lastname) as fullname
        from {{ source('adventure_works','person') }} as source
    ) 
select *
from renamed
