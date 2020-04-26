--I have selected these nutrients for use in nutrition software. Do you have suggestions on what to add or delete? I will also include flavonoids by class.

SELECT nutr_no,tagname,nutrdesc,units
FROM nutr_def
WHERE (
nutr_no = 203 OR 
nutr_no = 204 OR 
nutr_no = 205 OR 
nutr_no = 291 OR 
nutr_no = 208 OR 
nutr_no = 221 OR 
nutr_no = 262 OR 
nutr_no = 263 OR 
nutr_no = 291 OR 
nutr_no = 301 OR 
nutr_no = 304 OR 
nutr_no = 306 OR 
nutr_no = 307 OR 
nutr_no = 318 OR 
nutr_no = 323 OR 
nutr_no = 341 OR 
nutr_no = 342 OR 
nutr_no = 343 OR 
nutr_no = 344 OR 
nutr_no = 345 OR 
nutr_no = 346 OR 
nutr_no = 347 OR 
nutr_no = 401 OR 
nutr_no = 601 OR
nutr_no = 606 OR
nutr_no = 621 OR
nutr_no = 629 OR
nutr_no = 631 OR
nutr_no = 645 OR
nutr_no = 646 )

