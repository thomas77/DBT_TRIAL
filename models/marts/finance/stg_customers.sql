
{{
    config(
        materialized='view'
    )
}}
with customers as(

select ID as ID_CLIENT,
UPPER(FIRST_NAME) as FIRST_NAME,
UPPER(LAST_NAME) as LAST_NAME,
EMAIL,
GENDER,
IP_ADDRESS from {{ source('raw', 'customers') }}

)

select * from customers