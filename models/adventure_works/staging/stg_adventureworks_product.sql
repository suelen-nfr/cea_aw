with
    renamed as (
        select
            productid
            , productmodelid
            , productsubcategoryid
            , productnumber
            , name as productname
            , productline
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , daystomanufacture
            , sellstartdate
            , sellenddate
            , discontinueddate
        from {{ source('adventure_works','product') }} as source
    ) 
select *
from renamed
