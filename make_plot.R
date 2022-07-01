library(rvest)
library(janitor)
library(tidyverse)
library(distill)

# Note that geom_bar() calculates the number of inductees each year for us. No
# need for group_by() and summarize(). Is there a way to include the link to the
# exact Wikipedia page as a link, rather than as an ugly text string?

x <- read_rds("rawdata.rds")

my_plot <- x |> 
  ggplot(aes(x = year)) +
  geom_bar() +
  labs(title = "Baseball Hall of Fame Inductions",
       subtitle = "Spike in 2006 associated with Negro League inclusion",
       x = "Year",
       y = "Number of Inductees",
       caption = "Data: Wikipedia")

ggsave("hof_plot.png", my_plot)