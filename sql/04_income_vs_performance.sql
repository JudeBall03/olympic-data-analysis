-- Analyse medal performance by income level

SELECT 
    CASE 
        WHEN c.gdp_per_capita < 5000 THEN 'Low income'
        WHEN c.gdp_per_capita < 20000 THEN 'Middle income'
        ELSE 'High income'
    END AS income_group,
    AVG(o.total) AS avg_medals,
    AVG(o.athletes_sent) AS avg_athletes
FROM countries c
JOIN olympic_performance o
ON c.country_code = o.country_code
GROUP BY income_group
ORDER BY avg_medals DESC;
