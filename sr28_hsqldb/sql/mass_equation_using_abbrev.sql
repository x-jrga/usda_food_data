--Mass Equation
--food_edible_portion (100 g) = protein (g)  + fat (g)  + carbs (g) + ash (g) + water (g)
--using abbrev table
SELECT a.ndb_no,
       100 AS total,
       a.water,
       a.protein,
       a.lipid_tot,
       a.ash,
       a.carbohydrt
FROM abbrev a
--Milk, lowfat, fluid, 1% milkfat, protein fortified, with added vitamin A and vitamin D
WHERE ndb_no = '01084';

