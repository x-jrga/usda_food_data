SELECT c.ndb_no,
       c.long_desc,
       c.shrt_desc,
       a.nutr_no,
       a.tagname,
       a.nutrdesc,
       b.nutr_val,
       a.units
FROM (SELECT nutr_no,
             tagname,
             nutrdesc,
             units
      FROM nutr_def
      WHERE (nutr_no = 203 OR nutr_no = 204 OR nutr_no = 205 OR nutr_no = 291 OR nutr_no = 208 OR nutr_no = 221 OR nutr_no = 262 OR nutr_no = 263 OR nutr_no = 291 OR nutr_no = 301 OR nutr_no = 304 OR nutr_no = 306 OR nutr_no = 307 OR nutr_no = 318 OR nutr_no = 323 OR nutr_no = 341 OR nutr_no = 342 OR nutr_no = 343 OR nutr_no = 344 OR nutr_no = 345 OR nutr_no = 346 OR nutr_no = 347 OR nutr_no = 401 OR nutr_no = 601 OR nutr_no = 606 OR nutr_no = 621 OR nutr_no = 629 OR nutr_no = 631 OR nutr_no = 645 OR nutr_no = 646)) a,
     (SELECT ndb_no,
             nutr_no,
             nutr_val
      FROM nut_data
      WHERE ndb_no = '01084') b,
     food_des c
WHERE a.nutr_no = b.nutr_no
AND   b.ndb_no = c.ndb_no

