## Evaluating the Environmental Impact of Automotive Vehicles



This project uses R to investigate the environmental impact of automotive vehicles by evaluating the relationship between fuel consumption, vehicle class, and CO2 emissions under various driving conditions. Statistical techniques and machine learning modeling were used to uncover key trends and patterns. The goal is to provide insights that could inform environmental policy, vehicle design, and consumer awareness.

**Full report available in attached pdf file.**

---

## **Dataset Source**: [Kaggle CO2 Emissions Dataset](https://www.kaggle.com/datasets)
## Dataset Info:
A dataset entitled “Carbon Dioxide Emission by Vehicles” was obtained from Kaggle. 
Below are all the features available in this dataset:

<img width="940" height="1105" alt="image" src="https://github.com/user-attachments/assets/d56faad4-d281-4a22-9319-21f2aae27109" />

---

## Objectives
1. Investigate how **driving conditions** (city vs. highway) affect **fuel efficiency** and **CO₂ emissions**.
2. Examine whether **vehicle class** significantly influences CO₂ output.
3. Identify the **strongest predictors of emissions** and evaluate model fit.

---

## Key Insights
- **Fuel consumption (FC-COMB)** is a **significant predictor of CO₂ emissions** (R² = 0.83), suggesting that efficiency-focused policies can directly reduce emissions.
- **Vehicle Class alone** is not a strong predictor (R² = 0.17) due to overlapping consumption behaviors.
- **High fuel consumers emit significantly more CO₂** (t-test p-value < 0.001).
- Vehicles with better **city and highway fuel ratios** tend to align with lower emission profiles.

---

## Methods & Techniques
### Data Cleaning
- Removed records with CO2.Emissions = 0 (Cars will never have 0 CO2 emissions).
- Imputed missing Fuel.Consumption.City (FC-CT) and Fuel.Consumption.Combined (FC-COMB) values using Fuel.Consumption.Highway (FC-HW).
- Consolidated similar vehicle class labels:

"SUV - Small" and "SUV - Medium" → "SUV"

"Pickup truck - Small" and "Pickup truck - Large" → "PICKUP TRUCK"

And similarly for "MID-SIZE", "FULL-SIZE", "TWO-SEATER".


### Exploratory Data Analysis
- Histograms and density plots for CO₂ emissions to understand distribution.
- Boxplots to compare emissions across vehicle classes.
- Correlation matrix using corrplot for numeric feature relationships.
- Scatterplot of City vs Highway fuel consumption to assess linear relationship (Pearson correlation = 0.949).
- Q-Q plots to assess normality assumptions of emissions data.


### Statistical Modeling

One-Sample T-Test:
- Tested if CO₂ emissions are significantly greater than 0.
- Used both alternative = "less" and alternative = "greater".

Two-Sample T-Test:
- Created HighFuelConsumption vs LowFuelConsumption groups (based on median of FC-COMB).
- Tested if CO₂ emissions differ significantly between the two groups.

ANOVA:
- Tested if mean CO₂ emissions differ across Vehicle Classes.
- Also tested relationship between CO₂ emissions and combined fuel consumption (FC-COMB).

📉 Linear Regression

### Diagnostic Checks
Conducted for both regression models:

- Residuals vs Fitted    : to check linearity.
- Scale-Location         : homoscedasticity assumption.
- Q-Q Plot               : normality of residuals.
- Residuals vs Leverage  : detection of influential observations.

---
