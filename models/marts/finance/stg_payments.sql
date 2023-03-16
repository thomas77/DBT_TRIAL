{{ config(alias='stg_payments_alias') }}


with payments as (

select id,
       orderid,
       paymentmethod,
       status,
       created,
       amount  from {{ source('stripe', 'payment') }}

)

select * from payments