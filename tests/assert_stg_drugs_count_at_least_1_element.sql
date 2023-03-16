{{
    config(
        severity='error'
    )
}}

select
    count(*) as total,
    drug_name
from {{ ref('stg_drugs' )}}
group by 2
having (total > 1)