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
GenderAndGunPermit<-GenderAndGunPermit %>% mutate(V11=ifelse(V1=="Year","1972",V1))
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

##  2

GenderAndGunPermit <- GenderAndGunPermit |> 
  slice(7:9)
GenderAndGunPermit[1,2]<-"Year"
names(GenderAndGunPermit)[1]<-"C1"

#### PIVOT LONGER ####

GenderAndGunPermit <- GenderAndGunPermit[-1] |> t() |> as.data.frame()


##  3

GunlawHighestDegree <- GunlawHighestDegree |> 
  slice(8:10)
GunlawHighestDegree[1,1]<-"Year"
names(GunlawHighestDegree)[1]<-"C1"

#### PIVOT LONGER ####

GunlawHighestDegree <- GunlawHighestDegree[-1] |> t() |> as.data.frame()

##  4

RaceAndGunlaw <- RaceAndGunlaw |> 
  slice(7:10)
RaceAndGunlaw[1,1]<-"Year"
names(RaceAndGunlaw)[1]<-"C1"

#### PIVOT LONGER ####

RaceAndGunlaw <- RaceAndGunlaw[-1] |> t() |> as.data.frame()

##  5

names(GunlawRepVsDem) <- c("Year", "Democrats", "Republicans", "Other/Non-affiliated")


GunlawRepVsDem <- GunlawRepVsDem |> 
  slice(7:10)
GunlawRepVsDem[1,1]<-"Year"
names(GunlawRepVsDem)[1]<-"C1"

#### PIVOT LONGER ####

GunlawRepVsDem <- GunlawRepVsDem[-1] |> t() |> as.data.frame()

################################################

######## splitstring get rid of values in brackets ######

####### rename colombs #### https://stackoverflow.com/questions/4350440/split-data-frame-string-column-into-multiple-columns


GenderAndGunPermit <- GenderAndGunPermit |> 
  slice(7:9)


#### Save data ####

write_csv(Gunlaw, "data/analysis_data/Gunlaw.csv")

write_csv(GenderAndGunPermit, "data/analysis_data/GenderAndGunPermit.csv")

write_csv(GunlawHighestDegree, "data/analysis_data/GunlawHighestDegree.csv")

write_csv(GunlawRepVsDem, "data/analysis_data/GunlawRepVsDem.csv")

write_csv(RaceAndGunlaw, "data/analysis_data/RaceAndGunlaw.csv")

