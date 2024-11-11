library(tidyverse)

species_2024 <- read.csv('Øvelser_2024/data/species.csv')

spec_groups_2024 <- species_2024 %>%
  filter(rank=="SPECIES")%>%
  group_by(kingdom,class,order)%>%
  count(sort=T)

ggplot(aes(order,n),data=spec_groups_2024[1:5,])+
  geom_col(aes(fill=order))

yndlings <- species_2024%>%
  mutate(verbatimScientificName = tolower(verbatimScientificName))%>%
  group_by(verbatimScientificName) %>%
  count(sort=T)
View(yndlings)
