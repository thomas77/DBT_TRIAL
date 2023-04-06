-- test that all amount are positive

select amount from {{ ref('fct_customer_purchases') }}
where amount < 0