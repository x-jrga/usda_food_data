CREATE PROCEDURE FOOD_DES_Insert (
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM FOOD_DES;
INSERT INTO FOOD_DES
(
  NDB_No, 
  Long_Desc,
  SciName,
  FdGrp_Cd
)
SELECT a.ndb_no,
       GREATEST(a.long_desc,isnull (b.long_desc,a.long_desc)) AS long_desc,
       GREATEST(a.sciname,isnull ('',a.sciname)) AS sciname,
              GREATEST(a.fdgrp_cd,isnull (b.fdgrp_cd,a.fdgrp_cd)) AS fdgrp_cd
FROM (SELECT a.ndb_no,
             GREATEST(a.long_desc,isnull (b.long_desc,a.long_desc)) AS long_desc,
             GREATEST(a.sciname,isnull ('',a.sciname)) AS sciname,
             GREATEST(a.fdgrp_cd,isnull (b.fdgrp_cd,a.fdgrp_cd)) AS fdgrp_cd             
      FROM (SELECT a.ndb_no,
                   GREATEST(a.long_desc,isnull (b.long_desc,a.long_desc)) AS long_desc,
                   GREATEST(a.sciname,isnull (b.sciname,a.sciname)) AS sciname,
                   GREATEST(a.fdgrp_cd,isnull (b.fdgrp_cd,a.fdgrp_cd)) AS fdgrp_cd
            FROM (SELECT a.ndb_no,
                         GREATEST(a.long_desc,isnull (b.long_desc,a.long_desc)) AS long_desc,                  
                         GREATEST(a.sciname,isnull (b.sciname,a.sciname)) AS sciname,
                         GREATEST(a.fdgrp_cd,isnull (b.fdgrp_cd,a.fdgrp_cd)) AS fdgrp_cd
                  FROM (SELECT ndb_no,
                               '' AS nutrient_name,
                               '' AS long_desc,                         
                               '' AS sciname,
                               '' AS fdgrp_cd
                        FROM (SELECT ndb_no
                              FROM food_des_fdb
                              UNION
                              SELECT ndb_no
                              FROM food_des_flav
                              UNION
                              SELECT ndb_no
                              FROM food_des_isoflav
                              UNION
                              SELECT ndb_no
                              FROM food_des_pa02)) a
                    LEFT JOIN food_des_flav b ON a.ndb_no = b.ndb_no) a
              LEFT JOIN food_des_pa02 b ON a.ndb_no = b.ndb_no) a
        LEFT JOIN food_des_isoflav b ON a.ndb_no = b.ndb_no) a
  LEFT JOIN food_des_fdb b ON a.ndb_no = b.ndb_no;
--
END;
/

