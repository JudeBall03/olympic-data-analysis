-- Analyse Olympic medal performance by GDP per capita group
-- Uses CASE to segment countries and compare average medals/athletes sent

SELECT
    CASE
        WHEN c.gdp_per_capita < 5000 THEN 'Low income'
        WHEN c.gdp_per_capita < 20000 THEN 'Middle income'
        ELSE 'High income'
    END AS income_group,
    ROUND(AVG(o.total), 2) AS avg_medals,
    ROUND(AVG(o.athletes_sent), 2) AS avg_athletes_sent
FROM countries c
JOIN olympic_performance o
    ON c.country_code = o.country_code
WHERE c.gdp_per_capita IS NOT NULL
GROUP BY income_group
ORDER BY avg_medals DESC;
