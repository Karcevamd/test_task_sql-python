SELECT MIN(t1.ID) + 1 AS Missing_ID FROM Problem_2_Test t1
LEFT JOIN Problem_2_Test t2 ON t1.ID + 1 = t2.ID
WHERE t2.ID IS NULL
