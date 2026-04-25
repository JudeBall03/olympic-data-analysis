-- Calculate medals per athlete for each country
-- Provides a normalised measure of Olympic performance efficiency

SELECT 
    country_code,
    total,
    athletes_sent,
    (total * 1.0 / athletes_sent) AS medals_per_athlete
FROM olympic_performance
WHERE athletes_sent > 0
ORDER BY medals_per_athlete DESC;
