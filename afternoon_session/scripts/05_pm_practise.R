#########################################################################
# 1-day R workshop 
# Afternoon practical session B
# 3rd May 2019
# 05_pm_practise.R
#########################################################################
# Lets take what we've seen so far and apply it to a messy data set
# library(tidyverse)

# Open the who_tb_data.csv file using MS Excel or other spreadsheet software
# This is the same data as contained in the tidyr::who with some tweaks

# Populate this script as you go through the individual steps

# 1. Read in the WHO TB data as "who_raw"
# Remember the tab shortcut from earlier??

who_raw <- read_csv("")

# Ensure the data is loaded correctly

View(who_raw)

# Examine the column names to inform the following steps

colnames(who_raw)

# 2. country, iso2 and iso3 all relate to country name

table(is.na(who_raw$country))
table(is.na(who_raw$iso2))
table(is.na(who_raw$iso3))

# Use the select function to remove columns iso2 and iso3

who_v1 <- who_raw %>%
  select()

# 3. Use gather() to gather the columns starting at new_ep_f014 to new_sp_m65
# Call the key column "key" and the value column "cases"
# Include the arguement na.rm = TRUE

who_v2 <- who_v1 %>%
  gather(key = key, value = cases, new_ep_f014:new_sp_m65) 

# Check the data for any more NA's using is.na()

table(is.na(who_v2$cases))

# 4. We need to remove those rows where cases are given as NA
# Use the filter function to remove all rows where the cases column
# entry is NA

who_v3 <- who_v2 %>%
  filter()

# The data should now comprise 76046 rows

# 5. Use separate() on the 'key' column - what separator will you use (sep = ?)
# How many columns will be returned?
# What names will you give them?

who_v4 <- who_v3 %>%
  separate()

# Hint: Using the identifier "new_ep_f014" as an example
# The first three letters of each column denote whether the column contains
# new or old cases
# Next two letters describes the type of TB (ep stand for extrapulmonary)
# The next letter gives the sex (f = female)
# The numbers give the age group (014 = 0-14 years)

# 6. We need to use separate() again to place gender and age their own columns 
# What separator should be used this time?

who_v5 <- who_v4 %>%
  separate()

# Use spread() to place male and female cases in separate columns

who_v6 <- who_v5 %>%
  spread()

# Use mutate() to create a new column called total which will be 
# the sum of male and female cases

who_v7 <- who_v6 %>%
  spread()

# 9. Combine group_by() and summarise() to get the maximum number
# of TB cases in Ireland by TB type

ire_tb_max <- who_v7 %>%
  filter(country == "Ireland") %>%
  group_by() %>%
  summarise()

# Additional tasks --------------------------------------------------------
# Well done on successfully making it this far!
# If you want to practice some more...

# Use filter() to obtain information on all countries with more than 1000 sp cases

# Use the magrittr operator (%>%) to create one continuous chuck of code
# to re-create what we did above, without all the intermediate tibbles

# Write your cleaned tibble to file using write_csv()
