select count(*)
from nutr_def;
/
select count(distinct(nutr_no))
from nutr_def;
/
select nutr_no, count(*) as n
from nutr_def
group by nutr_no
order by n desc;
/
