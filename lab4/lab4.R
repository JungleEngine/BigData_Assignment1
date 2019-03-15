# Clean environment 
# Req1
rm(list=ls())
library("png")
library("ggplot2")

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


# Req2
img <- readPNG("bird_small.png")
img_dm <- dim(img)
img_dfm <- data.frame( R = as.vector(img[,,1]),
                       G = as.vector(img[,,2]),
                       B = as.vector(img[,,3]))

# Perform clustering. 
img_km <- kmeans(img_dfm,16,15)

# plotting clusters.
img_clusters<-as.vector(img_km$cluster)

img_clusters_val <- img_km$centers[img_clusters,]
# Centers display the needed RGB values only (16 value only)

# Assign clusters to pixels.
img_dfm$R <- img_clusters_val[,1]
img_dfm$G <- img_clusters_val[,2]
img_dfm$B <- img_clusters_val[,3]
writeImage(img_dfm, "compressed.png")
img_compressed <- data.matrix(img_dfm, rownames.force = NA)
dim(img_compressed) <- c(128,128)
writePNG(img_compressed, "compressed.png")
