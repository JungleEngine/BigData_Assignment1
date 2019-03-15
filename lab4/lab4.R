# Clean environment 
rm(list=ls())

# Set working directory with source file's directory.
dir <- dirname(parent.frame(2)$ofile)
setwd(dir)
getwd()
# Reading dataset.
dfm <- read.csv("clustering_data.csv")

# Plotting data.
plot(dfm)

# Perform clustering with k=10.
km <- kmeans(dfm,10,15)
km$centers
# Plot each point with its cluster
plot(dfm, col=km$cluster)
# Plot centroids.
points(km$center,col=1:10,pch=24,cex=1.5, bg=1:10)
# Difference between points and plot:
# points only plots points to an existing plot while plot creates a new plot through plot.new.

# Determine best numebr of clusters.
# Method1: within sum of squares.
# 2 -> On columns.
wss <- (nrow(dfm)-1)*sum(apply(dfm,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(dfm, centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")
# Choosing k=3, from both visual and 
##############

# Method2 
nc <- NbClust(dfm, min.nc=2, max.nc=15, method="kmeans")
# Tabulate voting result.
t<-table(nc$Best.n[1,])
t
# Choose k=3 as best.
# Clustering with k=3.
# Perform clustering with k=10.
km2 <- kmeans(dfm,3,15)
km2$centers
# Plot each point with its cluster
plot(dfm, col=km2$cluster)
# Plot centroids.
points(km2$center,col=4:6,pch=24,cex=1.5, bg=4:6)

