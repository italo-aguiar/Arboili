### INICIANDO ###

# Bibliotecas
install.packages("tidyverse")
install.packages("readxl")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("hrbrthemes")
install.packages("tidyr")
install.packages("geobr")

library(readxl)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(tidyr)
library(geobr)

# Importando dados sobre dengue agregados em nível nacional, estadual e municipal 
dengue_br_21_24 <- read_xlsx("C:\\Users\\Italo\\Meu Drive\\5. TRABALHOS\\Pesquisa Arboili\\1_Estudo 2 - Anexo 2 - Banco modelado - Notificações dengue BR por SE.xlsx") 
dengue_uf_21_23<- read_xlsx("C:\\Users\\Italo\\Meu Drive\\5. TRABALHOS\\Pesquisa Arboili\\1_Estudo 2 - Anexo 4 - Banco modelado - Notificações dengue UF.xlsx") 

is.na(dengue_br_21_24$'2024') <- dengue_br_21_24$'2024' == "-"
dengue_br_21_24$'2024' <- as.numeric(dengue_br_21_24$'2024')

# COnfigurando a notação cientifica
options(scipen=10000)


### GRÁFICO DE BARRAS

dados_longos <- pivot_longer(dengue_br_21_24, cols = -SE_Notificacao, names_to = "ano", values_to = "casos")

ggplot(dados_longos, aes(x = as.factor(SE_Notificacao), y = casos, fill = ano)) +
  geom_bar(position = "dodge", stat = "identity", alpha = 0.7) +
  labs(title = "Casos de dengue por SE, Brasil, 2021-2024",
       x = "Semana Epidemiológica",
       y = "Casos suspeitos de dengue",
       fill = "Ano") +
  scale_fill_manual(values = c('2021' = "black", '2022' = "green", '2023' = "blue", '2024'= "red")) +
  theme_minimal() +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


### MAPA COROPLÉTICO
states <- read_state(
  year = 2019, 
  showProgress = FALSE
)

no_axis <- theme(axis.title=element_blank(),
                 axis.text=element_blank(),
                 axis.ticks=element_blank())

ggplot() +
  geom_sf(data=states, fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) +
  labs(subtitle="States", size=8) +
  theme_minimal() +
  no_axis


UF_dengue <- dplyr::left_join(states, dengue_uf_21_23, by = c("code_state" = "cod_UF"))

max(UF_dengue$'2021')

ggplot() +
  geom_sf(data=UF_dengue, aes(fill=UF_dengue$'2021'), color= NA, size=.15) +
  labs(subtitle="Casos de dengue, Brasil, 2021", size=8) +
    scale_fill_distiller(palette = "Reds", direction=1, name="Casos de dengue", limits = c(1,406269)) +
  theme_minimal() +
  no_axis

#

max(UF_dengue$'2022.x')

ggplot() +
  geom_sf(data=UF_dengue, aes(fill=UF_dengue$'2022'), color= NA, size=.15) +
  labs(subtitle="Casos de dengue, Brasil, 2022", size=8) +
  scale_fill_distiller(palette = "Reds", direction=1, name="Casos de dengue", limits = c(1,406269)) +
  theme_minimal() +
  no_axis

#

max(UF_dengue$'2023.x')

ggplot() +
  geom_sf(data=UF_dengue, aes(fill=UF_dengue$'2023'), color= NA, size=.15) +
  labs(subtitle="Casos de dengue, Brasil, 2023", size=8) +
  scale_fill_distiller(palette = "Reds", direction=1, name="Casos de dengue", limits = c(1,406269)) +
  theme_minimal() +
  no_axis



### REFERÊNCIAS E FONTES ###
# https://readxl.tidyverse.org/
# https://paternogbc.github.io/guia_ggplot2/grafico-de-barras.html
# https://cran.r-project.org/web/packages/geobr/vignettes/intro_to_geobr.html
