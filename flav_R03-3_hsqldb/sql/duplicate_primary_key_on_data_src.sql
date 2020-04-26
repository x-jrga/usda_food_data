select count(*)
from data_src;
/
select count(distinct(datasrc_id))
from data_src;
/
select datasrc_id, count(*) as n
from data_src
group by datasrc_id
order by n desc;
/
