with
    customers as (select * from {{ ref("stg_customer") }}),

    customer_purchases as (select * from {{ ref("stg_customer_purchases") }}),

    products as (select * from {{ ref("dim_products") }}),

    final as (

        select
            customers.id_customer,
            customers.email,
            products.product_id,
            products.product_name,
            customer_purchases.id_purchase,
            customer_purchases.amount
        from customers
        inner join
            customer_purchases on customers.id_customer = customer_purchases.id_customer
        inner join products on products.product_id = customer_purchases.id_product

    )

select *
from final
