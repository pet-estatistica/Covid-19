setwd('code/')

library(tidyverse)

geral <- read.csv2('../data/informe_epidemiologico_11_03_2021_geral.csv',
                   sep = ';', dec = '.')

geral_curitiba <- geral %>% 
  filter(MUN_ATENDIMENTO == 'CURITIBA')

geral_curitiba <- geral_curitiba %>% 
  mutate(across(everything(), .fns = ~replace(., . == "", NA)),
         across(starts_with('DATA'), .fns = ~as.Date(., format = '%d/%m/%Y')),
         OBITO = str_to_upper(OBITO))
