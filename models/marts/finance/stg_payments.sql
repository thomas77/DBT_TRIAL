with payments as (

select id,
       orderid,
       paymentmethod,
       status,
       created,
       amount  from {{ source('stripe', 'payment') }}

)

select * from payments