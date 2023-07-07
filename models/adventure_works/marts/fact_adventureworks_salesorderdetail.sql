with
    dim_product as (
        select
            product_sk
            , productid
        from {{ ref('dim_adventureworks_product') }}
    )
    , dim_reason as (
        select
            reason_sk
            , salesorderid
            , salesreasonid
        from {{ ref('dim_adventureworks_reason') }}
    )
    , fact_orderdetails as (
        select    
            salesorderid
            , productid
            , specialofferid
            , carriertrackingnumber
            , orderqty
            , unitprice
            , unitpricediscount
        from {{ ref('stg_adventureworks_salesorderdetail') }}
    )
    , join_sk as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'fact_orderdetails.salesorderid'
                , 'dim_product.product_sk'
                , 'dim_reason.reason_sk'
            ]) }} as orderdetails_sk
            , dim_product.product_sk as product_fk
            , dim_reason.reason_sk as reason_fk
            , fact_orderdetails.salesorderid
            , fact_orderdetails.productid
            , fact_orderdetails.specialofferid
            , fact_orderdetails.carriertrackingnumber
            , fact_orderdetails.orderqty
            , fact_orderdetails.unitprice
            , fact_orderdetails.unitpricediscount
        from fact_orderdetails
        left join dim_product on fact_orderdetails.productid = dim_product.productid
        left join dim_reason on fact_orderdetails.salesorderid = dim_reason.salesorderid
    )
select *
from join_sk
