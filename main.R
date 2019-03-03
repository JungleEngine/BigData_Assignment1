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
# get records which only has values S, C, Q in embarked column.
dfm <- subset(dfm, dfm$Embarked == "C" | dfm$Embarked == "S" | dfm$Embarked == "Q")
dfm$Embarked <- factor(dfm$Embarked)
summary(dfm)
# Check Age has no NA records.
if(anyNA(dfm$Age)){
  "Age still has NA records"
}
# It is what we expected, yes, because the  empty values in Embarked have no meaning, also
# the deleted rows affected the C, Q, S occurrences.

# Deleting columns (Cabin and Ticket from dataset).
dfm$Cabin <- NULL
dfm$Ticket <- NULL
summary(dfm)



# Remove all columns but passenger names and whether they survived or not.
new_dataset = dfm[,c("Name", "Survived")]
write.csv(new_dataset, "titanic_preprocessed.csv")

