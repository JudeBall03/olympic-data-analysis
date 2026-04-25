## SQL Analysis

The dataset was restructured into a relational schema and analysed using SQL.

### Tables
- `countries`: socio-economic indicators
- `olympic_performance`: medal counts and athlete data

### Key Queries

**01_medal_analysis.sql**
- Joins socio-economic data with medal counts
- Used to explore relationships between GDP and performance

**02_efficiency.sql**
- Calculates medals per athlete
- Provides a normalised measure of performance across countries

**03_rankings.sql**
- Uses window functions to rank countries by medal count
- Demonstrates advanced SQL functionality (RANK)

### Purpose

This SQL extension complements the original regression analysis by:
- enabling structured querying of the dataset
- validating insights through alternative analytical methods
