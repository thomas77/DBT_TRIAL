{% snapshot dim_products %}
    {{
        config(
            unique_key='product_id',
            strategy='check',
            check_cols=['product_name','description', 'is_discount'],
            target_schema='dbt_scd'
        )
    }}

    select * from {{ source('raw', 'products') }}
 {% endsnapshot %}