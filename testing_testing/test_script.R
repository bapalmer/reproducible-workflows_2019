# Install and load the tidyverse

install.packages('tidyverse')
library(tidyverse)

# Does this work on your system? ------------------------------------------

nutrient_names <- c(G = "Glucose", L = "Leucine", P = "Phosphate",
                    S = "Sulfate", N = "Ammonia", U = "Uracil")

# Some example R code we'll see again during the workshop
# Here we're reading in data from a remote source and cleaning it

cleaned_genes_tbl <- read_delim("testing_testing/data/brauer2008_data.tds",
                               delim = "\t") %>%
  separate(NAME, c("name", "BP", "MF", "systematic_name", "number"),
           sep = "\\|\\|")  %>%
  mutate_at(vars(name:systematic_name), funs(trimws)) %>%
  select(-number, -GID, -YORF, -GWEIGHT) %>%
  gather(sample, expression, G0.05:U0.3) %>%
  separate(sample, c("nutrient", "rate"), sep = 1, convert = TRUE) %>%
  mutate(nutrient = plyr::revalue(nutrient, nutrient_names)) %>%
  filter(!is.na(expression), systematic_name != "")

# Plot the clean data

cleaned_genes_tbl %>%
  filter(BP == "leucine biosynthesis") %>%
  ggplot(mapping = aes(x = rate, y = expression, color = nutrient)
  ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ name)
