SELECT 
    good_id,
    MIN(oper_date) AS "с какой даты пропал товар с полок",
    MAX(oper_date) AS "по какую дату товар отсутствовал на полках"
FROM (
    SELECT 
        good_id,
        oper_date,
        SUM(CASE WHEN oper_type = FALSE THEN good_count ELSE 0 END) AS total_out,
        SUM(CASE WHEN oper_type = TRUE THEN good_count ELSE 0 END) AS total_in
    FROM turnover
    GROUP BY good_id, oper_date
) AS subquery
WHERE total_out >= total_in
GROUP BY good_id;
