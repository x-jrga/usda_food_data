select count(*)
from food_des;
/
select count(distinct(ndb_no))
from food_des;
/
select ndb_no, count(*) as n
from food_des
group by ndb_no
order by n desc;
/
