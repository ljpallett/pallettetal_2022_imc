library(ggplot2)
library(tidyverse)
library(dplyr)
rm(list = ls())
 
setwd("C:/Users/myUserName/myFilePath")
 
abfrage01 <- read.table(file = "myCSVName.csv", row.names = NULL, sep=',', header=TRUE)
 
# determine min and max
min <- ''
min <- min(abfrage01$Value)
 
max <- ''
max <- max(abfrage01$Value)
 
#substract background
abfrage01$Value <- abfrage01$Value - min
 
# set in relation to max
abfrage01$LiverZonationIndex <- abfrage01$Value / max
 
 
library(viridis)
ggplot(abfrage01, aes(X, Y, fill=LiverZonationIndex)) +
  geom_raster() +
  coord_fixed(expand = FALSE) +
  scale_y_reverse() +
  scale_fill_viridis_c(option = "inferno", limits=c(0,1))
 
 
abfrage01 <- abfrage01 %>%
  mutate(LiverZone = case_when(LiverZonationIndex >= 0.5 ~ 3
                               ,LiverZonationIndex >= 0.25 ~ 2
                               ,TRUE ~ 1
  )
  )
 
 
keep <- c("X", "Y", "LiverZonationIndex", "LiverZone")
abfrage01 <- abfrage01[keep]
 
write.csv(abfrage01,paste("C:\\Users\\myUserName\\myFilePath\\123_Output.csv", sep = ""), row.names = FALSE)
