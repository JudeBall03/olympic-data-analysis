################################################################################
################################################################################
################################################################################
# olympic_analysis
################################################################################
################################################################################
################################################################################



################################################################################
################################################################################
# Loading and cleaning the data
################################################################################
################################################################################
#######################################
# Creating the original_data data frame
#######################################
#####
# Load the original dataset

# Note: In this dataset, `noc` refers to the Name of Country, not the National Olympic Committee.
original_data <- read.csv("data/olympic_data.csv")



######################################
# Creating the cleaned_data data frame
######################################
#####
# Select specific columns and rows

cleaned_data <- original_data[, c("country_code","noc", "medal_score", "athletes_sent", 
                                  "gdp_per_capita", "total_population", 
                                  "life_expectancy", "expenditure_on_education", 
                                  "education_index", "urban_population")]


# Exclude the entry for Chinese Taipei because all explanatory variables 
# (e.g., GDP per capita, total population, life expectancy, etc.) are missing.
# Without these variables, Chinese Taipei cannot be included in the analysis as it lacks
# the necessary data to explore relationships between explanatory factors and Olympic performance.

cleaned_data <- cleaned_data[cleaned_data$noc != "Chinese Taipei", ]

#####
# Update specific entries missing from our original data set, with data found from reputable sources. 

# Check the current value for Colombia's expenditure_on_education
cleaned_data[cleaned_data$noc == "Colombia", "expenditure_on_education"]
# Updating expenditure_on_education for Colombia with 4.48 based on reliable external sources
cleaned_data[cleaned_data$noc == "Colombia", "expenditure_on_education"] <- 4.48
# Verify the update
cleaned_data[cleaned_data$noc == "Colombia", "expenditure_on_education"]


# Check the current value for Egypt's expenditure_on_education
cleaned_data[cleaned_data$noc == "Egypt", "expenditure_on_education"]
# Updating expenditure_on_education for Egypt with 4.05 based on reliable external sources
cleaned_data[cleaned_data$noc == "Egypt", "expenditure_on_education"] <- 4.05
# Verify the update
cleaned_data[cleaned_data$noc == "Egypt", "expenditure_on_education"]


# Check the current value for Grenada's expenditure_on_education
cleaned_data[cleaned_data$noc == "Grenada", "expenditure_on_education"]
# Updating expenditure_on_education for Grenada with 10.29 based on reliable external sources
cleaned_data[cleaned_data$noc == "Grenada", "expenditure_on_education"] <- 10.29
# Verify the update
cleaned_data[cleaned_data$noc == "Grenada", "expenditure_on_education"]


# Check the current value for Korea, Dem. People's Rep.'s gdp_per_capita
cleaned_data[cleaned_data$noc == "Korea, Dem. People's Rep.", "gdp_per_capita"]
# Updating gdp_per_capita for Korea, Dem. People's Rep. with 661 based on reliable external sources
cleaned_data[cleaned_data$noc == "Korea, Dem. People's Rep.", "gdp_per_capita"] <- 661
# Verify the update
cleaned_data[cleaned_data$noc == "Korea, Dem. People's Rep.", "gdp_per_capita"]


# Check the current value for Kosovo's expenditure_on_education
cleaned_data[cleaned_data$noc == "Kosovo", "expenditure_on_education"]
# Updating expenditure_on_education for Kosovo with 4.5 based on reliable external sources
cleaned_data[cleaned_data$noc == "Kosovo", "expenditure_on_education"] <- 4.5
# Verify the update
cleaned_data[cleaned_data$noc == "Kosovo", "expenditure_on_education"]


# Check the current value for Puerto Rico's expenditure_on_education
cleaned_data[cleaned_data$noc == "Puerto Rico", "expenditure_on_education"]
# Updating expenditure_on_education for Puerto Rico with 6.07 based on reliable external sources
cleaned_data[cleaned_data$noc == "Puerto Rico", "expenditure_on_education"] <- 6.07
# Verify the update
cleaned_data[cleaned_data$noc == "Puerto Rico", "expenditure_on_education"]


# Check the current value for Qatar's expenditure_on_education
cleaned_data[cleaned_data$noc == "Qatar", "expenditure_on_education"]
# Updating expenditure_on_education for Qatar with 3 based on reliable external sources
cleaned_data[cleaned_data$noc == "Qatar", "expenditure_on_education"] <- 3
# Verify the update
cleaned_data[cleaned_data$noc == "Qatar", "expenditure_on_education"]


# Check the current value for Tunisia's expenditure_on_education
cleaned_data[cleaned_data$noc == "Tunisia", "expenditure_on_education"]
# Updating expenditure_on_education for Tunisia with 7.32 based on reliable external sources
cleaned_data[cleaned_data$noc == "Tunisia", "expenditure_on_education"] <- 7.32
# Verify the update
cleaned_data[cleaned_data$noc == "Tunisia", "expenditure_on_education"]


# Check the current value for United Arab Emirates' expenditure_on_education
cleaned_data[cleaned_data$noc == "United Arab Emirates", "expenditure_on_education"]
# Updating expenditure_on_education for United Arab Emirates with 1.74 based on reliable external sources
cleaned_data[cleaned_data$noc == "United Arab Emirates", "expenditure_on_education"] <- 1.74
# Verify the update
cleaned_data[cleaned_data$noc == "United Arab Emirates", "expenditure_on_education"]


# Check the current value for Venezuela's expenditure_on_education
cleaned_data[cleaned_data$noc == "Venezuela", "expenditure_on_education"]
# Updating expenditure_on_education for Venezuela with 1.19 based on reliable external sources
cleaned_data[cleaned_data$noc == "Venezuela", "expenditure_on_education"] <- 1.19
# Verify the update
cleaned_data[cleaned_data$noc == "Venezuela", "expenditure_on_education"]


# Check the current value for Venezuela's gdp_per_capita
cleaned_data[cleaned_data$noc == "Venezuela", "gdp_per_capita"]
# Updating gdp_per_capita for Venezuela with 3673 based on reliable external sources
cleaned_data[cleaned_data$noc == "Venezuela", "gdp_per_capita"] <- 3673
# Verify the update
cleaned_data[cleaned_data$noc == "Venezuela", "gdp_per_capita"]


#####
# Any remaining zeros indicate missing data for which no replacement values could be found. 
# These zeros are now being replaced with NA to ensure they are treated as missing values in subsequent analyses.


cleaned_data[cleaned_data == 0] <- NA

# Check if zeros have been replaced
colSums(is.na(cleaned_data))


#############################
# Saving the cleaned data set
#############################
#####
write.csv(cleaned_data, "Cleaned Data.csv", row.names = FALSE)
# Use 'cleaned_data' for analysis



#####

###############################
# Creating subsets for analysis
###############################
#####
# Check the structure of the dataset

# This provides an overview of the variables, data types, and dimensions
str(cleaned_data)

# Generate summary statistics for each variable
# Useful for understanding ranges, means, medians, and detecting potential anomalies
summary(cleaned_data)


# Note: Discuss the results of `str()` and `summary()` in your report
# Focus on describing the original variables and any notable findings


# Check for missing values in each variable
# This helps identify which variables have gaps that may need handling
colSums(is.na(cleaned_data))


#####
# Removing rows with missing values for specific variables


# Subset for `expenditure_on_education`
# Remove rows where the country is "Korea, Dem. People's Rep."
expenditure_on_education_subset <- cleaned_data[cleaned_data$noc != "Korea, Dem. People's Rep.", ]

# Subset for `education_index`
# Remove rows where the country is "Korea, Dem. People's Rep.", "Kosovo", or "Puerto Rico"
education_index_subset <- cleaned_data[
  !(cleaned_data$noc %in% c("Korea, Dem. People's Rep.", "Kosovo", "Puerto Rico")), 
]

# Subset for `urban_population`
# Remove rows where the country is "Kosovo"
urban_population_subset <- cleaned_data[cleaned_data$noc != "Kosovo", ]


#####
# Verifying the subsets


# Check dimensions of the subsets to ensure rows are removed
dim(expenditure_on_education_subset)
dim(education_index_subset)
dim(urban_population_subset)

# Confirm no missing values remain for the respective variables
colSums(is.na(expenditure_on_education_subset))
colSums(is.na(education_index_subset))
colSums(is.na(urban_population_subset))

#####
# Notes:
# - Each subset excludes rows where the variable of interest has missing data.






################################################################################
################################################################################
# Exploratory Data Analysis (EDA)
################################################################################
################################################################################

#####
# Defining explanatory variables simplifies future operations like loops, visualizations, and modeling.
explanatory_vars <- c("athletes_sent", "gdp_per_capita", "total_population", 
                      "life_expectancy", "expenditure_on_education", 
                      "education_index", "urban_population")


#####################
# Univariate Analysis
#     - Examining each variable individually to understand its distribution.
#####################
#####
# For Target Variable - medal_score

# Histogram
hist(cleaned_data$medal_score, main = "Distribution of Medal Score", xlab = "Medal Score")
dev.copy(png, file = "Histogram_medal_score.png")
dev.off()

# Boxplot
boxplot(cleaned_data$medal_score, main = "Box Plot of Medal Score", ylab = "Medal Score")
dev.copy(png, file = "Boxplot_medal_score.png")
dev.off()

# Summary
summary(cleaned_data$medal_score)

#####
# For Explanatory Variables

# Histogram and box plot for gdp_per_capita
hist(cleaned_data$gdp_per_capita, main = "Distribution of GDP per Capita", xlab = "GDP per Capita")
dev.copy(png, file = "Histogram_gdp_per_capita.png")
dev.off()

boxplot(cleaned_data$gdp_per_capita, main = "Box Plot of GDP per Capita", ylab = "GDP per Capita")
dev.copy(png, file = "Boxplot_gdp_per_capita.png")
dev.off()

# Histogram and box plot for athletes_sent
hist(cleaned_data$athletes_sent, main = "Distribution of Athletes Sent", xlab = "Athletes Sent")
dev.copy(png, file = "Histogram_athletes_sent.png")
dev.off()

boxplot(cleaned_data$athletes_sent, main = "Box Plot of Athletes Sent", ylab = "Athletes Sent")
dev.copy(png, file = "Boxplot_athletes_sent.png")
dev.off()

# Histogram and box plot for total_population
hist(cleaned_data$total_population, main = "Distribution of Total Population", xlab = "Total Population")
dev.copy(png, file = "Histogram_total_population.png")
dev.off()

boxplot(cleaned_data$total_population, main = "Box Plot of Total Population", ylab = "Total Population")
dev.copy(png, file = "Boxplot_total_population.png")
dev.off()

# Histogram and box plot for life_expectancy
hist(cleaned_data$life_expectancy, main = "Distribution of Life Expectancy", xlab = "Life Expectancy")
dev.copy(png, file = "Histogram_life_expectancy.png")
dev.off()

boxplot(cleaned_data$life_expectancy, main = "Box Plot of Life Expectancy", ylab = "Life Expectancy")
dev.copy(png, file = "Boxplot_life_expectancy.png")
dev.off()

# Histogram and box plot for expenditure_on_education_subset
hist(expenditure_on_education_subset$expenditure_on_education, main = "Distribution of Expenditure on Education", xlab = "Expenditure on Education")
dev.copy(png, file = "Histogram_expenditure_on_education.png")
dev.off()

boxplot(expenditure_on_education_subset$expenditure_on_education, main = "Box Plot of Expenditure on Education", ylab = "Expenditure on Education")
dev.copy(png, file = "Boxplot_expenditure_on_education.png")
dev.off()

# Histogram and box plot for education_index_subset
hist(education_index_subset$education_index, main = "Distribution of Education Index", xlab = "Education Index")
dev.copy(png, file = "Histogram_education_index.png")
dev.off()

boxplot(education_index_subset$education_index, main = "Box Plot of Education Index", ylab = "Education Index")
dev.copy(png, file = "Boxplot_education_index.png")
dev.off()

# Histogram and box plot for urban_population_subset
hist(urban_population_subset$urban_population, main = "Distribution of Urban Population", xlab = "Urban Population")
dev.copy(png, file = "Histogram_urban_population.png")
dev.off()

boxplot(urban_population_subset$urban_population, main = "Box Plot of Urban Population", ylab = "Urban Population")
dev.copy(png, file = "Boxplot_urban_population.png")
dev.off()


#####
# Transforming Variables

# We will start by applying log transformations to the most skewed variables: gdp_per_capita, total_population, athletes_sent, and medal_score
cleaned_data$log_gdp_per_capita <- log(cleaned_data$gdp_per_capita + 1)
cleaned_data$log_total_population <- log(cleaned_data$total_population + 1)
cleaned_data$log_athletes_sent <- log(cleaned_data$athletes_sent + 1)
cleaned_data$log_medal_score <- log(cleaned_data$medal_score + 1)


# List of variables to replot (after log transformation)
variables <- c("log_gdp_per_capita", "log_total_population", 
               "log_athletes_sent", "log_medal_score")

# Create histograms and save as PNG files
for (var in variables) {
  png(filename = paste0(var, "_histogram.png")) # Save file
  hist(cleaned_data[[var]], 
       main = paste("Histogram of", var), 
       xlab = var, 
       border = "black")
  dev.off() # Close the file
}

# Create box plots and save as PNG files
for (var in variables) {
  png(filename = paste0(var, "_boxplot.png")) # Save file
  boxplot(cleaned_data[[var]], 
          main = paste("Box Plot of", var), 
          ylab = var)
  dev.off() # Close the file
}


#####
# Despite the log transformation reducing the skewness, a single outlier remains, which indicates that one country still stands out even after compressing the range of values.
# This outlier is likely a country with a very small population compared to the global average (e.g., small island nations).
# This outlier could be an interesting case study. For example, it might represent a country with unique circumstances (e.g., small population but a significant Olympic presence).

outlier <- cleaned_data[cleaned_data$log_total_population == min(cleaned_data$log_total_population), ]
print(outlier)


####################
# Bivariate Analysis
#     - Exploring relationships between medal_score (target) and each explanatory variable
####################
#####
# Exploring Relationships Between Target and Explanatory Variables

# List of explanatory variables to analyse against log_medal_score
explanatory_vars <- c("log_gdp_per_capita", "log_total_population", 
                      "log_athletes_sent", "urban_population", 
                      "expenditure_on_education", "education_index", 
                      "life_expectancy")

# Scatterplots for target vs explanatory variables
for (var in explanatory_vars) {
  # Generate file name dynamically
  png(filename = paste0("log_medal_score vs ", var, " scatterplot.png"))
  
  # Calculate the correlation coefficient (R)
  r_value <- cor(cleaned_data[[var]], cleaned_data$log_medal_score, use = "complete.obs")
  
  # Scatter plot
  plot(cleaned_data[[var]], cleaned_data$log_medal_score, 
       main = paste("log_medal_score vs", var), 
       xlab = var, ylab = "log_medal_score", 
       pch = 19, col = "blue")
  
  # Add trend line
  abline(lm(log_medal_score ~ cleaned_data[[var]], data = cleaned_data), col = "red")
  
  # Add R value as text on the plot
  text(x = max(cleaned_data[[var]], na.rm = TRUE) * 0.8, 
       y = max(cleaned_data$log_medal_score, na.rm = TRUE) * 0.9, 
       labels = paste("R =", round(r_value, 3)), 
       col = "black", cex = 1.2)
  
  # Close the file
  dev.off()
}





#####
# Assessing Correlations

# Correlation matrix for target and explanatory variables
cor_matrix <- cor(cleaned_data[, c("log_medal_score", explanatory_vars)], use = "complete.obs")
print(cor_matrix)

# Optional visualization
library(corrplot)

# Save the correlation plot as an image
png(filename = "correlation_matrix_plot.png")
corrplot(cor_matrix, 
         method = "color", 
         addCoef.col = "black",  # Add correlation values in black
         tl.col = "black",       # Variable labels in black
         tl.cex = 0.8,           # Text size for labels
         number.cex = 0.8,       # Text size for correlation values
         col = colorRampPalette(c("blue", "white", "red"))(200)) # Colour scale
dev.off()  # Close the image file


#######################
# Multivariate Analysis
#     - Understanding the relationships between explanatory variables themselves
#######################
#####
# Pair Plots: Visualise relationships between explanatory variables with scatter plots

# Save pair plot as a PNG file with variable names
png("pair_plot_explanatory_variables.png", width = 800, height = 800)

# Generate pair plot with labels
pairs(cleaned_data[, c("log_gdp_per_capita", "log_total_population", "log_athletes_sent", 
                       "urban_population", "expenditure_on_education", "education_index", 
                       "life_expectancy")],
      labels = c("Log GDP per Capita", "Log Total Population", "Log Athletes Sent", 
                 "Urban Population", "Expenditure on Education", "Education Index", 
                 "Life Expectancy"),
      main = "Pair Plot of Explanatory Variables",
      pch = 19,  # Shape of points
      col = "blue")  # Colour of points

# Close the graphics device
dev.off()


#####
# Adding regression lines

# Save pair plot as a PNG file with regression lines
png("pair_plot_with_regression_lines.png", width = 800, height = 800)

# Generate pair plot with regression lines
pairs(cleaned_data[, c("log_gdp_per_capita", "log_total_population", "log_athletes_sent", 
                       "urban_population", "expenditure_on_education", "education_index", 
                       "life_expectancy")],
      labels = c("Log GDP per Capita", "Log Total Population", "Log Athletes Sent", 
                 "Urban Population", "Expenditure on Education", "Education Index", 
                 "Life Expectancy"),
      main = "Pair Plot of Explanatory Variables with Regression Lines",
      panel = function(x, y) {
        points(x, y, pch = 19, col = "blue")  # Scatter points in blue
        abline(lm(y ~ x), col = "red")        # Add regression line in red
      })

# Close the graphics device
dev.off()


#####
# Highlighting high correlation

# Save pair plot as a PNG file with regression lines and highlighted correlations
png("pair_plot_with_highlighted_correlation.png", width = 800, height = 800)

# Custom panel function to add scatter points, regression lines, and background colour
panel.custom <- function(x, y, ...) {
  # Calculate correlation
  correlation <- cor(x, y, use = "complete.obs")
  
  # Set background colour based on correlation threshold
  if (abs(correlation) > 0.8) {
    rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "lightpink", border = NA)
  } else if (abs(correlation) > 0.6) {
    rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "lightyellow", border = NA)
  }
  
  # Add scatter points
  points(x, y, pch = 19, col = "blue", ...)
  
  # Add regression line
  abline(lm(y ~ x), col = "red")
}

# Generate pair plot with custom panels
pairs(cleaned_data[, c("log_gdp_per_capita", "log_total_population", "log_athletes_sent", 
                       "urban_population", "expenditure_on_education", "education_index", 
                       "life_expectancy")],
      labels = c("Log GDP per Capita", "Log Total Population", "Log Athletes Sent", 
                 "Urban Population", "Expenditure on Education", "Education Index", 
                 "Life Expectancy"),
      main = "Pair Plot Highlighting High Correlations (Pink: High, Yellow: Moderate)",
      panel = panel.custom)  # Use the custom panel function

# Close the graphics device
dev.off()


#####
# Notes:
#     - Dropping `log_gdp_per_capita` as its role is reflected in `education_index` and `life_expectancy`.
#     Retaining `education_index` and `life_expectancy` to focus on health and education factors.


#####
# Proceeding to drop `log_gdp_per_capita` from `model_data` as its role is captured by `education_index` and `life_expectancy`.
# This step finalises the variables to be used for modelling.

# List of variables to drop
vars_to_drop <- c("medal_score", "athletes_sent", 
                  "gdp_per_capita", "total_population", "log_gdp_per_capita")

# Create model_data by removing specified variables
model_data <- cleaned_data[, !names(cleaned_data) %in% vars_to_drop]

# Verify the updated model_data
str(model_data)


######################
# Identifying Outliers
######################
#####
# Box Plots

# Variables in the model data
model_vars <- c("life_expectancy", "expenditure_on_education", "education_index", 
                "urban_population", "log_total_population", "log_athletes_sent", "log_medal_score")

# Generate and save box plots as individual .png files
for (var in model_vars) {
  # Create a filename for each variable
  file_name <- paste0("boxplot_", var, ".png")
  
  # Open a PNG device
  png(filename = file_name)
  
  # Generate the box plot
  boxplot(cleaned_data[[var]], 
          main = paste("Box Plot of", var), 
          ylab = var)
  
  # Close the PNG device to save the plot
  dev.off()
}


#####
# Programatically detecting Outliers

# Variables in the model data
model_vars <- c("life_expectancy", "expenditure_on_education", "education_index", 
                "urban_population", "log_total_population", "log_athletes_sent", "log_medal_score")

# Function to detect outliers and map them to NOC codes
detect_outliers_by_noc <- function(data, variable, nocs) {
  Q1 <- quantile(data[[variable]], 0.25, na.rm = TRUE)
  Q3 <- quantile(data[[variable]], 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  
  # Identify outlier indices
  outlier_indices <- which(data[[variable]] < lower_bound | data[[variable]] > upper_bound)
  
  # Return data frame only if outliers are found
  if (length(outlier_indices) > 0) {
    return(data.frame(NOC = nocs[outlier_indices], 
                      Variable = variable, 
                      Value = data[[variable]][outlier_indices]))
  } else {
    return(NULL) # Return NULL if no outliers are found
  }
}

# Apply the function to all model variables and combine results
outlier_results <- do.call(rbind, lapply(model_vars, function(var) {
  detect_outliers_by_noc(cleaned_data, var, cleaned_data$noc)
}))

# Check the results
if (is.null(outlier_results)) {
  print("No outliers detected for any variable.")
} else {
  print(outlier_results)
}


#####
# Any extreme outliers?

# Function to classify outliers as mild or extreme
classify_outliers <- function(data, variable, nocs) {
  Q1 <- quantile(data[[variable]], 0.25, na.rm = TRUE)
  Q3 <- quantile(data[[variable]], 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  mild_lower <- Q1 - 1.5 * IQR
  mild_upper <- Q3 + 1.5 * IQR
  extreme_lower <- Q1 - 3 * IQR
  extreme_upper <- Q3 + 3 * IQR
  
  # Identify outlier indices
  outlier_indices <- which(data[[variable]] < mild_lower | data[[variable]] > mild_upper)
  
  # Return NULL if no outliers are found
  if (length(outlier_indices) == 0) {
    return(NULL)
  }
  
  # Extract outlier values and NOCs
  outlier_values <- data[[variable]][outlier_indices]
  outlier_nocs <- nocs[outlier_indices]
  
  # Classify as mild or extreme
  classification <- ifelse(outlier_values < extreme_lower | outlier_values > extreme_upper, 
                           "Extreme", "Mild")
  
  # Return a data frame of results
  return(data.frame(NOC = outlier_nocs, 
                    Variable = variable, 
                    Value = outlier_values, 
                    Type = classification))
}

# Apply the function to all variables and combine results
outlier_classification <- do.call(rbind, lapply(model_vars, function(var) {
  classify_outliers(cleaned_data, var, cleaned_data$noc)
}))

# View results
if (is.null(outlier_classification)) {
  print("No outliers detected for any variable.")
} else {
  print(outlier_classification)
}



#####
#Notes:
#   - Outliers were identified in several variables, but these represent legitimate values from reputable sources.
#   - All outliers are retained in the dataset to preserve the real-world variability for analysis.


###################
# Categorising Data
###################
#####
# Add continent groupings using country codes

library(countrycode)
model_data$continent <- countrycode(model_data$country_code, "iso3c", "continent")

# Manually assign continent for Kosovo (Europe)
model_data$continent[model_data$country_code == "XKX"] <- "Europe"
model_data$continent <- as.factor(model_data$continent)


#####
# Add income groupings based on log_gdp_per_capita
model_data$income_group <- cut(cleaned_data$log_gdp_per_capita,
                               breaks = quantile(cleaned_data$log_gdp_per_capita, probs = c(0, 0.33, 0.67, 1)),
                               labels = c("Low", "Middle", "High"),
                               include.lowest = TRUE)


#####
# Add population tiers based on log_total_population
model_data$population_tier <- cut(model_data$log_total_population,
                                  breaks = c(0, log(10^7), log(5 * 10^7), Inf),
                                  labels = c("Small", "Medium", "Large"))


####################################
# Brief EDA on Categorical Groupings
####################################
#####
# Distribution of Categories

# Frequency tables
table(model_data$continent)
table(model_data$income_group)
table(model_data$population_tier)

# Bar plot for continents
barplot(table(model_data$continent),
        main = "Number of Countries by Continent",
        xlab = "Continent",
        ylab = "Count",
        col = "steelblue",
        las = 2)  # Rotate x-axis labels for readability

# Bar plot for income groups
barplot(table(model_data$income_group),
        main = "Number of Countries by Income Group",
        xlab = "Income Group",
        ylab = "Count",
        col = "orange",
        las = 2)

# Bar plot for population tiers
barplot(table(model_data$population_tier),
        main = "Number of Countries by Population Tier",
        xlab = "Population Tier",
        ylab = "Count",
        col = "green",
        las = 2)


#####
# Comparing log_medal_score Across Categories

# Save boxplot for continent
png("boxplot_continent.png")
boxplot(log_medal_score ~ continent, data = model_data,
        main = "Log Medal Score by Continent",
        xlab = "Continent",
        ylab = "Log Medal Score",
        col = "lightblue")
dev.off()

# Save boxplot for income groups
png("boxplot_income_group.png")
boxplot(log_medal_score ~ income_group, data = model_data,
        main = "Log Medal Score by Income Group",
        xlab = "Income Group",
        ylab = "Log Medal Score",
        col = "lightcoral")
dev.off()

# Save boxplot for population tiers
png("boxplot_population_tier.png")
boxplot(log_medal_score ~ population_tier, data = model_data,
        main = "Log Medal Score by Population Tier",
        xlab = "Population Tier",
        ylab = "Log Medal Score",
        col = "lightgreen")
dev.off()


#####
# Exploring Interactions Between Predictors and Categorical Variables

# We focus on the variables with the highest correlation (R value) with log_medal_score:
# - log_athletes_sent (R = 0.738): Strongest predictor of log_medal_score.
# - log_total_population (R = 0.407): Moderate correlation.
# - education_index (R = 0.332): Moderate correlation.
# - life_expectancy (R = 0.277): Included for completeness due to moderate correlation.
# Lower-correlation variables (e.g., expenditure_on_education, urban_population) are deprioritised.


# Function to Create Scatterplots for All Indicators
create_scatterplot <- function(x_var, x_label, indicators, file_prefix) {
  for (indicator in indicators) {
    # Create a filename dynamically
    file_name <- paste0(file_prefix, "_by_", indicator, ".png")
    
    # Save the scatterplot as a PNG file
    png(filename = file_name)
    
    # Create the scatterplot
    plot(model_data[[x_var]], model_data$log_medal_score,
         col = as.numeric(model_data[[indicator]]),
         pch = 19,
         main = paste(x_label, "vs Log Medal Score by", indicator),
         xlab = x_label,
         ylab = "Log Medal Score")
    
    # Add legend for the indicator
    legend("topright", legend = levels(model_data[[indicator]]),
           col = 1:length(levels(model_data[[indicator]])),
           pch = 19, title = indicator)
    
    # Add regression line
    abline(lm(log_medal_score ~ model_data[[x_var]], data = model_data), col = "red")
    
    # Close the PNG device
    dev.off()
  }
}

# List of indicators to examine
indicators <- c("income_group", "continent", "population_tier")

# Generate Scatterplots for Each Variable
create_scatterplot("log_athletes_sent", "Log Athletes Sent", indicators, "scatter_log_athletes_sent")
create_scatterplot("log_total_population", "Log Total Population", indicators, "scatter_log_total_population")
create_scatterplot("education_index", "Education Index", indicators, "scatter_education_index")
create_scatterplot("life_expectancy", "Life Expectancy", indicators, "scatter_life_expectancy")




################################################################################
################################################################################
# Model Fitting
################################################################################
################################################################################
#####
# Removing rows with null values

# Remove NA Values from model_data

# Remove rows with any NA values in model_data
model_data <- na.omit(model_data)

# Verify the updated model_data
str(model_data)

# Check for remaining missing values
summary(model_data)

# Fixing the index
rownames(model_data) <- NULL


###########################
# Defining the Baseline Model
#     - Fit the baseline model
#     - Summarise the baseline model
###########################
#####

# lm1: Initial Full Model
# ------------------------
# This model includes:
# - Main effects for log_athletes_sent, education_index, life_expectancy, and log_total_population.
# - Interaction terms with income_group and continent to explore whether economic status or geographical region 
#   modifies the effects of these predictors on log_medal_score.
# - Designed to capture key relationships and any effect modifiers without introducing excessive complexity.
lm1 <- lm(
  log_medal_score ~ 
    (log_athletes_sent + education_index + life_expectancy + log_total_population) * income_group +
    (log_athletes_sent + education_index) * continent,
  data = model_data
)
summary(lm1)


# lm2: Extended Model with Population Tier Interactions
# -----------------------------------------------------
# Adds interaction terms with population_tier (small, medium, large) to investigate whether population size 
# modifies the effects of predictors like log_athletes_sent and education_index.
# This model tests if access to a larger talent pool (via population size) influences Olympic performance.
lm2 <- lm(
  log_medal_score ~ 
    (log_athletes_sent + education_index + life_expectancy + log_total_population) * income_group +
    (log_athletes_sent + education_index) * continent +
    (log_athletes_sent + education_index) * population_tier,
  data = model_data
)
summary(lm2)

# ANOVA Comparison Between lm1 and lm2
# ------------------------------------
# Compares lm1 (without population_tier interactions) and lm2 (with population_tier interactions) to test 
# whether the additional terms in lm2 significantly improve the model fit.
anova(lm2, lm1)


####################################################
# Decision to Proceed with lm1 as our baseline model
####################################################

# - The ANOVA test shows no significant improvement in model fit by adding population_tier interactions (p > 0.05).
# - lm1 has a better adjusted R² and lower Residual Standard Error compared to lm2, indicating a better fit.
# - lm2 adds complexity without meaningful gains, so we proceed with lm1 for further simplification.


############################
# Evaluate Model Assumptions
#     - Check residuals for normality
#     - Check for heteroscedasticity
#     - Check for multicollinearity
############################

# Diagnostic Plots for lm1
# ------------------------
# Residual diagnostic plots to check model assumptions, including:
# - Linearity: Residuals vs Fitted plot should show no clear pattern.
# - Normality: Q-Q plot should show residuals close to the diagonal.
# - Homoscedasticity: Scale-Location plot should show a flat trend.
# - Influential Points: Residuals vs Leverage plot identifies potential outliers.

# Save individual diagnostic plots as PNG files

# 1. Residuals vs Fitted
png(filename = "lm1_residuals_vs_fitted.png")
plot(lm1, which = 1, main = "Residuals vs Fitted")
dev.off()

# 2. Normal Q-Q
png(filename = "lm1_qq_plot.png")
plot(lm1, which = 2, main = "Normal Q-Q")
dev.off()

# 3. Scale-Location
png(filename = "lm1_scale_location.png")
plot(lm1, which = 3, main = "Scale-Location")
dev.off()

# 4. Residuals vs Leverage
png(filename = "lm1_residuals_vs_leverage.png")
plot(lm1, which = 5, main = "Residuals vs Leverage")
dev.off()


# Inspect high-leverage points
# ----------------------------
# This command extracts the rows corresponding to observations 4, 26, and 52, 
# which have leverage equal to 1. These points may have extreme or unique 
# predictor values that could disproportionately influence the regression model. 
# Investigating their validity will help determine whether they should be 
# retained or excluded from the analysis.
model_data[c(4, 26, 52), ]


# Residual Diagnostic Findings
# -----------------------------
# The residual diagnostics indicate that the assumptions of the linear model are mostly met:
# 1. Normality: The Q-Q plot shows residuals aligning closely with the diagonal, with minor deviations at the tails (e.g., observation 45).
# 2. Linearity: Residuals vs Fitted plot shows random scatter, supporting linearity, though a slight curve suggests mild non-linearity.
# 3. Homoscedasticity: Scale-Location plot shows fairly even spread of residuals, with slight fanning indicating mild heteroscedasticity.
# 4. Influence: Residuals vs Leverage plot highlights observations 33, 41, and 57 near Cook's distance threshold, warranting monitoring. High-leverage points (4, 26, 52) are valid and retained.


# Checking for multicollinearity
# -------------------------------

# Install and load the car package
if (!require(car)) install.packages("car")
library(car)

# Compute VIF for individual predictors in the model
vif_values <- vif(lm1, type = "predictor")
print(vif_values)

# Highlight variables with high multicollinearity
high_vif <- vif_values[vif_values > 5]
if (length(high_vif) > 0) {
  cat("\nVariables with high multicollinearity (VIF > 5):\n")
  print(high_vif)
} else {
  cat("\nNo variables with high multicollinearity detected.\n")
}


# Problematic multicollinearity found:
# - log_athletes_sent (VIF = 4.65): Moderately high, suggesting multicollinearity with other predictors like education_index and income_group.
# - education_index (VIF = 3.65): Moderately high, with multicollinearity involving log_athletes_sent and income_group.
# - log_total_population (VIF = 6.66): High, suggesting strong multicollinearity with predictors like income_group and continent.
# - life_expectancy (VIF = 4.49): Multicollinearity with income_group and continent

# Simplified model: Remove life_expectancy and its interactions
lm3 <- lm(
  log_medal_score ~ 
    (log_athletes_sent + education_index + log_total_population) * income_group +
    (log_athletes_sent + education_index) * continent,
  data = model_data
)

# Summary of the simplified model
summary(lm3)
anova(lm3, lm1)


# Check VIF values for multicollinearity in the simplified model
vif_values_lm3 <- vif(lm3, type = "predictor")
print(vif_values_lm3)


# Refine lm3 by removing interaction of log_total_population with income_group
lm4 <- lm(
  log_medal_score ~ 
    log_total_population +
    (log_athletes_sent + education_index) * income_group +
    (log_athletes_sent + education_index) * continent,
  data = model_data
)

# Check the summary of the refined model
summary(lm4)

# Check VIF values to assess multicollinearity
vif_values_lm4 <- vif(lm4, type = "predictor")
print(vif_values_lm4)



# VIF values now within acceptable ranges:
# - `log_total_population`, `log_athletes_sent`, and `education_index` show moderate multicollinearity (VIF < 5), which is acceptable.
# - `income_group` and `continent` have low VIF values, indicating minimal multicollinearity contributions.
# Checking diagnostic plots before moving on to refining the model further by removing insignificant terms based on p-values.

# Diagnostic Plots for lm4
# ------------------------
# Residual diagnostic plots to check model assumptions, including:
# - Linearity: Residuals vs Fitted plot should show no clear pattern.
# - Normality: Q-Q plot should show residuals close to the diagonal.
# - Homoscedasticity: Scale-Location plot should show a flat trend.
# - Influential Points: Residuals vs Leverage plot identifies potential outliers.

# Save individual diagnostic plots as PNG files

# 1. Residuals vs Fitted
png(filename = "lm4_residuals_vs_fitted.png")
plot(lm4, which = 1, main = "Residuals vs Fitted")
dev.off()

# 2. Normal Q-Q
png(filename = "lm4_qq_plot.png")
plot(lm4, which = 2, main = "Normal Q-Q")
dev.off()

# 3. Scale-Location
png(filename = "lm4_scale_location.png")
plot(lm4, which = 3, main = "Scale-Location")
dev.off()

# 4. Residuals vs Leverage
png(filename = "lm4_residuals_vs_leverage.png")
plot(lm4, which = 5, main = "Residuals vs Leverage")
dev.off()

model_data[c(41, 81, 35), ]

##################
# Refining the Model
#     - Remove non-significant predictors
#     - Test interactions
#     - Compare models using ANOVA
##################

summary(lm4)
anova(lm4)

# Remove the interaction between education_index and income_group
lm5 <- lm(
  log_medal_score ~ 
    log_total_population +
    log_athletes_sent * income_group +
    education_index + 
    (log_athletes_sent + education_index) * continent,
  data = model_data
)

# Check the updated model summary
summary(lm5)
anova(lm5)

# Compare lm5 with lm4 using ANOVA to evaluate the impact of removing the interaction
anova(lm5, lm4)

# Remove the interaction between log_athletes_sent and continent
lm6 <- lm(
  log_medal_score ~ 
    log_total_population +
    log_athletes_sent * income_group +
    education_index * continent,
  data = model_data
)

# Check the updated model summary
summary(lm6)
anova(lm6)

# Compare lm6 with lm5 using ANOVA to evaluate the impact of removing the interaction
anova(lm6, lm5)

# Remove the interaction between education_index and continent
lm7 <- lm(
  log_medal_score ~ 
    log_total_population +
    log_athletes_sent * income_group +
    education_index,
  data = model_data
)

# Check the updated model summary
summary(lm7)
anova(lm7)

# Compare lm7 with lm6 using ANOVA to evaluate the impact of removing the interaction
anova(lm7, lm6)


# Remove the education_index term
lm8 <- lm(
  log_medal_score ~ 
    log_total_population +
    log_athletes_sent * income_group,
  data = model_data
)

# Check the updated model summary
summary(lm8)

# Compare lm8 with lm7 using ANOVA to evaluate the impact of removing the interaction
anova(lm8, lm7)

anova(lm8)


# Fit model lm8: Includes log_total_population and interaction between log_athletes_sent and income_group
lm8 <- lm(log_medal_score ~ log_total_population + log_athletes_sent * income_group, data = model_data)

# Fit model lm9: Excludes log_total_population but retains interaction between log_athletes_sent and income_group
lm9 <- lm(log_medal_score ~ log_athletes_sent * income_group, data = model_data)

# Perform ANOVA for lm8 to assess the contribution of each term in the model
anova(lm8)
# Interpretation of the ANOVA results for lm8:
# - log_total_population is statistically significant (p < 0.001) and explains some variance in log_medal_score.
# - log_athletes_sent is the strongest predictor, contributing the most variance with an extremely significant effect.
# - income_group as a main effect is not significant (p = 0.901), suggesting it does not independently impact the outcome.
# - The interaction term (log_athletes_sent:income_group) is significant (p < 0.001), indicating that the effect of log_athletes_sent varies across income groups.

# Compare models lm8 and lm9 using ANOVA
anova(lm9, lm8)
# Interpretation of the model comparison:
# - The p-value (0.690) indicates that adding log_total_population to the model (lm8) does not significantly improve model performance.
# - This suggests that while log_total_population is statistically significant on its own, it does not provide meaningful additional explanatory power when combined with the other predictors.

# Assess model summaries for lm8 and lm9
summary(lm8)
summary(lm9)
# Insights from model summaries:
# - Adjusted R-squared is slightly higher for lm9 (0.623 vs. 0.6187), suggesting it explains a similar amount of variance with fewer predictors.
# - Residual standard error is slightly lower for lm9 (0.7986 vs. 0.8031), further supporting lm9 as the better-fitting model.
# - Coefficients for log_athletes_sent, income_group, and their interaction are significant in both models, indicating these are the key predictors of log_medal_score.

# Decision:
# - Model lm9 is preferred as it is simpler with fewer predictors, and performs equivalently or slightly better than lm8.
# - The inclusion of log_total_population in lm8, though significant in isolation, does not substantially enhance the model's explanatory power.


lm10<-lm(log_medal_score~ (log_athletes_sent * income_group) - log_athletes_sent,data=model_data)

summary(lm10)

anova(lm10,lm9)

# ANOVA shows no difference in fit between lm9 and lm10.
# The main effect of log_athletes_sent is redundant when its interaction with income_group is included.
# Retaining log_athletes_sent (lm9) ensures interpretability, though both models are statistically equivalent.



####################
# Finalising the Model
#     - Summarise the final model
#     - Re-check residuals for assumptions
####################
#####
#Summary of the final model

# Final Decision:
# - Stick with lm9 because it includes the main effect of log_athletes_sent as well as its interaction with income_group.
# - Including the main effect makes the model easier to interpret and keeps it more complete, even though there's no difference in fit compared to lm10.


summary(lm9)


#####
#Checking multicollinearity

vif_values_lm9 <- vif(lm9, type = "predictor")
print(vif_values_lm9)

# VIF values for log_athletes_sent and income_group are 1, indicating no multicollinearity.
# The adjusted GVIF for income_group accounts for its categorical nature and remains comparable to standard VIF values.
# This confirms that the predictors and their interaction do not inflate variance, allowing reliable interpretation of coefficients.

#####
# Checking residuals

# Residual vs Fitted
png("final_model_residuals_vs_fitted.png")
plot(lm9, which = 1, main = "Residuals vs Fitted")
dev.off()

# Normal Q-Q
png("final_model_qq_plot.png")
plot(lm9, which = 2, main = "Normal Q-Q")
dev.off()

# Scale-Location
png("final_model_scale_location.png")
plot(lm9, which = 3, main = "Scale-Location")
dev.off()

# Residuals vs Leverage
png("final_model_residuals_vs_leverage.png")
plot(lm9, which = 5, main = "Residuals vs Leverage")
dev.off()

#####
# Extracting high leverage points

model_data[c(54,58,5,32,15), ]


######################
# Interpreting Results
#     - Interpret coefficients
#     - Assess model fit
#     - Visualise key relationships
######################
#####
summary(lm9)


#####
# 1. Main Effects: Relationship Between log_athletes_sent and log_medal_score

# Scatterplot with regression lines for each income group
png("relationship_athletes_vs_medal_score.png")
plot(model_data$log_athletes_sent, model_data$log_medal_score, 
     col = as.numeric(model_data$income_group), 
     pch = 19, xlab = "Log Athletes Sent", ylab = "Log Medal Score",
     main = "Relationship Between Athletes Sent and Medal Score")
legend("topleft", legend = levels(model_data$income_group), 
       col = 1:length(levels(model_data$income_group)), pch = 19)

# Add regression lines for each income group
unique_groups <- unique(model_data$income_group)
for (i in seq_along(unique_groups)) {
  group_data <- subset(model_data, income_group == unique_groups[i])
  model <- lm(log_medal_score ~ log_athletes_sent, data = group_data)
  abline(model, col = i)
}
dev.off()


#####
# Base plot
png("deepdive_relationship_athletes_vs_medal_score.png")
plot(
  model_data$log_athletes_sent, model_data$log_medal_score,
  pch = 19, col = c("black", "red", "green")[model_data$income_group],
  xlab = "Log Athletes Sent", ylab = "Log Medal Score",
  main = "Deep Dive: Athletes Sent vs Medal Score with Confidence Intervals"
)

# Fit regression lines with confidence intervals
income_levels <- levels(model_data$income_group)
for (i in seq_along(income_levels)) {
  group <- income_levels[i]
  group_data <- subset(model_data, income_group == group)
  
  # Fit linear model for each income group
  fit <- lm(log_medal_score ~ log_athletes_sent, data = group_data)
  abline(fit, col = c("black", "red", "green")[i], lwd = 2)
  
  # Add confidence intervals
  x_vals <- seq(min(group_data$log_athletes_sent), max(group_data$log_athletes_sent), length.out = 100)
  preds <- predict(fit, newdata = data.frame(log_athletes_sent = x_vals), interval = "confidence")
  matlines(x_vals, preds[, c("lwr", "upr")], lty = 2, col = c("black", "red", "green")[i])
}

# Annotate notable points
notable_points <- c(54, 58, 15) # Example flagged points
text(
  model_data$log_athletes_sent[notable_points],
  model_data$log_medal_score[notable_points],
  labels = model_data$country_code[notable_points],
  pos = 4, col = "blue"
)

# Add legend
legend(
  "topleft", legend = c("Low", "Middle", "High"), 
  col = c("black", "red", "green"), pch = 19, title = "Income Group"
)
dev.off()


# Create separate plots for each income group
for (group in c("Low", "Middle", "High")) {
  # Set up the file name for each plot
  png(paste0("deepdive_relationship_", tolower(group), "_income.png"))
  
  # Subset data for the specific income group
  group_data <- subset(model_data, income_group == group)
  
  # Plot scatterplot for the income group
  plot(
    group_data$log_athletes_sent, group_data$log_medal_score,
    pch = 19, col = ifelse(group == "Low", "black", ifelse(group == "Middle", "red", "green")),
    xlab = "Log Athletes Sent", ylab = "Log Medal Score",
    xlim = range(model_data$log_athletes_sent), ylim = range(model_data$log_medal_score),
    main = paste(group, "Income Group: Athletes Sent vs Medal Score")
  )
  
  # Fit regression line
  fit <- lm(log_medal_score ~ log_athletes_sent, data = group_data)
  abline(fit, col = ifelse(group == "Low", "black", ifelse(group == "Middle", "red", "green")), lwd = 2)
  
  # Add confidence intervals
  x_vals <- seq(min(group_data$log_athletes_sent), max(group_data$log_athletes_sent), length.out = 100)
  preds <- predict(fit, newdata = data.frame(log_athletes_sent = x_vals), interval = "confidence")
  matlines(x_vals, preds[, c("lwr", "upr")], lty = 2, col = ifelse(group == "Low", "black", ifelse(group == "Middle", "red", "green")))
  
  # Identify and annotate notable points
  notable_points <- intersect(which(model_data$income_group == group), c(54, 58, 15))
  if (length(notable_points) > 0) {
    text(
      model_data$log_athletes_sent[notable_points],
      model_data$log_medal_score[notable_points],
      labels = model_data$country_code[notable_points],
      pos = 4, col = "blue"
    )
  }
  
  # Close the plot file
  dev.off()
}




#####
# 3. Observed vs Predicted Values

png("observed_vs_predicted_values.png")
# Calculate predicted values
model_data$predicted <- predict(lm9, newdata = model_data)

# Scatterplot of observed vs predicted values
plot(model_data$predicted, model_data$log_medal_score, 
     pch = 19, xlab = "Predicted Log Medal Score", ylab = "Observed Log Medal Score",
     main = "Observed vs Predicted Values")
abline(0, 1, col = "red", lty = 2, lwd = 2)  # Add a 45-degree reference line
dev.off()


# Threshold for identifying outliers (distance from line)
residual_threshold <- 1.5

# Calculate residuals
residuals <- model_data$log_medal_score - predict(lm9, newdata = model_data)

# Identify outliers based on threshold
outliers <- which(abs(residuals) > residual_threshold)

# Plot observed vs predicted with outliers highlighted
png("observed_vs_predicted_highlighted.png")
plot(
  predict(lm9, newdata = model_data), model_data$log_medal_score,
  xlab = "Predicted Log Medal Score",
  ylab = "Observed Log Medal Score",
  main = "Observed vs Predicted Values",
  pch = 19, col = ifelse(seq_along(residuals) %in% outliers, "red", "black")
)
abline(0, 1, col = "red", lty = 2)
text(
  predict(lm9, newdata = model_data)[outliers],
  model_data$log_medal_score[outliers],
  labels = model_data$country_code[outliers],
  pos = 4, col = "blue"
)
dev.off()


# Display the outliers with relevant information
outlier_data <- model_data[outliers, ]
print(outlier_data)

# Summarise the outliers programmatically
outlier_summary <- data.frame(
  Country_Code = model_data$country_code[outliers],
  Predicted_Values = predict(lm9, newdata = model_data)[outliers],
  Observed_Values = model_data$log_medal_score[outliers],
  Residuals = residuals[outliers]
)
print(outlier_summary)



################
# Saving Outputs
#     - Save model summary
#     - Save diagnostic plots
