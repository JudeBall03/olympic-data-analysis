SELECT 
    c.country_code,
    o.total AS total_medals,
    c.gdp_per_capita
FROM countries c
JOIN olympic_performance o
ON c.country_code = o.country_code
ORDER BY total_medals DESC;
