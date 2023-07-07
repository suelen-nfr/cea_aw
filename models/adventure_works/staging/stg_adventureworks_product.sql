with
    renamed as (
        select
            productid
            , productmodelid
            , productsubcategoryid
            , name as productname
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
        from {{ source('adventure_works','product') }} as source
    ) 
select *
from renamed
