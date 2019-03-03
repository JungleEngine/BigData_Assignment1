# Clean environment 
rm(list=ls())
# Reading dataset.
dfm <- read.csv("titanic.csv")
# Showing dataset dimensions.
dim(dfm)
# Showing dataset structure.
str(dfm)
# Printing first 10 records.
head(dfm, 10)
# Printing last 10 records.
tail(dfm, 10)
# Showing summary.
summary(dfm)

# Showing summary for age only.
summary(dfm$Age)
# Check if dfm$age has NA fields
if(anyNA(dfm$Age)){
  "Age has NA records"
}

# Type of variable embarked.
# Type is factor.
# Embarked has 4 levels
str(dfm$Embarked)
# Embarked levels.
levels(dfm$Embarked)

# Data preprocessing.
# Remove Null Age rows.
dfm <- na.omit(dfm, cols="Age")
# Check Age has no NA records.
if(anyNA(dfm$Age)){
  "Age still has NA records"
}
# get records which only has values S, C, Q in embarked column.
dfm <- dfm[dfm$Embarked == c("C", "S", "Q"),] 
