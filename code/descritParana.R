library(datacovidbr)
library(dplyr)
library(ggplot2)
library(plotly)
library(gridExtra)

dados <- brasilio()

dados.cidades <- dados%>%filter(dados$state =="PR")
dados.pr <- dados.cidades%>%filter(dados.cidades$place_type =="state")

graph_conf <- dados.pr %>%
  ggplot(aes(x=date)) +
  xlab("Dias/Meses") +
  ylab("Confirmados") +
  geom_area( aes(y = confirmed), fill  = "#35b779", alpha = 0.4) +
  geom_line( aes(y = confirmed), color = "#35b779", size = 0.4) +
  geom_point(aes(y = confirmed), color = "#35b779", size = 1.3)

graph_deaths <- dados.pr %>%
  ggplot(aes(x=date)) +
  xlab("Dias/Meses") +
  ylab("Mortes") +
  geom_area( aes(y = deaths), fill  = "#f25a5a", alpha = 0.4) +
  geom_line( aes(y = deaths), color = "#f25a5a", size = 0.4) +
  geom_point(aes(y = deaths), color = "#f25a5a", size = 1.3)

grid.arrange(graph_conf, graph_deaths, nrow= 1, ncol= 2 )

