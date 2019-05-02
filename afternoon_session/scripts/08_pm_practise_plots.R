#########################################################################
# 1-day R workshop 
# Afternoon practical session C
# 3rd May 2019
# 08_pm_practise_plots.R
#########################################################################
# Have a go at generating some plots
# library(tidyverse)


# A simple example to get you started -------------------------------------
# A bar plot of all TB cases in Ireland 

# Load the clean WHO data

clean_who <- read_csv("afternoon_session/data/clean_who_tb_data.csv")

who_ire <- clean_who %>%
  filter(country == "Ireland") %>%
  
  # Basic barplot with data by age shown
  ggplot() +
  geom_bar(mapping = aes(x = year, y = total, fill = age),
           stat = "identity") 

who_ire

who_ire + 
  labs(title = "I just added a title")


# Now your turn -----------------------------------------------------------
# Use the WHO data or the RNA data set

clean_brauer <- read_csv("afternoon_session/data/clean_brauer_data.csv")

# or sample data that comes with ggplot2
diamonds <- ggplot2::diamonds

# 1. Draw a couple of plots

basic_plot <- ggplot(data = "?", 
                     mapping = aes(x = "?", y = "?", colour = "?")) +
  geom_...()

# 2. Play with the geoms, aesthetics and themes

basic_plot +
  theme_classic()

basic_plot +
  labs(title = "It's easy to change the title",
       x = "",
       y = "",
       subtitle = "",
       caption = "",
       colour = "",
       tag = "")

basic_plot +
  theme(axis.line.x = "Change the x-axis thickness",
        axis.text.x = "Change the size and colour of the x-axis text", 
        legend.position = "Where will the legend go?") 

# 3. Save a few to file

<<<<<<< HEAD
ggsave("filepath.png")
=======
ggsave("filepath.png")
>>>>>>> 884df54d93493c6ad50e1614b24099de583f7f93
