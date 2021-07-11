            #Task-2: Prediction using Unsupervised ML
                    #author: Ashmita Roy Medha

#install.packages("ClusterR")
#install.packages("cluster")
#install.packages("factoextra")
#install.packages("tidyverse")

#Load data
df <- read.csv("E:/Internships/Grip/Prediction/data2.csv")
View(df)

#Drop the first column "Id"
df <- df[,-1]
View(df)

#check missing values
sum(is.na(df))

#information about the dataset
summary(df)

#import library and plot the dataset
library(ggplot2)
ggplot(df, aes(PetalLengthCm, PetalWidthCm)) + geom_point(aes(col=Species), size=3)

df <- df[,-5] #dropping the 'Species' column
View(df) 

#To find the optimal number of clusters
#there are some methods: Elbow, Silhouette, Gap statistic
#I will implement the Elbow method

#import libraries  
library(cluster)
library(factoextra)
library(tidyverse)

#plot the elbow method
set.seed(123)
fviz_nbclust(df, kmeans, method = "wss")+ geom_vline(xintercept = 3, linetype = 2)

#The result suggests that 3 is the optimal number of clusters.
#As it appears to be the bend in the knee (or elbow).

#Clustering 
km <- kmeans(df, centers = 3, nstart = 25)
str(km) #internal structure 

#plot the dataset after clustering
fviz_cluster(km, data = df,
             palette = c("#FC4E07", "#E7B800", "#00AFBB"),
             ellipse.type = "euclid", # Concentration ellipse
             star.plot = TRUE, # Add segments from centroids to items
             repel = TRUE, # Avoid label overplotting (slow)
             ggtheme = theme_minimal()
)
#Cluster-1: Iris-setosa
#Cluster-2: Iris-versicolor
#Cluster-3: Iris-virginica

#Showing the plot after saving as png




#----------End of the code-----------


