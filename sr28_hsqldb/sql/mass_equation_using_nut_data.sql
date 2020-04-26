--Mass Equation
--food_edible_portion (100 g) = protein (g)  + fat (g)  + carbs (g) + ash (g) + alcohol (g) + water (g)
--using nut_data table
SELECT a.ndb_no,
       a.nutr_no,
       a.nutr_val
FROM nut_data a
--Milk, lowfat, fluid, 1% milkfat, protein fortified, with added vitamin A and vitamin D
WHERE ndb_no = '01084'
--protein,fat,carbohydrate,ash,alcohol,water
AND   (nutr_no = '203' OR nutr_no = '204' OR nutr_no = '205' OR nutr_no = '207' OR nutr_no = '221' OR nutr_no = '255');
