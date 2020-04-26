CREATE PROCEDURE FLAV_DAT_Insert() 
MODIFIES SQL DATA BEGIN ATOMIC 
--
DELETE FROM FLAV_DAT;
--
INSERT INTO FLAV_DAT
(
  NDB_No,
  Nutr_No,
  Flav_Val
)
SELECT ndb_no,
       nutr_no,
       AVG(flav_val)
FROM (SELECT ndb_no,
             nutr_no,
             flav_val
      FROM flav_dat_pa02
      UNION
      SELECT ndb_no,
             nutr_no,
             flav_val
      FROM flav_dat_isoflav
      UNION
      SELECT ndb_no,
             nutr_no,
             flav_val
      FROM flav_dat_flav
      UNION
      SELECT ndb_no,
             nutr_no,
             flav_val
      FROM flav_dat_fdb)
GROUP BY ndb_no,
         nutr_no;
--
END;
/

