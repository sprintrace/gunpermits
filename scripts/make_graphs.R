library(tidyr)
library(tidyverse)
library(here)
library(ggplot2)
library(readr) 


#### GGPlot for GunLaw (the total of all Americans in survey)
Gunlaw <- read_csv("data/analysis_data/Gunlaw.csv")
View(Gunlaw)

transform(Gunlaw, 'Total Americans in Favour' = as.numeric('Total Americans in Favour')) 

names(Gunlaw) <- c("Year", "Total")

ggplot(data=Gunlaw, aes(x = Year, y = Total, group = 1)) +
  geom_line()+
  labs(title = "Percentage of Americans in favour of police backed gun permits", y = "Total % of Americans in favour")


####### GGPlot for GenderAndGunPermit
## load in CSV ##
GenderAndGunPermit <- read_csv("data/analysis_data/GenderAndGunPermit.csv")
View(GenderAndGunPermit)

## create ggplot ##

### turn strings into numbers
transform(GenderAndGunPermit, 'Female' = as.numeric('Female')) 
transform(GenderAndGunPermit, 'Male' = as.numeric('Male')) 

####Make 2 columns side by side into two values in one column one above the other (turn data into long format)
GenderAndGunPermit <- GenderAndGunPermit |> 
  pivot_longer(cols=c('Female', 'Male'), names_to='Gender', values_to='Total')
###### MAKE THE PLOT #######
ggplot(data=GenderAndGunPermit, aes(x = Year, y=Total, group = Gender)) +
  geom_line(aes(colour=Gender))+
  labs(title = "Percentage of American Women vs Men \n in favour of police backed gun permits", y = "Total % in favour")










