library(datacovidbr)
library(dplyr)
library(ggplot2)
library(plotly)

df <- brasilio()

df.cidades <- df%>%filter(df$state =="PR")
df.cidades.analisadas <- df.cidades %>% filter(df.cidades$city =="Curitiba" |
                                             df.cidades$city == "Londrina" |
                                             df.cidades$city == "Cascavel")
df.cidades.analisadas["deaths_per_100k_inhabitants"] <- (df.cidades.analisadas$deaths/df.cidades.analisadas$estimated_population_2019)*100000

#ÓBITOS GERAL

graph.obitos <- df.cidades.analisadas %>% 
  ggplot(mapping = aes(fill = city,x = date, y = deaths, color = city,
                       text = paste0(city, "\n",
                                     date, "\n", 
                                     "Óbitos: ", deaths))) +
  xlab("Dias/Meses") +
  ylab("Óbitos") +
  geom_point(aes(y = deaths), size = 0.4)
ggplotly(graph.obitos, tooltip = "text")

# ÓBITOS POR 100 MIL
graph.obitos.p.100k <- df.cidades.analisadas %>% 
  ggplot(mapping = aes(fill = city,x = date, y = deaths_per_100k_inhabitants, color = city,
                       text = paste0(city, "\n",
                                     date, "\n", 
                                     "Óbitos p/ 100k habitantes: ", deaths_per_100k_inhabitants))) +
  xlab("Dias/Meses") +
  ylab("Óbitos por 100 mil habitantes") +
  geom_point(aes(y = deaths_per_100k_inhabitants), size = 0.4)
ggplotly(graph.obitos.p.100k, tooltip = "text")


# GRAFICO CONFIRMADOS
graph.confirmados <- df.cidades.analisadas %>% 
  ggplot(mapping = aes(fill = city,x = date, y = confirmed, color = city,
                       text = paste0(city, "\n",
                                     date, "\n", 
                                     "Confirmados: ", confirmed))) +
  xlab("Dias/Meses") +
  ylab("Confirmados") +
  geom_point(aes(y = confirmed), size = 0.4)
ggplotly(graph.confirmados, tooltip = "text")


#CONFIRMADOS POR 100 MIL
graph.confirmados.p.100k <- df.cidades.analisadas %>% 
  ggplot(mapping = aes(fill = city,x = date, y = confirmed_per_100k_inhabitants, color = city,
                       text = paste0(city, "\n",
                                     date, "\n", 
                                     "Confirmados p/ 100k habitantes: ", confirmed_per_100k_inhabitants))) +
  xlab("Dias/Meses") +
  ylab("Confirmados") +
  geom_point(aes(y = confirmed_per_100k_inhabitants), size = 0.4)
ggplotly(graph.confirmados.p.100k, tooltip = "text")
