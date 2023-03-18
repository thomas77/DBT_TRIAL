{% test is_empty(model,column_name) %}

select {{column_name}} from {{model}} where len({{column_name}})=0
    
{% endtest %}