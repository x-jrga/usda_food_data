INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5001' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   B.FLAV_CLASS = 'Anthocyanidins'
GROUP BY A.NDB_NO,
         B.FLAV_CLASS;

INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5002' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   B.FLAV_CLASS = 'Flavan-3-ols'
GROUP BY A.NDB_NO,
         B.FLAV_CLASS;

INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5003' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   B.FLAV_CLASS = 'Flavanones'
GROUP BY A.NDB_NO,
         B.FLAV_CLASS;
         
INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5004' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   B.FLAV_CLASS = 'Flavones'
GROUP BY A.NDB_NO,
         B.FLAV_CLASS;
         
INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5005' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   B.FLAV_CLASS = 'Flavonols'
GROUP BY A.NDB_NO,
         B.FLAV_CLASS;

INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5006' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   B.FLAV_CLASS = 'Isoflavones'
GROUP BY A.NDB_NO,
         B.FLAV_CLASS;
         
INSERT INTO flav_dat_flavonoid_class
(
  ndb_no,
  nutr_no,
  flav_val
)
SELECT A.NDB_NO,
       '5000' AS nutr_no,
       SUM(A.FLAV_VAL) AS FLAV_VAL
FROM PUBLIC.FLAV_DAT A,
     PUBLIC.NUTR_DEF B
WHERE A.NUTR_NO = B.NUTR_NO
AND   (B.FLAV_CLASS = 'Anthocyanidins' OR B.FLAV_CLASS = 'Flavan-3-ols' OR B.FLAV_CLASS = 'Flavanones' OR B.FLAV_CLASS = 'Flavones' OR B.FLAV_CLASS = 'Flavonols' OR B.FLAV_CLASS = 'Isoflavones')
GROUP BY A.NDB_NO;



