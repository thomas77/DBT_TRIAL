{{
    config(
        materialized='incremental',
        unique_key='ID_PURCHASE'

    )
}}



select ID_CUSTOMER,
ID_PURCHASE,
ID_PRODUCT,
PURCHASE_DATE,
PURCHASE_AMOUNT as AMOUNT 
from {{ source('raw', 'customer_purchases') }}



{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where ID_PURCHASE not in  (select ID_PURCHASE from {{ this }})

{% endif %}