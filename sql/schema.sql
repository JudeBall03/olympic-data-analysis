CREATE TABLE countries (
    country_code VARCHAR(10) PRIMARY KEY,
    noc VARCHAR(10),
    gdp_per_capita FLOAT,
    total_population BIGINT,
    life_expectancy FLOAT,
    expenditure_on_education FLOAT,
    education_index FLOAT,
    urban_population FLOAT
);

CREATE TABLE olympic_performance (
    country_code VARCHAR(10) PRIMARY KEY,
    gold INT,
    silver INT,
    bronze INT,
    total INT,
    medal_score FLOAT,
    athletes_sent INT,
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);
