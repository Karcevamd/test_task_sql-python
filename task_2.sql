SELECT
    EXTRACT(YEAR FROM rc.RequestSBDate) AS Год,
    EXTRACT(MONTH FROM rc.RequestSBDate) AS Месяц,
    cc.Name AS "Направление обращения",
    rcc.Name AS "Категория обращения",
    COUNT(*) AS "Количество обращений"
FROM rep_BR_complaints rc
JOIN rep_BR_complaints_category cc ON rc.BaseCategoryCode = cc.BaseCategoryCode
JOIN rep_BR_complaints_category rcc ON rc.CategoryId = rcc.ID
WHERE EXTRACT(YEAR FROM rc.RequestSBDate) = 2017
GROUP BY EXTRACT(YEAR FROM rc.RequestSBDate), EXTRACT(MONTH FROM rc.RequestSBDate), cc.Name, rcc.Name
ORDER BY COUNT(*) DESC;
