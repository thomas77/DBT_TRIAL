{{
    config(
        materialized='table'
    )
}}



select cast(ID as NUMBER(8,0)) as id_customer,
       upper(first_name) as first_name,
       upper(last_name) as last_name,
       email,
       gender

 from {{ source('raw', 'customers') }}