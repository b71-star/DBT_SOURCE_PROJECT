{% set inc_flag = 1 %}
{% set last_load = 3 %}

{% set cols_list = ["sales_id","date_sk","gross_amount"] %}
-- this is for full load
select
    {% for i in cols_list %}
        {{ i }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
from
    {{ ref('bronze_sales') }}

-- This is for incremental load
{% if inc_flag == 1 %}
   where date_sk > {{ last_load }}
{% endif %}