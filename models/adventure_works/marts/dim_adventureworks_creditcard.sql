with
    source_creditcard as (
        select
            creditcardid
            , cardtype
            , cardnumber
        from {{ ref('stg_adventureworks_creditcard')}}
    )
    , source_personcreditcard as (
        select
            businessentityid
            , creditcardid
        from {{ ref('stg_adventureworks_personcreditcard') }}
    )
    , joined as (
        select
            pc.businessentityid
            , sc.creditcardid
            , sc.cardtype
            , sc.cardnumber
        from source_creditcard as sc
        left join source_personcreditcard as pc on sc.creditcardid = pc.creditcardid
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_sk
            , businessentityid
            , creditcardid
            , cardtype
            , cardnumber
        from joined
    )
select *
from final
