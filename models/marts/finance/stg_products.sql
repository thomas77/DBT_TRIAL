{{
    config(
        materialized='incremental',
        unique_key='product_id',
        updated_at='inserted_date',
        on_schema_change='append_new_columns'
    )
}}


select * from {{ source('raw', 'products') }}

{% if is_incremental() %}
    
    where inserted_date > (select max(inserted_date) from {{this}})
{% endif %}


