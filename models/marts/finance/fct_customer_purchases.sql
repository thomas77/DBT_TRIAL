with customers as (

    select * from {{ ref('stg_customers') }}
),

 customer_purchases as (

    select * from {{ ref('stg_customer_purchases') }}
),

 final as( 
select customers.ID_CLIENT, customer_purchases.purchase_date, customer_purchases.amount,
customers.FIRST_NAME, customers.LAST_NAME,
sum(customer_purchases.amount) over (partition by customer_purchases.ID_CUSTOMER order by customer_purchases.PURCHASE_DATE ) as total_purchase 
from customer_purchases
inner join  customers on customers.ID_CLIENT=customer_purchases.id_customer)


-- comment  sffdf ff
select * from final