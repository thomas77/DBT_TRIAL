with customer_purchases as (

select ID_CUSTOMER,
PURCHASE_DATEs,
PURCHASE_AMOUNT as AMOUNT 
from {{ source('raw', 'customer_purchases') }}
)


select * from customer_purchases