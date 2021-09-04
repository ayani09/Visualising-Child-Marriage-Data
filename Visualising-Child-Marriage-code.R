# load dplyr, ggplot2, readr, readxl, tidyverse

library(dplyr)
library(ggplot2)
library(readr)
library(readxl)
library(tidyverse)

# import dataset and set all "-" to NA value

Child_Marriage_Data <- read_excel("Child-Marriage-Data.xlsx", na = "-")
print(Child_Marriage_Data)

# clean up the dataset
# drop columns not needed
# remove any rows with NA values

CM_Data <- subset(Child_Marriage_Data, select = -c(3, 5, 6, 7, 9, 10, 11))
CM_Data
CMData <- na.omit(CM_Data)

# let's check what desc order would look like

sort(CMData$female_married_by_18, decreasing = TRUE)
CMData

# create a graph showing top 10 countries with highest CM rates for girls 18 and under in desc order
# use -female_married... to ensure it shows in desc order

CMData_order <- arrange(CMData, -female_married_by_18)
CMData_top10 <- CMData_order[1:10,]
ggplot(CMData_top10, aes(x = reorder(country, -female_married_by_18), y = female_married_by_18, group = 1)) +
  geom_col() +
  ylab("% of girls married by 18 years old") +
  xlab("Country")




