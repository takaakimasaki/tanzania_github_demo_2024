#set up
install.packages("pacman")
pacman::p_load(dplyr, tidyverse, WDI, ggplot2, ggthemes, here)

#loading WDI data on GDP per capita and save it as csv
WDI::WDIsearch('GDP per capita (constant 2015 US$)*')
dat = WDI::WDI(indicator=c('NY.GDP.PCAP.KD'), start=2000, end=2021)
dat %>%
  filter(country=="Tanzania" & !is.na(NY.GDP.PCAP.KD))%>%
  write_csv(here::here("data","GDPpc_constant_tza.csv"))
