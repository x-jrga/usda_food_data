select count(*)
from datsrcln;
/
select count(distinct(ndb_no,nutr_no,datasrc_id))
from datsrcln;
/
select ndb_no,nutr_no,datasrc_id, count(*) as n
from datsrcln
group by ndb_no,nutr_no,datasrc_id
order by n desc;
/
