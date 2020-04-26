select c.long_desc,b.flav_class, b.nutrient_name, a.flav_val as flavonoids_mg_per_100g
from flav_dat a, nutr_def b, food_des c
where a.nutr_no = b.nutr_no
and a.ndb_no = c.ndb_no;
/
select c.long_desc, b.flav_class, sum(a.flav_val) as flavonoids_mg_per_100g
from flav_dat a, nutr_def b, food_des c
where a.nutr_no = b.nutr_no
and a.ndb_no = c.ndb_no
group by c.long_desc,b.flav_class;
/
select c.long_desc, sum(a.flav_val) as flavonoids_mg_per_100g
from flav_dat a, nutr_def b, food_des c
where a.nutr_no = b.nutr_no
and a.ndb_no = c.ndb_no
group by c.long_desc
order by flavonoids_mg_per_100g desc;
/
