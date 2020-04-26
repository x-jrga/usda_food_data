SELECT a.ndb_no,
       b.long_desc,
       b.sciname,
       a.anthocyanidins,
       a.flavan_3_ols,
       a.flavanones,
       a.flavones,
       a.flavonols,
       a.isoflavones,
       a.flavonoids
FROM FLAV_DAT_BY_CLASS a,
     food_des b
WHERE a.ndb_no = b.ndb_no
ORDER BY a.flavonoids DESC;
/

SELECT *
FROM FLAV_DAT_BY_CLASS a
ORDER BY a.flavonoids DESC;
/

SELECT c.long_desc,
       b.nutrient_name,
       b.flav_class,
       a.flav_val
FROM flav_dat a,
     nutr_def b,
     food_des c
WHERE a.nutr_no = b.nutr_no
AND   a.ndb_no = c.ndb_no
AND   flav_val >= 0.01;
/

SELECT c.long_desc,
       b.flav_class,
       SUM(a.flav_val) AS flav_val
FROM flav_dat a,
     nutr_def b,
     food_des c
WHERE a.nutr_no = b.nutr_no
AND   a.ndb_no = c.ndb_no
AND   flav_val >= 0.01
GROUP BY c.long_desc,
         b.flav_class
ORDER BY flav_val DESC;
/

SELECT c.long_desc,
       SUM(a.flav_val) AS flav_val
FROM flav_dat a,
     nutr_def b,
     food_des c
WHERE a.nutr_no = b.nutr_no
AND   a.ndb_no = c.ndb_no
AND   flav_val >= 0.01
GROUP BY c.long_desc
ORDER BY flav_val DESC;
/

