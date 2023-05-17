select * 
from information_schema.tables 
where table_schema not in ('pg_catalog', 'information_schema')
order by 1,2,3