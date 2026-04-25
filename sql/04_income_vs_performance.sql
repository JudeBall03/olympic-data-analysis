-- Groups countries into simple GDP per capita bands
-- Compares average medal totals and athlete delegation size across income levels

SELECT 
    CASE 
        WHEN c.gdp_per_capita < 5000 THEN 'Low GDP per capita'
        WHEN c.gdp_per_capita < 20000 THEN 'Middle GDP per capita'
        ELSE 'High GDP per capita'
    END AS gdp_per_capita_band,
    ROUND(AVG(o.total), 2) AS avg_medals,
    ROUND(AVG(o.athletes_sent), 2) AS avg_athletes_sent
FROM countries c
JOIN olympic_performance o
    ON c.country_code = o.country_code
WHERE c.gdp_per_capita IS NOT NULL
GROUP BY gdp_per_capita_band
ORDER BY avg_medals DESC;
