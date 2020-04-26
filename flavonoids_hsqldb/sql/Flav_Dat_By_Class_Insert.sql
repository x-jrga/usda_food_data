CREATE PROCEDURE Flav_Dat_By_Class_Insert () 
--
MODIFIES SQL DATA BEGIN ATOMIC
--
DELETE
FROM Flav_Dat_By_Class;

--
INSERT INTO Flav_Dat_By_Class
(
  NDB_No,
  Anthocyanidins,
  Flavan_3_ols,
  Flavanones,
  Flavones,
  Flavonols,
  Isoflavones,
  Flavonoids
)
SELECT a.ndb_no,
       a.Anthocyanidins,
       a.Flavan_3_ols,
       a.Flavanones,
       a.Flavones,
       a.Flavonols,
       a.Isoflavones,
       a.Flavan_3_ols + a.Flavanones + a.Flavones + a.Flavonols + a.Isoflavones + a.Anthocyanidins AS Flavonoids
FROM (SELECT a.ndb_no,
             a.Flavan_3_ols,
             a.Flavanones,
             a.Flavones,
             a.Flavonols,
             a.Isoflavones,
             GREATEST(a.Anthocyanidins,isnull (b.flav_val,a.Flavonoids)) AS Anthocyanidins,
             0 AS Flavonoids
      FROM (SELECT a.ndb_no,
                   a.Flavan_3_ols,
                   a.Flavanones,
                   a.Flavones,
                   a.Flavonols,
                   GREATEST(a.Isoflavones,isnull (b.flav_val,a.Isoflavones)) AS Isoflavones,
                   0 AS Anthocyanidins,
                   0 AS Flavonoids
            FROM (SELECT a.ndb_no,
                         a.Flavan_3_ols,
                         a.Flavanones,
                         a.Flavones,
                         GREATEST(a.Flavonols,isnull (b.flav_val,a.Flavonols)) AS Flavonols,
                         0 AS Isoflavones,
                         0 AS Anthocyanidins,
                         0 AS Flavonoids
                  FROM (SELECT a.ndb_no,
                               a.Flavan_3_ols,
                               a.Flavanones,
                               GREATEST(a.Flavones,isnull (b.flav_val,a.Flavones)) AS Flavones,
                               0 AS Flavonols,
                               0 AS Isoflavones,
                               0 AS Anthocyanidins,
                               0 AS Flavonoids
                        FROM (SELECT a.ndb_no,
                                     a.Flavan_3_ols,
                                     GREATEST(a.Flavanones,isnull (b.flav_val,a.Flavanones)) AS Flavanones,
                                     0 AS Flavones,
                                     0 AS Flavonols,
                                     0 AS Isoflavones,
                                     0 AS Anthocyanidins,
                                     0 AS Flavonoids
                              FROM (SELECT a.ndb_no,
                                           GREATEST(a.Flavan_3_ols,isnull (b.flav_val,a.Flavan_3_ols)) AS Flavan_3_ols,
                                           0 AS Flavanones,
                                           0 AS Flavones,
                                           0 AS Flavonols,
                                           0 AS Isoflavones,
                                           0 AS Anthocyanidins,
                                           0 AS Flavonoids
                                    FROM (SELECT DISTINCT ndb_no,
                                                 0 AS Flavan_3_ols,
                                                 0 AS Flavanones,
                                                 0 AS Flavones,
                                                 0 AS Flavonols,
                                                 0 AS Isoflavones,
                                                 0 AS Anthocyanidins,
                                                 0 AS Flavonoids
                                          FROM flav_dat) a
                                      LEFT JOIN (SELECT a.ndb_no,
                                                        b.flav_class,
                                                        SUM(a.flav_val) AS flav_val
                                                 FROM flav_dat a,
                                                      nutr_def b
                                                 WHERE a.nutr_no = b.nutr_no
                                                 AND   b.flav_class = 'Flavan-3-ols'
                                                 GROUP BY a.ndb_no,
                                                          b.flav_class) b ON a.ndb_no = b.ndb_no) a
                                LEFT JOIN (SELECT a.ndb_no,
                                                  b.flav_class,
                                                  SUM(a.flav_val) AS flav_val
                                           FROM flav_dat a,
                                                nutr_def b
                                           WHERE a.nutr_no = b.nutr_no
                                           AND   b.flav_class = 'Flavanones'
                                           GROUP BY a.ndb_no,
                                                    b.flav_class) b ON a.ndb_no = b.ndb_no) a
                          LEFT JOIN (SELECT a.ndb_no,
                                            b.flav_class,
                                            SUM(a.flav_val) AS flav_val
                                     FROM flav_dat a,
                                          nutr_def b
                                     WHERE a.nutr_no = b.nutr_no
                                     AND   b.flav_class = 'Flavones'
                                     GROUP BY a.ndb_no,
                                              b.flav_class) b ON a.ndb_no = b.ndb_no) a
                    LEFT JOIN (SELECT a.ndb_no,
                                      b.flav_class,
                                      SUM(a.flav_val) AS flav_val
                               FROM flav_dat a,
                                    nutr_def b
                               WHERE a.nutr_no = b.nutr_no
                               AND   b.flav_class = 'Flavonols'
                               GROUP BY a.ndb_no,
                                        b.flav_class) b ON a.ndb_no = b.ndb_no) a
              LEFT JOIN (SELECT a.ndb_no,
                                b.flav_class,
                                SUM(a.flav_val) AS flav_val
                         FROM flav_dat a,
                              nutr_def b
                         WHERE a.nutr_no = b.nutr_no
                         AND   b.flav_class = 'Isoflavones'
                         GROUP BY a.ndb_no,
                                  b.flav_class) b ON a.ndb_no = b.ndb_no) a
        LEFT JOIN (SELECT a.ndb_no,
                          b.flav_class,
                          SUM(a.flav_val) AS flav_val
                   FROM flav_dat a,
                        nutr_def b
                   WHERE a.nutr_no = b.nutr_no
                   AND   b.flav_class = 'Anthocyanidins'
                   GROUP BY a.ndb_no,
                            b.flav_class) b ON a.ndb_no = b.ndb_no) a;

--
END;
/
