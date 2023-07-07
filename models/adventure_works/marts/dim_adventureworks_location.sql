{{
    config(
      materialized = 'table'
    )
}}

with 
    source_businessentity as (
        select
            businessentityid
            , addressid
        from {{ ref('stg_adventureworks_businessentityaddress')}}
    )
    , source_address as (
        select
            addressid
            , stateprovinceid
            , addressline1
            , addressline2
            , city
        from {{ ref('stg_adventureworks_address') }}    
    )
    , source_state as (
        select
            stateprovinceid
            , stateprovince            
            , countryregioncode
        from {{ ref('stg_adventureworks_stateprovince') }}
    )
    , source_country as (
        select
            countryregioncode
            , country
        from {{ ref('stg_adventureworks_countryregion') }}    
    )
    , joined as (
        select
            sb.businessentityid
            , sa.addressid
            , ss.stateprovinceid
            , sc.countryregioncode
            , sa.addressline1
            , sa.addressline2
            , sa.city
            , ss.stateprovince
            , sc.country
        from source_businessentity as sb
        left join source_address as sa on sb.addressid = sa.addressid
        left join source_state as ss on sa.stateprovinceid = ss.stateprovinceid
        left join source_country as sc on ss.countryregioncode = sc.countryregioncode
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['addressid', 'stateprovinceid', 'countryregioncode']) }} as location_sk
            , businessentityid
            , addressid
            , stateprovinceid
            , countryregioncode
            , addressline1
            , addressline2
            , city
            , stateprovince
            , country
        from joined
    )
select *
from final
