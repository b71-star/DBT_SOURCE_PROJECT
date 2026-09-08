select * 
from
    {{ref('bronze_sales')}}
where
    gross_amount < 0 or net_amount < 0 
    -- we want to make sure that there are no negative values in the fact_sales table
