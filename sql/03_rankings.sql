SELECT 
    country_code,
    total,
    RANK() OVER (ORDER BY total DESC) AS medal_rank
FROM olympic_performance;
