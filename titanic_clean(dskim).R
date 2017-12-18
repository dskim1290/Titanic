library(dplyr)
library(tidyr)

#1: Port of embarkation
#Change NA in "embarked" column to "S"

"S"->titanic_original$embarked[is.na(titanic_original$embarked)]

#2: Age
#Calculate the mean of the Age column and use that value to populate the missing values.

titanic_original$age[is.na(titanic_original$age)]<-mean(titanic_original$age,na.rm = TRUE)


#3:Lifeboat 
#You're interested in looking at the distribution of passengers in different lifeboats, but as we know, many passengers did not make it to a boat. 
#Fill these empty slots with a dummy value e.g. the string 'None' or 'NA'

titanic_original$boat[is.na(titanic_original$boat)]<-"None" 


#Cabin
#You have a hunch that the fact that the cabin number is missing might be a useful indicator of survival. 
#Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise.


titanic_original <- titanic_original %>% mutate("has_cabin_number"= ifelse(is.na(titanic_original$cabin),0,1))

#Output to clean file
write.csv(titanic_original,"titanic_clean.csv")