with
    source_product as (
        select
            productid
            , productname
        from {{ ref('stg_adventureworks_product')}}
    )
    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_sk
            , productid
            , productname
        from source_product
    )
select *
from final
