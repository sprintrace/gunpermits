#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(readxl)

#### Clean data ####
#### get from excel
GenderAndGunPermit <- read_excel("data/raw_data/GenderAndGunPermit.xlsx")
View(GenderAndGunPermit)
  

Gunlaw <- read_excel("data/raw_data/Gunlaw.xlsx")
View(Gunlaw)

GunlawHighestDegree <- read_excel("data/raw_data/GunlawHighestDegree.xlsx")
View(GunlawHighestDegree)  

GunlawRepVsDem <- read_excel("data/raw_data/GunlawRepVsDem.xlsx")
View(GunlawRepVsDem)  

RaceAndGunlaw <- read_excel("data/raw_data/RaceAndGunlaw.xlsx")
View(RaceAndGunlaw)  



################################################ Repeat 32 - 42 for the other excel files
#### Tidy up Data ####

##  1

Gunlaw <- Gunlaw |> 
  slice(7:8)
Gunlaw[1,1]<-"Year"
names(Gunlaw)[1]<-"C1"

#### PIVOT LONGER ####

Gunlaw <- Gunlaw[-1] |> t() |> as.data.frame()


####continue 
names(Gunlaw) <- c("Year", "Total Americans in Favour")

##### new lines to fix the num in brackets #####

Gunlaw$'Total Americans in Favour' <- sapply(Gunlaw$'Total Americans in Favour', function(x) { gsub("[\r\n]", "", x) })

Gunlaw[c('Total','Y')] <- str_split_fixed(Gunlaw$'Total Americans in Favour', ' ', 2)

Gunlaw <- Gunlaw |>
  select(c("Year", "Total"))

names(Gunlaw) <- c("Year", "Total Americans in Favour")







##  2

GenderAndGunPermit <- GenderAndGunPermit |> 
  slice(7:9)



#### PIVOT LONGER #### 

GenderAndGunPermit <- GenderAndGunPermit[-1] |> t() |> as.data.frame()

names(GenderAndGunPermit)[1]<-"Year"
names(GenderAndGunPermit)[2]<-"Female"
names(GenderAndGunPermit)[3]<-"Male"

##### new lines to fix the num in brackets #####

GenderAndGunPermit$'Female' <- sapply(GenderAndGunPermit$'Female', function(x) { gsub("[\r\n]", "", x) })

GenderAndGunPermit[c('F','Y')] <- str_split_fixed(GenderAndGunPermit$'Female', ' ', 2)

#### Male Data () removal

GenderAndGunPermit$'Male' <- sapply(GenderAndGunPermit$'Male', function(x) { gsub("[\r\n]", "", x) })

GenderAndGunPermit[c('M','YY')] <- str_split_fixed(GenderAndGunPermit$'Male', ' ', 2)

#### remove the unwanted collumbs ####
GenderAndGunPermit <- GenderAndGunPermit |>
  select(c("Year", "F", "M"))

names(GenderAndGunPermit) <- c("Year", "Female", "Male")  


 



##  3

GunlawHighestDegree <- GunlawHighestDegree |> 
  slice(7:10)
GunlawHighestDegree[1,1]<-"Year"
names(GunlawHighestDegree)[1]<-"C1"

#### PIVOT LONGER ####

## new line

names(GunlawHighestDegree)[1]<-"Year"
names(GunlawHighestDegree)[2]<-"Degree or Higher"
names(GunlawHighestDegree)[3]<-"Highschool"
names(GunlawHighestDegree)[4]<-"No Highschool"
#### old lines

GunlawHighestDegree <- GunlawHighestDegree[-1] |> t() |> as.data.frame()

names(GunlawHighestDegree) <- c("Year", "Degree or Higher", "Highschool","No Highschool")



##### new lines to fix the num in brackets #####

GunlawHighestDegree$'Degree or Higher' <- sapply(GunlawHighestDegree$'Degree or Higher', function(x) { gsub("[\r\n]", "", x) })

GunlawHighestDegree[c('D','extra')] <- str_split_fixed(GunlawHighestDegree$'Degree or Higher', ' ', 2)

##### repeat Line 122 - 124 with other variables #####
## Highschool

GunlawHighestDegree$'Highschool' <- sapply(GunlawHighestDegree$'Highschool', function(x) { gsub("[\r\n]", "", x) })

GunlawHighestDegree[c('High','extra2')] <- str_split_fixed(GunlawHighestDegree$'Highschool', ' ', 3)

## no Highschool


GunlawHighestDegree$'No Highschool' <- sapply(GunlawHighestDegree$'No Highschool', function(x) { gsub("[\r\n]", "", x) })

GunlawHighestDegree[c('NoH','extra3')] <- str_split_fixed(GunlawHighestDegree$'No Highschool', ' ', 4)


#### remove the unwanted collumbs ####
GunlawHighestDegree <- GunlawHighestDegree |>
  select(c("Year","D","High","NoH"))

names(GunlawHighestDegree) <- c("Year", "Degree or Higher", "Highschool","No Highschool")  








##  4

RaceAndGunlaw <- RaceAndGunlaw |>
  slice(7:10)
RaceAndGunlaw[1,1]<-"Year"
names(RaceAndGunlaw)[1]<-"C1"

## New line
#names(RaceAndGunlaw)[1]<-"Year"
#names(RaceAndGunlaw)[2]<-"White"
#names(RaceAndGunlaw)[3]<-"Black"
#names(RaceAndGunlaw)[4]<-"Other"

#### PIVOT LONGER ####

RaceAndGunlaw <- RaceAndGunlaw[-1] |> t() |> as.data.frame()
names(RaceAndGunlaw) <- c("Year", "White", "Black", "Other")


##### New lines to fix the num in brackets #####

RaceAndGunlaw$'White' <- sapply(RaceAndGunlaw$'White', function(x) { gsub("[\r\n]", "", x) })
RaceAndGunlaw[c('White',' ')] <- str_split_fixed(RaceAndGunlaw$'White', ' ', 2)  # Assuming space separates values

# BLACK

RaceAndGunlaw$'Black' <- sapply(RaceAndGunlaw$'Black', function(x) { gsub("[\r\n]", "", x) })
RaceAndGunlaw[c('Black',' ')] <- str_split_fixed(RaceAndGunlaw$'Black', ' ', 2)  # Assuming space separates values

# Others

RaceAndGunlaw$'Other' <- sapply(RaceAndGunlaw$'Other', function(x) { gsub("[\r\n]", "", x) })
RaceAndGunlaw[c('Other',' ')] <- str_split_fixed(RaceAndGunlaw$'Other', ' ', 2)  # Assuming space separates values


#### remove the unwanted collumbs ####
RaceAndGunlaw <- RaceAndGunlaw |>
  select(c("Year","White","Black","Other"))

### LINE IS REDUNDANT
#names(RaceAndGunlaw) <- c("Year", "White", "Black", "Other")


 








##  5

GunlawRepVsDem <- GunlawRepVsDem |> 
  slice(7:10)
GunlawRepVsDem[1,1]<-"Year"
names(GunlawRepVsDem)[1]<-"C1"

#### PIVOT LONGER ####

GunlawRepVsDem <- GunlawRepVsDem[-1] |> t() |> as.data.frame()

#### Add labels to Columbs ####
names(GunlawRepVsDem) <- c("Year", "Democrats", "Republicans", "Other/Non-affiliated")


##### new lines to fix the num in brackets #####

GunlawRepVsDem$'Democrats' <- sapply(GunlawRepVsDem$'Democrats', function(x) { gsub("[\r\n]", "", x) })

GunlawRepVsDem[c('D','extra')] <- str_split_fixed(GunlawRepVsDem$'Democrats', ' ', 2)

##### repeat Line 122 - 124 with other variables #####
## Highschool

GunlawRepVsDem$'Republicans' <- sapply(GunlawRepVsDem$'Republicans', function(x) { gsub("[\r\n]", "", x) })

GunlawRepVsDem[c('R','extra2')] <- str_split_fixed(GunlawRepVsDem$'Republicans', ' ', 3)

## no Highschool


GunlawRepVsDem$'Other/Non-affiliated' <- sapply(GunlawRepVsDem$'Other/Non-affiliated', function(x) { gsub("[\r\n]", "", x) })

GunlawRepVsDem[c('OTH','extra3')] <- str_split_fixed(GunlawRepVsDem$'Other/Non-affiliated', ' ', 4)

  
#### remove the unwanted collumbs ####
GunlawRepVsDem <- GunlawRepVsDem |>
  select(c("Year","D","R","OTH"))

names(GunlawRepVsDem) <- c("Year", "Democrats", "Republicans","Other/Non-affiliated")  










#### Save data #### 

write_csv(Gunlaw, "data/analysis_data/Gunlaw.csv")

write_csv(GenderAndGunPermit, "data/analysis_data/GenderAndGunPermit.csv")

## below not loaded as csv yet

write_csv(GunlawHighestDegree, "data/analysis_data/GunlawHighestDegree.csv")

write_csv(GunlawRepVsDem, "data/analysis_data/GunlawRepVsDem.csv")

write_csv(RaceAndGunlaw, "data/analysis_data/RaceAndGunlaw.csv")

