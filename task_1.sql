-- Create the CurrencyDynamics table
CREATE TABLE CurrencyDynamics (
    CURR VARCHAR(3),
    DT DATE,
    VAL NUMERIC
);

-- Insert data into the CurrencyDynamics table
INSERT INTO CurrencyDynamics (CURR, DT, VAL)
VALUES
    ('USD', '2019-10-24', 63.7997),
    ('USD', '2019-10-25', 63.8600),
    ('USD', '2019-10-26', 63.9966),
    ('USD', '2019-10-29', 69.8700),
    ('USD', '2019-10-30', 63.8320),
    ('USD', '2019-10-31', 63.8734),
    ('EUR', '2019-10-24', 70.9644),
    ('EUR', '2019-10-25', 71.1400),
    ('EUR', '2019-10-26', 71.1194),
    ('EUR', '2019-10-29', 70.8382),
    ('EUR', '2019-10-30', 70.7769),
    ('EUR', '2019-10-31', 71.0081);

WITH CurrencyDynamicsRes AS (
    SELECT 
        CURR,
        DT,
        VAL,
        LEAD(DT) OVER (PARTITION BY CURR ORDER BY DT) AS DT_TO,
        LEAD(VAL) OVER (PARTITION BY CURR ORDER BY DT) AS VAL_NEXT
    FROM CurrencyDynamics
)

SELECT 
    CURR,
    DT AS DT_FROM,
    VAL AS VAL_FROM,
    DT_TO,
    VAL_NEXT AS VAL
FROM CurrencyDynamicsRes
ORDER BY CURR, DT_FROM;
