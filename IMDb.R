#
# IMDb Kaggle Competition
#

# Libraries
library(tidyverse)
library(DataExplorer)

# Read data
train <- read_csv("IMDBTrain.csv")
test <- read_csv("IMDBTest.csv")

# EDA

# Overall summary
summary(train)
glimpse(train)

# Missing data
plot_missing(train)
mean(apply(is.na(train), 1, sum)>0)

# Gross vs score
ggplot(train, aes(x=gross, y=imdb_score)) + geom_point()
with(train, cor(gross,imdb_score, use="complete.obs"))

# Scatterplot of budget vs score
ggplot(train, aes(x=budget, y=imdb_score)) + geom_point()
# Need to convert budget to uniform currency
train %>% filter(budget>1e8, country=="USA") %>% select(movie_title)

# Look at first 3 columns of train
summary(train[,1:3])
table(train$color)
