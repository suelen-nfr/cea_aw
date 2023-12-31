with
    dim_creditcard as (
        select
            creditcard_sk
            , creditcardid
        from {{ ref('dim_adventureworks_creditcard') }}
    )
    , dim_customer as (
        select
            customer_sk
            , businessentityid
            , customerid
        from {{ ref('dim_adventureworks_customer') }}
    )
    , dim_location as (
        select
            location_sk
            , addressid
        from {{ ref('dim_adventureworks_location') }}
    )
    , dim_calendar as (
        select metric_date  
        from {{ ref('dim_calendar') }}
    )
    , fact_orderheader as (
        select
            salesorderid
            , customerid
            , shiptoaddressid
            , creditcardid
            , orderstatus
            , subtotal
            , taxamt
            , freight
            , totaldue
            , metric_date
            , duedate
            , shipdate
        from {{ ref('stg_adventureworks_salesorderheader') }}
    )
    , join_sk as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'fact_orderheader.salesorderid'
                , 'dim_creditcard.creditcard_sk'
                , 'dim_customer.customer_sk'
                , 'dim_location.location_sk'
            ]) }} as orderheader_sk
            , dim_creditcard.creditcard_sk as creditcard_fk
            , dim_customer.customer_sk as customer_fk
            , dim_location.location_sk as location_fk
            , dim_calendar.metric_date
            , fact_orderheader.salesorderid
            , fact_orderheader.customerid
            , fact_orderheader.shiptoaddressid
            , fact_orderheader.creditcardid
            , fact_orderheader.orderstatus
            , fact_orderheader.subtotal
            , fact_orderheader.taxamt
            , fact_orderheader.freight
            , fact_orderheader.totaldue
            , fact_orderheader.duedate
            , fact_orderheader.shipdate
        from fact_orderheader
        left join dim_creditcard on fact_orderheader.creditcardid = dim_creditcard.creditcardid
        left join dim_customer on fact_orderheader.customerid = dim_customer.customerid
        left join dim_location on fact_orderheader.shiptoaddressid = dim_location.addressid
        left join dim_calendar on fact_orderheader.metric_date = dim_calendar.metric_date
    )
select *
from join_sk
