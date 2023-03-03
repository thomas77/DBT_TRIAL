with customers as (select 

ID as customer_id,
UPPER(FIRSTNAME) as firstname,
UPPER(NAME) as name,
region as region_id


from {{ source('stg', 'customers') }}

)

select * from customers