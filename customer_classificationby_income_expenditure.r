# load libraries
library(readxl) # allows to read excel files
library(plotly) # graphing library

# fetch dataset
dataset <- read_excel("data.xlsx")

# check out the dataset
head(dataset)

# plot a scatter plot of the data to get a visual idea of the clusters you might get
p <- plot_ly(data = dataset, x = dataset$`income (k)`, y = dataset$`spend (k)`)
p

# remove unwanted columns
new_dataset = dataset[2:3]

# checkout the new dataset
head(new_dataset)

# use elbow method to get the optimum number of k clusters to work with
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(new_dataset, i)$withinss)
plot(1:10,
      wcss,
      type = 'b',
      main = paste('The Elbow Method'),
      xlab = 'Number of clusters',
      ylab = 'WCSS')
# in the case above, I can do 4 or 5. I pick 5

# fitting k-means
set.seed(20)
kmeans = kmeans(x = new_dataset, centers = 6)
y_kmeans = kmeans$cluster


# plot the clusters
library(cluster)
clusplot(new_dataset,
          y_kmeans,
          lines = 0,
          shade = TRUE,
          color = TRUE,
          labels = 2,
          plotchar = FALSE,
          span = TRUE,
          main = paste('Clusters of customers'),
          xlab = 'Annual Income',
          ylab = 'Spending Score')