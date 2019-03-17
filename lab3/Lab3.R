
# Req2
library(arules)
library(arulesViz)

# Req3
Data <- read.transactions("AssociationRules.csv",header = FALSE)

# Req4
inspect(Data[0:100])

# Req5
itms <- itemFrequency(Data, type = "absolute")
head(sort(itms, decreasing = TRUE), n = 2)

# Req6
itemFrequencyPlot(Data, topN = 5, type = "absolute", main="Item Frequency")

# Req7
rules <- apriori(Data, parameter = list(supp = 0.01, conf = 0.5, maxlen=3))
inspect(rules)

# Req8
rules_by_support <- sort(rules, decreasing = TRUE, by = "support")
inspect(head(rules_by_support))

# Req9
rules_by_confidence <- sort(rules, decreasing = TRUE, by = "confidence")
inspect(head(rules_by_confidence))

# Req10
rules_by_lift <- sort(rules, decreasing = TRUE, by = "lift")
inspect(head(rules_by_lift))

# Req11
plot(rules, method = "scatterplot", measure = c("support", "confidence"), shading = "lift")

# Req12
# Most interesting rules are the correlation between item15, item56, item84 and item49:
# {item15,item56} => {item49}
# {item15,item49} => {item56}
# {item49,item56} => {item15}
# {item56,item84} => {item49}
# ... and their combinations
#
# The four items are highly correlated with high lift values, which means users who buy
# a single item of those items will likely buy the other three items.
# So the company should think of making offers or bundles of these items to increase
# their earnings
