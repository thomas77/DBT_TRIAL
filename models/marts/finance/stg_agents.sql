with agents as (select 

agent_code as agent_code,
UPPER(agent_name) as agent_name


from {{ source('stg', 'ag') }}

)

select * from agents
