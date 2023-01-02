#Loading the Data
install.packages("ggdag","scales","broom","patchwork")
library("readr")
library("tidyverse")
library("ggdag")
library("scales")
library("broom")
library("patchwork")
library("dplyr")
village_randomised <- read_csv("/Users/rashmi/Desktop/village_randomized.csv")
glimpse(village_randomised)

# Checking the balance of the program 

village_randomised %>%
  count(program) %>% 
  mutate(prop = n / sum(n))

#Checking pre-treatment characteristics of Treatment and Control Groups 
village_randomised %>% 
  group_by(program) %>% 
  summarize(prop_male = mean(sex_num),
            avg_age = mean(age),
            avg_pre_income = mean(pre_income))
