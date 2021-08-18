library(gifski)
library(ggplot2)
library(gganimate)
library(pals)
library(tidyverse)
library(devtools)
library(datacovidbr)


df <- brasilio()

df.cidades <- df%>%filter(df$state =="PR")
df.cidades.analisadas <- df.cidades %>% filter(df.cidades$city =="Curitiba" |
                                                 df.cidades$city == "Londrina" |
                                                 df.cidades$city == "Cascavel")
df.cidades.analisadas["deaths_per_100k_inhabitants"] <- (df.cidades.analisadas$deaths/df.cidades.analisadas$estimated_population_2019)*100000

# Confirmados Geral gif

gif_confirmed <- ggplot(df.cidades.analisadas, aes(df.cidades.analisadas$date, df.cidades.analisadas$confirmed, group = city, color=city)) +
  geom_line() +
  geom_segment(aes(xend = df.cidades.analisadas$date ,yend = df.cidades.analisadas$confirmed), linetype =5) +
  geom_point(size = 2) + 
  geom_text(aes(x = df.cidades.analisadas$date, label = df.cidades.analisadas$city), hjust = 0) + 
  transition_reveal(df.cidades.analisadas$date) + 
  coord_cartesian(clip = 'off') + 
  labs(title = 'Número de confirmados com COVID-19', y = 'Confirmados', x='mês') +
  theme(legend.position = "none")+
  #scale_x_continuous("Mês", breaks=seq(0,30,2))+
  theme(plot.margin = margin(-1,-1,-1,-1))

gif_confirmed


# Confirmados Geral gif - 100k

gif_100k <- ggplot(df.cidades.analisadas, aes(df.cidades.analisadas$date, df.cidades.analisadas$confirmed_per_100k_inhabitants, group = city, color=city)) +
  geom_line() +
  geom_segment(aes(xend = df.cidades.analisadas$date ,yend = df.cidades.analisadas$confirmed_per_100k_inhabitants), linetype =5) +
  geom_point(size = 2) + 
  geom_text(aes(x = df.cidades.analisadas$date, label = df.cidades.analisadas$city), hjust = 0) + 
  transition_reveal(df.cidades.analisadas$date) + 
  coord_cartesian(clip = 'off') + 
  labs(title = 'Número de confirmados por 100 mil habitantes com COVID-19', y = 'Confirmados por 100 mil', x='mês') +
  theme(legend.position = "none")+
  #scale_x_continuous("Mês", breaks=seq(0,30,2))+
  theme(plot.margin = margin(-1,-1,-1,-1))

gif_100k


# Óbitos Geral gif

gif_death <- ggplot(df.cidades.analisadas, aes(df.cidades.analisadas$date, df.cidades.analisadas$deaths, group = city, color=city)) +
  geom_line() +
  geom_segment(aes(xend = df.cidades.analisadas$date ,yend = df.cidades.analisadas$deaths), linetype =5) +
  geom_point(size = 2) + 
  geom_text(aes(x = df.cidades.analisadas$date, label = df.cidades.analisadas$city), hjust = 0) + 
  transition_reveal(df.cidades.analisadas$date) + 
  coord_cartesian(clip = 'off') + 
  labs(title = 'Número de óbitos com COVID-19', y = 'Óbitos', x='mês') +
  theme(legend.position = "none")+
  #scale_x_continuous("Mês", breaks=seq(0,30,2))+
  theme(plot.margin = margin(-1,-1,-1,-1))

gif_death


# # Óbitos Geral gif - 100k

gif_death_100k <- ggplot(df.cidades.analisadas, aes(df.cidades.analisadas$date, df.cidades.analisadas$deaths_per_100k_inhabitants, group = city, color=city)) +
  geom_line() +
  geom_segment(aes(xend = df.cidades.analisadas$date ,yend = df.cidades.analisadas$deaths_per_100k_inhabitants), linetype =5) +
  geom_point(size = 2) + 
  geom_text(aes(x = df.cidades.analisadas$date, label = df.cidades.analisadas$city), hjust = 0) + 
  transition_reveal(df.cidades.analisadas$date) + 
  coord_cartesian(clip = 'off') + 
  labs(title = 'Número de óbitos por 100 mil habitantes com COVID-19', y = 'Óbitos por 100 mil', x='mês') +
  theme(legend.position = "none")+
  #scale_x_continuous("Mês", breaks=seq(0,30,2))+
  theme(plot.margin = margin(-1,-1,-1,-1))

gif_death_100k


