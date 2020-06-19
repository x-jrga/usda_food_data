SELECT nutr_no,
       tagname,
       nutrdesc,
       units
FROM nutr_def
WHERE nutrdesc LIKE '%n-3%'
