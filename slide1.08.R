# Hent pakker
library(readxl)
library(tidyverse)
library(ggplot2)

# Importer data
arter_raw <- read_xlsx("data/arter_uge42_43.xlsx", sheet=2)
# arter_raw <- read_xlsx("data/arter_uge43.xlsx", sheet=2)


# Udregn akkumulerede værdier
arter <- arter_raw %>%                                 # Gem importeret data
  group_by(Observationsdato,Artsgruppe)%>%             # Lav grupper
  summarise(antal = n())%>%                            # Tæl antal i gruppe
  group_by(Artsgruppe)%>%                              # Lav Gruppe
  mutate(acc. = cumsum(antal))%>%                      # Lav ny kolonne akk. sum
  ungroup()

# Plot antal observationer
ggplot(aes(x=Observationsdato, y=acc., group = Artsgruppe ),data=arter)+ 
  geom_line(aes(col=Artsgruppe), lwd=2)+               # Plot linje
  ylab("Antal observationer") + xlab("Dato")+          # Navngiv akser
  ggtitle(paste("Observationer over tid"))+            # Sæt titel
  theme_classic()+                                     # Angiv tema
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=1))
  
