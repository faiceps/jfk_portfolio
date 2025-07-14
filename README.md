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


## Exploratory Data Analysis

### Histograms and density plots for CO₂ emissions to understand distribution.
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/7fe7cafa-3a8e-4dec-93bc-cbac3cc0ebdf" />

### Boxplots to compare emissions across vehicle classes.
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/fd4d5309-3c86-48c3-a873-dbb405269e58" />

### Correlation matrix using corrplot for numeric feature relationships.
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/00b4fe80-7108-4905-a4ce-0d8e10e1ee71" />

### Scatterplot of City vs Highway fuel consumption to assess linear relationship (Pearson correlation = 0.929).
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/1e218225-0149-44de-a8c1-6db61260353e" />


### Q-Q plots to assess normality assumptions of emissions data.
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/30fd5cdc-9c78-4f10-ab68-3f6734e99c7a" />



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

---

## Linear Regression

**Model 1: CO2.Emissions ~ Vehicle.Class.**
- Weak predictor of CO₂ emissions (R² = 0.1655).

**Model 2: CO2.Emissions ~ FC-COMB.**
- Strong predictor of CO₂ emissions (R² = 0.8349).

## Diagnostic Checks for Each Model
Conducted for both regression models:

- Residuals vs Fitted    : to check linearity.
- Scale-Location         : homoscedasticity assumption.
- Q-Q Plot               : normality of residuals.
- Residuals vs Leverage  : detection of influential observations.


### Model 1
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/9f8edbea-c326-4aa9-80df-8c73dade5a2e" />


### Model 2
<img width="733" height="768" alt="image" src="https://github.com/user-attachments/assets/12624c7f-4395-43ac-9082-f00b264248fd" />

---
