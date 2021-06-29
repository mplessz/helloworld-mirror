library(tidyverse)
head(iris)

iris %>%
    slice(n = 5:10) %>%
    select(contains("Length"))