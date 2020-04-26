CREATE PROCEDURE NUTR_DEF_Insert (
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM NUTR_DEF;
INSERT INTO NUTR_DEF (
Nutr_No,
Nutrient_Name,
Tagname,
Flav_Class,
Unit
)
SELECT a.nutr_no,
       GREATEST(a.nutrient_name,isnull (b.nutrdesc,a.nutrient_name)) AS nutrient_name,
       GREATEST(a.tagname,isnull (b.tagname,a.tagname)) AS tagname,
       GREATEST(a.flav_class,isnull ('',a.flav_class)) AS flav_class,
       GREATEST(a.unit,isnull (b.units,a.unit)) AS unit
FROM (SELECT a.nutr_no,
             GREATEST(a.nutrient_name,isnull (b.nutrdesc,a.nutrient_name)) AS nutrient_name,
             GREATEST(a.tagname,isnull ('',a.tagname)) AS tagname,
             GREATEST(a.flav_class,isnull ('',a.flav_class)) AS flav_class,
             GREATEST(a.unit,isnull (b.unit,a.unit)) AS unit
      FROM (SELECT a.nutr_no,
                   GREATEST(a.nutrient_name,isnull (b.nutrient_name,a.nutrient_name)) AS nutrient_name,
                   GREATEST(a.tagname,isnull (b.tagname,a.tagname)) AS tagname,
                   GREATEST(a.flav_class,isnull (b.flav_class,a.flav_class)) AS flav_class,
                   GREATEST(a.unit,isnull (b.unit,a.unit)) AS unit
            FROM (SELECT a.nutr_no,
                         GREATEST(a.nutrient_name,isnull (b.nutrient_name,a.nutrient_name)) AS nutrient_name,
                         GREATEST(a.tagname,isnull (b.tagname,a.tagname)) AS tagname,
                         GREATEST(a.flav_class,isnull (b.flav_class,a.flav_class)) AS flav_class,
                         GREATEST(a.unit,isnull (b.unit,a.unit)) AS unit
                  FROM (SELECT nutr_no,
                               '' AS nutrient_name,
                               '' AS tagname,
                               '' AS flav_class,
                               '' AS unit
                        FROM (SELECT nutr_no
                              FROM nutr_def_fdb
                              UNION
                              SELECT nutr_no
                              FROM nutr_def_flav
                              UNION
                              SELECT nutr_no
                              FROM nutr_def_isoflav
                              UNION
                              SELECT nutr_no
                              FROM nutr_def_pa02)) a
                    LEFT JOIN nutr_def_fdb b ON a.nutr_no = b.nutr_no) a
              LEFT JOIN nutr_def_flav b ON a.nutr_no = b.nutr_no) a
        LEFT JOIN nutr_def_isoflav b ON a.nutr_no = b.nutr_no) a
  LEFT JOIN nutr_def_pa02 b ON a.nutr_no = b.nutr_no;
--
END;
/
