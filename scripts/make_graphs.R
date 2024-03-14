library(tidyr)
library(tidyverse)
library(here)
library(ggplot2)



library(readr) 
Gunlaw <- read_csv("data/analysis_data/Gunlaw.csv")
View(Gunlaw)

transform(Gunlaw, 'Total Americans in Favour' = as.numeric('Total Americans in Favour')) 

names(Gunlaw) <- c("Year", "Total")

ggplot(data=Gunlaw, aes(x = Year, y = Total, group = 1)) +
  geom_line()+
  labs(title = "Percentage of Americans in favour of police backed gun permits", y = "Total % of Americans in favour")

















