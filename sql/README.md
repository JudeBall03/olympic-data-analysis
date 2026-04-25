## SQL Analysis

The original dataset was restructured into a relational schema and analysed using SQL to complement the regression-based approach.

### Tables
- `countries`: socio-economic indicators (e.g. GDP per capita, population, education)
- `olympic_performance`: medal counts and athlete delegation size

### Key Queries

**01_medal_analysis.sql**
- Combines socio-economic and performance data using a JOIN
- Explores the relationship between GDP per capita and medal output

**02_efficiency.sql**
- Calculates medals per athlete for each country
- Provides a normalised measure of performance efficiency

**03_rankings.sql**
- Ranks countries by total medals using a window function
- Uses `DENSE_RANK()` to handle tied values without gaps

**04_income_vs_performance.sql**
- Segments countries into GDP per capita bands using `CASE`
- Compares average medal counts and delegation size across groups

### Purpose

This SQL extension complements the original regression analysis by:
- structuring the dataset into a relational format
- enabling targeted analytical queries
- validating key insights (e.g. the relationship between athlete count and medal success)
