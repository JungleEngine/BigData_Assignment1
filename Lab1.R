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


# Males and Females
Males <- dfm[which(dfm$Gender == "male"), ]
Females <- dfm[which(dfm$Gender == "female"), ]
nrow(Males)
nrow(Females)

# Pie Chart of Genders
cnt <- c(nrow(Males), nrow(Females))
lbls <- c("Males", "Females")
pie(cnt, labels = lbls, main = "Pie Chart of Genders in Titanic")
pie(cnt, labels = lbls, main = "Pie Chart of Genders in Titanic", col = c("blue", "red"))

# Pie Chart of Survivors in Titanic
Males_Survived <- Males[which(Males$Survived == "1"), ]
nrow(Males_Survived)
Females_Survived <- Females[which(Females$Survived == "1"), ]
nrow(Females_Survived)
pie(c(nrow(Males_Survived), nrow(Females_Survived)), labels = lbls, main = "Pie Chart of Survivors in Titanic", col = c("red", "blue"))

# Stacked Bar Chart of Survivors of Each Class
counts <- table(dfm$Survived, dfm$Pclass)
barplot(counts, ylab = "Count", xlab = "Class", main = "Stacked Bar Chart of Survivors of each class", col = c("blue","red"))
legend("top", title = "Survived", legend = sort(unique(dfm$Survived)), fill = c("red","blue"))

# BoxPlot of Age
boxplot(dfm$Age, main = "Age")

# Density Distribution of Age
plot(density(dfm$Age[which(dfm$Age != " ")]), main = "Age Distribution")


# Remove all columns but passenger names and whether they survived or not.
new_dataset = dfm[,c("Name", "Survived")]
write.csv(new_dataset, "titanic_preprocessed.csv")

