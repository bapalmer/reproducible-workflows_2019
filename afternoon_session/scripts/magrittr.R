#########################################################################
# 1-day R workshop 
# Afternoon practical session A
# 3rd May 2019
# magrittr.R
#########################################################################
# Load the magrittr package

library(magrittr)

# The pipe (%>%) operator -------------------------------------------------
# Starting out your data might look like this

messy_data <- read_csv("afternoon_session/data/brauer_data.csv") 

cleaner_data <-  select(messy_data, c("GID", "NAME", "G0.05", "G0.1", 
                                      "G0.15", "G0.2", "G0.25", "G0.3"))

# Two object are now in our global environment
# Using the pipe, we can combine multipe operations

cleaner_data <- read_csv("afternoon_session/data/brauer_data.csv") %>%
  
  select(c("GID", "NAME", "G0.05", "G0.1", 
                       "G0.15", "G0.2", "G0.25", "G0.3"))
  
# The %$% operator --------------------------------------------------------
# Many functions accept arguements as vectors, not data frame
#e.g a simple correlation

cor(mtcars$disp, mtcars$mpg)

mtcars %>%
  cor(disp, mpg)

disp <- mtcars$disp
mpg <- mtcars$mpg

class(disp)

cor(disp, mpg)

# %$% 'explodes' the variables out of the data frame 
# Very useful when working with base R functions 

mtcars %$% 
  cor(disp, mpg)

# This will come up again when we talk about tibbles

# The tee pipe (%T>%) operator --------------------------------------------

rnorm(100) %>%
  matrix(ncol = 2) %>%
  plot() %>%
  str() # Display the internal structure of an R object

# In the example above objects aren't returned and the pipe terminates
# str() doesn't take an arguement

# The %T>% operator returns the lefthand side
  
rnorm(100) %>%
  matrix(ncol = 2) %T>%
  plot() %>%
  str()