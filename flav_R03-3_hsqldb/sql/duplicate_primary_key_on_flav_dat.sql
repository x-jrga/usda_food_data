select count(*)
from flav_dat;
/
select count(distinct(ndb_no,nutr_no))
from flav_dat;
/
select ndb_no,nutr_no, count(*) as n
from flav_dat
group by ndb_no,nutr_no
order by n desc;
/
