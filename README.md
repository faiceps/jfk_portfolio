# # 🚗 Analyzing CO₂ Emissions Across Vehicle Classes

This project uses R to explore the environmental impact of automotive vehicles based on fuel consumption and vehicle type. Through statistical modeling and visualization, we identify key predictors of CO₂ emissions and assess how different vehicle classes contribute to environmental load.

---

## Dataset Info
- **Name**: `co2_emmision_train_data.csv`
- **Source**: [Kaggle CO2 Emissions Dataset](https://www.kaggle.com/datasets)
- **Size**: ~27,549 rows × 26 columns
- **Content**: Vehicle specifications including:
  - Fuel consumption (City, Highway, Combined)
  - CO₂ emissions (g/km)
  - Vehicle Class (e.g. SUV, Pickup Truck, Mid-size)
  - Engine size, transmission type, and more

---

## Objectives
1. Investigate how **driving conditions** (city vs. highway) affect **fuel efficiency** and **CO₂ emissions**.
2. Examine whether **vehicle class** significantly influences CO₂ output.
3. Identify the **strongest predictors** of emissions and evaluate model fit.

---

## Methods & Techniques
### Data Cleaning
- Removed invalid `CO₂ = 0` values.
- Replaced missing city/combined fuel values using highway fuel data.
- Consolidated similar vehicle class labels (e.g., all SUV variants into "SUV").

### Exploratory Data Analysis
- Histograms, density plots, Q-Q plots
- Correlation matrix using `corrplot`
- Boxplots comparing emissions by vehicle type

### Statistical Modeling
- **One-Sample T-Test**: Validated emissions > 0 baseline
- **Two-Sample T-Test**: Compared emissions between high and low fuel consumption groups
- **ANOVA**: Tested variance in CO₂ across vehicle classes
- **Linear Regression Models**:
  - Model 1: CO₂ ~ Vehicle Class → *R² = 0.17*
  - Model 2: CO₂ ~ Combined Fuel Consumption → *R² = 0.83*

### Diagnostic Analysis
- Residuals vs. Fitted plots
- Scale-Location plots
- Q-Q plots
- Leverage plots



## Key Insights
- Vehicles with **higher combined fuel consumption emit significantly more CO₂**.
- **Fuel consumption is a stronger predictor** of emissions than vehicle class.
- Among all types, **Pickup Trucks** and **Two-Seaters** contribute the highest emissions per unit of fuel.
- Linear regression using `Combined Fuel Consumption` explains **83.5%** of variance in CO₂ emissions (R² = 0.83), compared to only 16.5% using `Vehicle Class`.

