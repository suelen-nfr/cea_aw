with
    renamed as (
        select
            creditcardid
            , cardtype
            , cardnumber
        from {{ source('adventure_works','creditcard') }} as source
    ) 
select *
from renamed
