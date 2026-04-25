SELECT 
    c.country_code,
    o.total,
    o.athletes_sent,
    (o.total * 1.0 / o.athletes_sent) AS medals_per_athlete
FROM countries c
JOIN olympic_performance o
ON c.country_code = o.country_code
ORDER BY medals_per_athlete DESC;
