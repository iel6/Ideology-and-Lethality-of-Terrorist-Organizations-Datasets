# Subset data further
require(tidyverse)
tt = read_csv("~/Desktop/gtd_active_group_years.csv")
tt %>% 
  arrange(gname,year) %>%
  filter(n_active_months >= 4) %>% # this threshold matter... how many active years you need to be. 
  group_by(gname) %>% 
  count() %>% 
  filter(n>=2) %>% 
  write_csv("~/Desktop/GTD2.csv")