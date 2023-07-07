with
    source_customer as (
        select
            customerid
            , personid
        from {{ ref('stg_adventureworks_customer')}}
    )
    , source_person as (
        select
            businessentityid
            , persontype
            , title
            , firstname
            , middlename
            , lastname
        from {{ ref('stg_adventureworks_person') }}
    )
    , joined as (
        select
            sc.customerid
            , sc.personid
            , sp.businessentityid
            , sp.persontype
            , sp.title
            , sp.firstname
            , sp.middlename
            , sp.lastname
        from source_customer as sc
        left join source_person as sp on sc.personid = sp.businessentityid
        where personid is not null
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['customerid', 'personid']) }} as customer_sk
            , customerid
            , personid
            , businessentityid
            , persontype
            , title
            , firstname
            , middlename
            , lastname
        from joined
    )
select *
from final
