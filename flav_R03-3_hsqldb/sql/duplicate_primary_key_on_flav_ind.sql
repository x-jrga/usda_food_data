select count(*)
from flav_ind;
/
select count(distinct(ndb_no,datasrc_id,food_no))
from flav_ind;
/
select ndb_no,datasrc_id,food_no, count(*) as n
from flav_ind
group by ndb_no,datasrc_id,food_no
order by n desc;
/
