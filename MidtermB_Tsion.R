#for practice exam lab and exam
#Setting directory
source <- "/Users/tsiontaye/Desktop/SYS 3501/Data/"
getwd()
setwd("/Users/tsiontaye/Desktop/SYS 3501/Data/")
data <- read.csv("housing-prices.csv")
data
#getting min and max info
index <- which.min(data$Price)
data[index, ]
index <- which.max(data$Price)
data[index, ]
#Checking size outliers by boxplot
data$Size
boxplot(data$Size, main = "Boxplot of Housing Sizes", ylab = "Size (sq ft)")

#What is the maximum value of the outliers in Size?
max(data$Size)
#Create a new data frame with the outliers from the Size variable, then answer the following two questions.
outliers <- data[data$Size > 4000, ]
outliers
#How to get the number of outliers in Size?
boxplot.stats(data$Size)$out
#whole row of outliers in new var
newframe <-data[boxplot.stats(data$Size)$out, ]
newframe
dim

newframe
#Which of the following statements are true about the box plot of Bath?
boxplot(data$Bath, main = "Boxplot of Number of Baths", ylab = "Number of Baths")

#Use a scatter plot matrix or individual scatter plots to determine the variable in the data set that has the strongest linear relationship with Size. What is it?
library(psych) 
pairs.panels(data)
#histogram of Size
hist(data$Size, main = "Histogram of Housing Sizes", xlab = "Size (sq ft)", col = "lightblue", border = "black")
#total sum of price for all Old homes in the data set
oldsum <- data[data$Age == "Old", ]
oldsum$Price
sum(oldsum$Price)
#Make a frequency heat map of Baths and Rooms. Answer the following question
library(ggplot2)
ggplot(data, aes(x = Bath.as.factor, y = Rooms.as.factor)) +
  geom_bin2d() +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(title = "Heatmap of Baths vs Rooms", x = "Number of Baths", y = "Number of Rooms") +
  theme_minimal()


?as.factor

# Install It
install.packages("VIM")
# Load the VIM library
library(VIM)

# Load the airquality dataset
data("airquality")

# "airquality" loaded into your working environment. Display the first few rows of the dataset
head(airquality)
#Draw scatterplot matrix for "Ozone", "Solar.R", "Wind", "Temp" i
aggregate(Temp ~ Month, data = airquality, FUN = mean)
max(mean(airquality$Temp, na.rm = TRUE))
# Create scatterplot matrix
pairs(airquality[, c("Ozone", "Solar.R", "Wind", "Temp")],
      main = "Scatterplot Matrix of Air Quality Variables",
      pch = 19, col = "steelblue")
#Create box plots for "Wind" by "Month" to visualize the distribution of Wind across different Months. 
boxplot(Wind ~ Month, data = airquality,
        main = "Boxplot of Wind by Month",
        xlab = "Month", ylab = "Wind (mph)",
        col = "lightgreen")
