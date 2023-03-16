{{
    config(
        materialized='incremental',
        unique_key='id',
        merge_update_columns = ['firstname', 'name']


    )
}}



with customers as (select 

ID as id,
FIRSTNAME as firstname,
NAME as name,
region as region


from {{ source('stg', 'customers') }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  --where id not in  (select id from {{ this }})

{% endif %}




)

select * from customers