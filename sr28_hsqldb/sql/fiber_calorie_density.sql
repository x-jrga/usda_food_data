--fiber (g) / kcals
SELECT a.ndb_no, b.long_desc,a.value as fiber_calorie_density
FROM (SELECT a.ndb_no,
             b.nutr_val / a.nutr_val as value
      FROM (SELECT a.ndb_no,
                   a.nutr_val
            FROM nut_data a
            WHERE a.nutr_no = 208) a,
           (SELECT a.ndb_no,
                   a.nutr_val
            FROM nut_data a
            WHERE a.nutr_no = 291
            AND   a.nutr_val > 0) b
      WHERE a.ndb_no = b.ndb_no) a,
     (SELECT ndb_no,long_desc FROM food_des) b
WHERE a.ndb_no = b.ndb_no
order by a.value desc;
