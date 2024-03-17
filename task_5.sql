SELECT 
    MAX(simultaneous_routes) AS max_simultaneous_routes
FROM (
    SELECT 
        route_time,
        SUM(route_in_progress) OVER (ORDER BY route_time) AS simultaneous_routes
    FROM (
        SELECT 
            ROUTE_START_TIME AS route_time,
            1 AS route_in_progress
        FROM ROUTES
        UNION ALL
        SELECT 
            ROUTE_END_TIME AS route_time,
            -1 AS route_in_progress
        FROM ROUTES
    ) AS all_routes
) AS running_routes;
