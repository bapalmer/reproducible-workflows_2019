#########################################################################
# 1-day R workshop 
# Afternoon practical session A
# 3rd May 2019
# 02_pm_readr.R
#########################################################################
# You can load the core tidyverse packages using library(tidyverse)
# But you can also load each package individually just like any other package

# library(readr)

# 1. Read in "brauer_data.csv" using the readr function read_csv()

x <- read_csv("afternoon_session/data/brauer_data.csv")

# Note that readr prints the column specification

# 2. There are additional arguments that can be supplied to this function
# Lets explore some of them manually by clicking the "Import Dataset" button

# It is designed to flexibly parse many types of data found in the wild, 
# including instances where the data unexpectedly changes
# For example, the file contains NAs intermittently

# 3. Let's repeat the process on an .xlsx copy using read_excel from read_xl package

library(readxl) # Not part of the core tidyverse so needs to be called explicitly 

x <- read_xlsx("afternoon_session/data/brauer_data.xlsx")

# The warning messages relate to the presence of NAs in the data

# 4. EAA13.px - Stages of Manufacturing in Trade by State, Statistic and Year
# View the EAA13.px file downloaded from data.gov.ie using Notepad or similar
# This cannot be imported using readr 
# However packages have been developed for many obscure file formats 
# The pxR package allows us to import this .px file as a data frame
# It strips away the metadata and returns the column headings and values

# 5. Import this file using the following lines of code
# Once you have done this, examine it
# install.packages("pxR")

library(pxR)

my_px_object <- read.px("afternoon_session/data/EAA13.px")
eaa13_df <- as.data.frame(my_px_object)

# readr also allow you to write you data files back to disc
# write_csv(data_to_save, "filename.csv")

# 6. Create a file on your data folder containing the EAA13 data

write_csv(eaa13_df, "afternoon_session/data/clean_eaa13.csv")

rm(eaa13_df, my_px_object)
