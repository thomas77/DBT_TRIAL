{% snapshot dim_order_status %}
    {{
        config(
            unique_key='order_id',
            strategy='timestamp',
            updated_at="updated_date",
            target_schema='dbt_scd'
        )
    }}

    select * from {{ source('raw', 'order_status') }}
 {% endsnapshot %}