--Calorie Equation
--calories (kcal) = protein (g) * pro_factor (kcal/g) + fat (g) * fat_factor (kcal/g) + carbs (g) * cho_factor (kcal/g) + alcohol (g) * 6.93 (kcal/g)
SELECT a.ndb_no,
       a.nutr_no,
       a.nutr_val,
       b.calorie_factor,
       a.nutr_val*b.calorie_factor AS kcals
FROM nut_data a,
     (SELECT ndb_no,
             nutr_no,
             calorie_factor
      FROM (
      --calorie factor - protein      
      SELECT ndb_no,203 AS nutr_no,isnull (pro_factor,4) AS calorie_factor FROM food_des a
      UNION
      --calorie factor - fat
      SELECT ndb_no,204 AS nutr_no,isnull(fat_factor,9) FROM food_des a
      UNION
      --calorie factor - carbohydrate
      SELECT ndb_no,205 AS nutr_no,isnull(cho_factor,4) FROM food_des a
      UNION
       --calorie factor - alcohol
      SELECT ndb_no,221 AS nutr_no,6.93 FROM food_des a
      UNION
      --calorie factor - calorie
      SELECT ndb_no,208 AS nutr_no,1 FROM food_des a
      ) ) b      
WHERE a.ndb_no = b.ndb_no
AND   a.nutr_no = b.nutr_no
--Milk, lowfat, fluid, 1% milkfat, protein fortified, with added vitamin A and vitamin D
and a.ndb_no = '01084';
