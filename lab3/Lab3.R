
#Req2
library(arules)
library(arulesViz)

#Req3
Data <- read.transactions("AssociationRules.csv",header = FALSE)

#Req4
inspect(Data[0:100])

#Req5
itemFrequency(Data, type = "absolute", main="Item Frequency")[0:2]

#Req6
itemFrequencyPlot(Data, topN = 5, type = "absolute", main="Item Frequency")

#Req7
rules <- apriori(Data, parameter = list(supp = 0.01, conf = 0.5, maxlen=3))
inspect(rules)

#Req8
rules_by_support <- sort(rules, decreasing = TRUE, by = "support")
inspect(head(rules_by_support))

#Req9
rules_by_confidence <- sort(rules, decreasing = TRUE, by = "confidence")
inspect(head(rules_by_confidence))

#Req10
rules_by_lift <- sort(rules, decreasing = TRUE, by = "lift")
inspect(head(rules_by_lift))


