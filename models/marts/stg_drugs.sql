{%- set drugs_list_name -%}


select  brand as brand_name from {{ source('dbt_tletellier', 'drugs') }}



{% endset %}

{{ log('target schema is =' + target.schema, info=True) }}
{{ log('target user is =' + target.user, info=True) }}
{{ log('target database is =' + target.database, info=True) }}


{%- set results = run_query(drugs_list_name) -%}


{% if execute %}
{# Return the first column #}
{%- set drugs_list = results.columns[0].values() -%}

    {{ log("Drugs values : ",info=True) }}
{%- for drug in drugs_list -%}
    
{{ log('cuurent drug =' + drug, info=True) }}

{%- endfor -%}
{% else %}
{% set drugs_list = [] %}
{% endif %}



select 'toto' as drug_name
