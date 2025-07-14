
# ----------------------------------------------------
# Load and Inspect Dataset
# ----------------------------------------------------

# Set working directory and load dataset

setwd("C:/Users/junfa/Downloads/Datasets/CO2")
CO2_emission <- read.csv("co2_emmision_train_data.csv")



# ----------------------------------------------------
# Initial Data Exploration 
# ----------------------------------------------------

# Display column names, variable names:

head(CO2_emission)

colnames(CO2_emission)

# Dataset Shape
dim(CO2_emission)

# Number of Rows:      27549
# Number of Columns:   26

# -----

# Summary statistics for all columns
summary(CO2_emission)

# -----

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(corrplot)
library(car)


# ----------------------------------------------------
# DATA CLEANING & PREPROCESSING
# ----------------------------------------------------

 
 
# Feature Selection

# Create new dataframe "Emissions" with mentioned 5 features CO2, FC-CT, FC-HW, FC-COMB, VClass

selected_features <- c("Vehicle.Class", "CO2.Emissions..g.km.", "Fuel.Consumption..City..L.100.km..", "Fuel.Consumption..Hwy..L.100.km..", "Fuel.Consumption..Comb..L.100.km..")
Emissions <- CO2_emission[selected_features]
summary(Emissions)    # Summary before adjusting NULL values.

# -----

## Imputation of Missing Values

# Replacing null in Fuel Consumption - City (FC-CT) with corresponding Fuel Consumption - Highway (FC-HW) values

Emissions$Fuel.Consumption..City..L.100.km..[is.na(Emissions$Fuel.Consumption..City..L.100.km..)] <- Emissions$Fuel.Consumption..Hwy..L.100.km..[is.na(Emissions$Fuel.Consumption..City..L.100.km..)]
summary(Emissions$Fuel.Consumption..City..L.100.km..)     
# Null values in FC-CT replaced.

# -----

# Replacing null in Fuel Consumption - Combined (FC-COMB) with corresponding FC-HW values

Emissions$Fuel.Consumption..Comb..L.100.km..[is.na(Emissions$Fuel.Consumption..Comb..L.100.km..)] <- Emissions$Fuel.Consumption..Hwy..L.100.km..[is.na(Emissions$Fuel.Consumption..Comb..L.100.km..)]
summary(Emissions$Fuel.Consumption..Comb..L.100.km..)      
# Null values in FC-COMB replaced.

# -----

#Summarize to check after imputation of null values
summary(Emissions)    

## Newly renamed columns for readability: ##

# colnames(Emissions)[colnames(Emissions) == "Fuel.Consumption..City..L.100.km.."]  <- "FC-CT"
# colnames(Emissions)[colnames(Emissions) == "Fuel.Consumption..Hwy..L.100.km.."]   <- "FC-HW"
# colnames(Emissions)[colnames(Emissions) == "Fuel.Consumption..Comb..L.100.km.."]  <- "FC-COMB"
# colnames(Emissions)[colnames(Emissions) == "CO2.Emissions..g.km"]                 <- "CO2"
# colnames(Emissions)[colnames(Emissions) == "Vehicle.Class"]                       <- "VClass"

# -----

## Consolidating the Vehicle Class Subtypes ##

# Preparing to Combine all The different subclasses SUV, Full-size, Mid-size, Two-seaters, and Pickup trucks 

library(dplyr)

# Checking initial distribution of vehicle classes
table(Emissions$Vehicle.Class)

# -----

# Combining all variations of SUV types

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("SUV", Vehicle.Class) ~ "SUV",
    TRUE ~ Vehicle.Class
  ))

table(Emissions$Vehicle.Class)   
# SUV types combined - 6166 counts

# -----

# Combining all variations of Full-size type

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("FULL", Vehicle.Class) ~ "FULL-SIZE",
    TRUE ~ Vehicle.Class
  ))

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("Full", Vehicle.Class) ~ "FULL-SIZE",
    TRUE ~ Vehicle.Class
  ))   

table(Emissions$Vehicle.Class)   
# FULL-SIZE types combined - 1824 counts

# -----

# Combining all variations of Mid-size type      

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("MID", Vehicle.Class) ~ "MID-SIZE",
    TRUE ~ Vehicle.Class
  ))

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("Mid", Vehicle.Class) ~ "MID-SIZE",
    TRUE ~ Vehicle.Class
  ))   

table(Emissions$Vehicle.Class)   
# MID-SIZE types combined - 4120 counts

# -----

# Combining all variations of Two-seaters type

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("TWO", Vehicle.Class) ~ "TWO-SEATER",
    TRUE ~ Vehicle.Class
  ))

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("Two", Vehicle.Class) ~ "TWO-SEATER",
    TRUE ~ Vehicle.Class
  ))   

table(Emissions$Vehicle.Class)   
# TWO-SEATER types combined - 1470 counts

# -----

# Combining all variations of PICKUP TRUCK type

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("PICKUP", Vehicle.Class) ~ "PICKUP TRUCK",
    TRUE ~ Vehicle.Class
  ))

Emissions <- Emissions %>%
  mutate(Vehicle.Class = case_when(
    grepl("Pickup", Vehicle.Class) ~ "PICKUP TRUCK",
    TRUE ~ Vehicle.Class
  ))   

table(Emissions$Vehicle.Class)   
# PICKUP TRUCK types combined - 3424 counts

# -----


## Filtering for Relevant Vehicle Types & Clean CO2 Data ##

# Creating New Dataframe VClass for targeted analysis

desired_subsets <- c("SUV", "FULL-SIZE", "MID-SIZE", "TWO-SEATER", "PICKUP TRUCK")

#Filtering for targeted vehicle classes
VClass <- Emissions[Emissions$Vehicle.Class %in% desired_subsets, ]

print(VClass)

summary(VClass)  
# Summary after extracting only "SUV", "FULL-SIZE", "MID-SIZE", "TWO-SEATER", "PICKUP TRUCK"

# -----

# Removing "0" values from CO2.Emissions
VClass <- VClass[VClass$CO2.Emissions..g.km. != 0, ]  

summary(VClass) 
# Removed "0" values from CO2.Emissions

# -----

# Separating each VClass into its respective Dataframes

V.SUV <- VClass[VClass$Vehicle.Class == "SUV", ]

V.FULL.SIZE <- VClass[VClass$Vehicle.Class == "FULL-SIZE", ]

V.MID.SIZE <- VClass[VClass$Vehicle.Class == "MID-SIZE", ]

V.TWO.SEATER <- VClass[VClass$Vehicle.Class == "TWO-SEATER", ]

V.PICKUP.TRUCK <- VClass[VClass$Vehicle.Class == "PICKUP TRUCK", ]


summary(V.SUV)
summary(V.FULL.SIZE)
summary(V.MID.SIZE)
summary(V.TWO.SEATER)
summary(V.PICKUP.TRUCK)

# -----

# ----------------------------------------------------
# EXPLORATORY DATA ANALYSIS (EDA)
# ----------------------------------------------------


## EXPLORATORY VISUALIZATIONS : CO2.Emissions & Fuel Consumption ##

library(dplyr)
library(corrplot)

# 1. Histogram of CO2 Emissions
hist(
  Emissions[["CO2.Emissions..g.km."]], 
  main="Histogram of CO2 Emissions", 
  xlab="CO2 Emissions (g/km)",
  col = "lightgray",
  border = "white"
  )

# -----

# 2. Density Plot

hist(
  Emissions[["CO2.Emissions..g.km."]],
  freq=FALSE,
  ylim = c(0, 0.008),
  main = "Density Plot of CO2 Emissions",
  xlab = "CO2 Emissions (g/km)",
  col = "lightgray"
)
lines(
  density(Emissions[["CO2.Emissions..g.km."]]),
  lwd = 3,
  col = "blue"
)

# -----

# 3. Q-Q Plot - Normality Assessment of CO2 Emissions

qqnorm(Emissions$CO2.Emissions..g.km.)
qqline(Emissions$CO2.Emissions..g.km., col = "steelblue", lwd = 2)

# -----

# 4. Boxplot of CO2 Emissions

boxplot(Emissions[["CO2.Emissions..g.km."]], ylab="CO2 Emissions")


## Correlation Plot Between All Numeric Features

library(corrplot)

numeric_columns <- Emissions %>% select_if(is.numeric)
correlation_matrix <- cor(numeric_columns, use = "complete.obs")
corrplot(correlation_matrix, method = "color", type = "upper", tl.cex = 0.8)

# -----


# 5. Scatter Plot between Fuel Consumption (FC) types: City (CT) & Highway (HW)

# Renaming columns: "Fuel.Cons.CT" and "Fuel.Cons.HW"

colnames(CO2_emission)[colnames(CO2_emission) == "Fuel.Consumption..City..L.100.km.."]  <- "Fuel.Cons.CT"
colnames(CO2_emission)[colnames(CO2_emission) == "Fuel.Consumption..Hwy..L.100.km.."]   <- "Fuel.Cons.HW"

summary(CO2_emission$Fuel.Cons.CT)
summary(CO2_emission$Fuel.Cons.HW)

# -----

# Fill null values in CT with corresponding HW values
CO2_emission$Fuel.Cons.CT[is.na(CO2_emission$Fuel.Cons.CT)] <- CO2_emission$Fuel.Cons.HW[is.na(CO2_emission$Fuel.Cons.CT)]

summary(CO2_emission$Fuel.Cons.CT)

# -----

# Scatter Plot: City vs Highway
plot(
  CO2_emission$Fuel.Cons.CT, 
  CO2_emission$Fuel.Cons.HW,
  main = "Fuel Consumption: City vs. Highway ",
  xlab = "Fuel Consumption - City (L/100km)",
  ylab = "Fuel Consumption - Highway (L/100km)",
  col = "darkgreen", pch = 20
  )

# Correlation = 0.9299
cor(CO2_emission$Fuel.Cons.CT, CO2_emission$Fuel.Cons.HW)


# -----



## HYPOTHESIS TESTING ##


# 1. One Sample T-Test : Is CO2 Emissions > 0 ?

colnames(VClass)

# Test if mean CO2 emissions are significantly less than 0
ttest_LESS    <- t.test(VClass$CO2.Emissions..g.km., mu = 0, alternative = "less")
print(ttest_LESS)

# Test if mean CO2 emissions are significantly greater than 0
ttest_GREATER <- t.test(VClass$CO2.Emissions..g.km., mu = 0, alternative = "greater")
print(ttest_GREATER)

# -----

# 2. TWO SAMPLE T-TEST : High vs Low Fuel Consumption

# Splitting Fuel Consumption into two categorical groups: High and Low
VClass$Category <- ifelse(VClass$Fuel.Consumption..Comb..L.100.km.. > median(VClass$Fuel.Consumption..Comb..L.100.km..),
                          "HighFuelConsumption", "LowFuelConsumption")

# Performing T-test: Comparing CO2 emissions between the High Fuel and Low Fuel groups
t_test_fuel <- t.test(CO2.Emissions..g.km. ~ Category, data = VClass)

print(t_test_fuel)


# -----

## ANOVA ##

# 3.1 ANOVA on "Vehicle Class" and its CO2 Emissions

anova_VClass <- aov(CO2.Emissions..g.km. ~ Vehicle.Class, data = VClass)
summary(anova_VClass)

# -----

# 3.2 ANOVA on "FC-COMB" and its CO2 Emissions
anova_FC <- aov(CO2.Emissions..g.km. ~ VClass$Fuel.Consumption..Comb..L.100.km.., data = VClass)
summary(anova_FC)

# -----


## MODELLING - Predicting CO2 Emissions ##


# Model 1: CO2 Emissions ~ Vehicle Class (Categorical Predictor)

# Linear Regression on Vehicle Class and its CO2 Emissions
LR_Vclass <- lm(CO2.Emissions..g.km. ~ Vehicle.Class, data = VClass)

summary(LR_Vclass)

plot(LR_Vclass)

# -----

# Model 2: CO2 Emissions ~ Fuel Consumption Combined (Continuous Predictor)

# Linear Regression on Fuel Consumption Combined and its CO2 Emissions
LR_FCComb <- lm(CO2.Emissions..g.km. ~ Fuel.Consumption..Comb..L.100.km.., data = VClass)

summary(LR_FCComb)

plot(LR_FCComb)

# -----


## 2. Model Diagnostics and Assumption Checks


# Diagnostics for Model 1: LR_Vclass - Linear Regression on Vehicle Class and its CO2 Emissions

# Diagnostic plots:

par(mfrow = c(2, 2))  # Set up a 2x2 grid of plots

plot(LR_Vclass, which = 1)  # Residuals vs. Fitted
plot(LR_Vclass, which = 3)  # Scale-Location
plot(LR_Vclass, which = 2)  # Normal Q-Q
plot(LR_Vclass, which = 5)  # Residuals vs. Leverage

par(mfrow = c(1, 1))

# -----

## Diagnostics for Model 2: LR_FCComb - Linear Regression on Fuel Consumption Combined and its CO2 Emissions

# a. Diagnostic plots:

par(mfrow = c(2, 2))  # Layout for 2x2 diagnostic plots

plot(LR_FCComb, which = 1)  # Residuals vs. Fitted
plot(LR_FCComb, which = 3)  # Scale-Location
plot(LR_FCComb, which = 2)  # Normal Q-Q
plot(LR_FCComb, which = 5)  # Residuals vs. Leverage

par(mfrow = c(1, 1))  # Reset layout
