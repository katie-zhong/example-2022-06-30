library(rvest)
library(janitor)
library(tidyverse)
library(distill)

# GadgetSelector is still a mystery to me. I just guessed that "table" would
# work. Not sure if something like "td" would be different and/or better. Would
# be nice to specify the exact table I want, rather than getting 6 of them.

all_tables <- "https://en.wikipedia.org/wiki/List_of_members_of_the_Baseball_Hall_of_Fame" |> 
  read_html() |> 
  html_elements("table") |> 
  html_table()

x <- all_tables[[3]] |> 
  clean_names() |> 
  mutate(year = ifelse(year == 19425, 1942, year)) |> 
  mutate(year = ifelse(year == 19445, 1944, year)) |> 
  mutate(year = ifelse(year == 20206, 2020, year)) 

write_rds(x, "rawdata.rds")