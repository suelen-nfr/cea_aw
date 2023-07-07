with
    source_reason as (
        select
            salesreasonid
            , reason
            , reasontype
        from {{ ref('stg_adventureworks_salesreason')}}
    )
    , source_orderreason as (
        select
            salesorderid
            , salesreasonid
        from {{ ref('stg_adventureworks_salesorderheadersalesreason') }}
    )
    , joined as (
        select
            sr.salesreasonid
            , sor.salesorderid
            , sr.reason
            , sr.reasontype
        from source_reason as sr
        left join source_orderreason as sor on sr.salesreasonid = sor.salesreasonid
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesreasonid', 'salesorderid']) }} as reason_sk
            , salesreasonid
            , salesorderid
            , reason
            , reasontype
        from joined
    )
select *
from final
