-- test that all amount are positive

{{
    config(
        severity='error'
    )
}}
select amount from {{ ref('fct_customer_purchases') }}
where amount < 0