with
    renamed as (
        select
            businessentityid
            , creditcardid
        from {{ source('adventure_works','personcreditcard') }} as source
    ) 
select *
from renamed
