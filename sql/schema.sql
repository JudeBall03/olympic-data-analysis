-- Schema for Olympic data analysis
-- Splits dataset into socio-economic indicators and performance metrics
-- Linked via country_code (1:1 relationship)

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
    gold INT NOT NULL,
    silver INT NOT NULL,
    bronze INT NOT NULL,
    total INT NOT NULL,
    medal_score FLOAT NOT NULL,
    athletes_sent INT NOT NULL,
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);
