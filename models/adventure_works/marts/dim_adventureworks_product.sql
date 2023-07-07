with
    source_product as (
        select
            productid
            , productmodelid
            , productsubcategoryid
            , productname
            , productline
            , productnumber
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , daystomanufacture
            , sellstartdate
            , sellenddate
            , discontinueddate
        from {{ ref('stg_adventureworks_product')}}
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_sk
            , productid
            , productmodelid
            , productsubcategoryid
            , productname
            , productline
            , productnumber
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , daystomanufacture
            , sellstartdate
            , sellenddate
            , discontinueddate
        from source_product
    )
select *
from final
