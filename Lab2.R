Data <- read.csv("EconomistData.csv",header = TRUE)
library(ggplot2)


p1 <- ggplot(Data, aes(y = HDI, x = CPI))
p1 + geom_point(color = "blue") + geom_smooth()
p1 + geom_point(aes(color = Region)) + geom_smooth() + geom_text(aes(label=Country), size = 2)
p1 + geom_point(aes(color = Region)) + geom_smooth() + geom_text(aes(label=Country, size = HDI.Rank))


subset_MENA <- Data[which(Data$Region == "MENA"), ]
p2 <- ggplot(subset_MENA, aes(y = HDI, x = CPI))
p2 + geom_point(aes(color = Country)) + geom_smooth()
p2 + geom_point(aes(color = Country)) + geom_smooth() + geom_text(aes(label = Country), size = 2)


subset_EUROPE <- Data[which(Data$Region == "EU W. Europe"), ]
p3 <- ggplot(subset_EUROPE, aes(y = HDI, x = CPI))
p3 + geom_point(aes(color = Country)) + geom_smooth() + geom_text(aes(label = Country), size = 3)


subset_EUROPE_Egypt <- Data[which(Data$Region == "EU W. Europe" | Data$Country == "Egypt"), ]
p4 <- ggplot(subset_EUROPE_Egypt, aes(y = HDI, x = CPI))
p4 + geom_point(aes(color = Country)) + geom_smooth() + geom_text(aes(label = Country), size = 3)
