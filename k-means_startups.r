library(readxl) # allows to read excel files
library(plotly) # graphing library

dataset <- read_excel("P1-StartupExpansion.xlsx")

# check out the dataset
head(dataset)

p <- plot_ly(data = dataset, x = dataset$`Marketing Spend`, y = dataset$Revenue)
p

new_dataset = dataset[6:7]

set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(new_dataset, i)$withinss)
plot(1:10,
      wcss,
      type = 'b',
      main = paste('The Elbow Method'),
      xlab = 'Number of clusters',
      ylab = 'WCSS')

#set.seed(20)
#kmeans = kmeans(x = new_dataset, centers = 2)
#y_kmeans = kmeans$cluster

# plot the clusters
#library(cluster)
#clusplot(new_dataset,
          #y_kmeans,
          #lines = 0,
          #shade = TRUE,
          #color = TRUE,
          #labels = 2,
          #plotchar = FALSE,
          #span = TRUE,
          #main = paste('Clusters of customers'),
          #xlab = 'Annual Income',
          #ylab = 'Spending Score')

kmeans_results <- kmeans(new_dataset, centers=3,nstart=20)
plot(new_dataset,
      main="k-means with 3 clusters",
      xlab="",
      ylab="",
      col=kmeans_results$cluster)