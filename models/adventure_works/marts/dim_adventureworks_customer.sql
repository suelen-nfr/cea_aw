{{
    config(
      materialized = 'table'
    )
}}

with
    source_customer as (
        select
            customerid
            , personid
            , storeid
            , territoryid
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
            , emailpromotion
        from {{ ref('stg_adventureworks_person') }}
    )
    , joined as (
        select
            sc.customerid
            , sc.personid
            , sc.storeid
            , sc.territoryid
            , sp.businessentityid
            , sp.persontype
            , sp.title
            , sp.firstname
            , sp.middlename
            , sp.lastname
            , sp.emailpromotion
        from source_customer as sc
        left join source_person as sp on sc.personid = sp.businessentityid
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['customerid', 'personid']) }} as customer_sk
            , customerid
            , personid
            , storeid
            , territoryid
            , businessentityid
            , persontype
            , title
            , firstname
            , middlename
            , lastname
            , emailpromotion
        from joined
    )
select *
from final
