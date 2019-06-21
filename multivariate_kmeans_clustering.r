library(readxl) # allows to read excel files
library(plotly) # graphing library

dataset <- read_excel("P1-StartupExpansion.xlsx")

# check out the dataset
head(dataset)
summary(dataset)

new_dataset = dataset[6:8]

set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(new_dataset, i)$withinss)
plot(1:10,
      wcss,
      type = 'b',
      main = paste('The Elbow Method'),
      xlab = 'Number of clusters',
      ylab = 'WCSS')

set.seed(20)
kmeans_results <- kmeans(new_dataset, centers=3,nstart=20)

plot3d(new_dataset, 
        col=kmeans_results$cluster)