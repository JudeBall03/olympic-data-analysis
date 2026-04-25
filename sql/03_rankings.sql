-- Rank countries by total Olympic medals using a window function
-- Uses DENSE_RANK to avoid gaps in ranking when values are tied

SELECT
    country_code,
    total,
    DENSE_RANK() OVER (ORDER BY total DESC) AS medal_rank
FROM olympic_performance
ORDER BY medal_rank;
