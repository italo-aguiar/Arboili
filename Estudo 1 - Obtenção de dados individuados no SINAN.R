### REVISANDO FICHAS E VARIÁVEIS DE ARBOVIROSES EM SISTEMAS DE INFORMAÇÃO ###
#https://portalsinan.saude.gov.br/images/documentos/Agravos/Dengue/Ficha_DENGCHIK_FINAL.pdf
#http://portalsinan.saude.gov.br/images/documentos/Agravos/Dengue/DIC_DADOS_ONLINE.pdf
#https://portalsinan.saude.gov.br/images/documentos/Agravos/NINDIV/Ficha_conclusao_v5.pdf
#https://portalsinan.saude.gov.br/images/documentos/Agravos/NINDIV/DIC_DADOS_NET_Not_Individual_rev.pdf


### INICIANDO ###
install.packages("microdatasus")
library(microdatasus)
?fetch_datasus


### DENGUE ###
# Baixando (dengue)
df_dengue_20_24 <- fetch_datasus(year_start = 2020, year_end = 2023, information_system = "SINAN-DENGUE")

# Processando (dengue)
df_process_dengue_20_24 = process_sinan_dengue(df_dengue_20_24)

# Verificando (dengue)
colnames(df_process_dengue_20_24)

# Salvando (dengue)
data.table::fwrite(df_process_dengue_20_24, "df_dengue_20_24.csv", 
                   row.names = FALSE)

### ZIKA ###
# Baixando (zika)
df_zika_20_24 <- fetch_datasus(year_start = 2020, year_end = 2023, uf = "all", information_system = "SINAN-ZIKA")

# Processando (zika)
df_process_zika_20_24 = process_sinan_zika(df_zika_18_24)

# Verificando (zika)
colnames(df_process_zika_20_24)

# Salvando (zika)
data.table::fwrite(df_process_zika_20_24, "df_zika_20_24.csv", 
                   row.names = FALSE)


### CHIKUNGUNYA ###
# Baixando (chikungunya)
df_chikungunya_20_24 <- fetch_datasus(year_start = 2020, year_end = 2023, uf = "all", information_system = "SINAN-CHIKUNGUNYA")

# Processando (chikungunya)
df_process_chikungunya_20_24 = process_sinan_chikungunya(df_chikungunya_18_24)

# Verificando (chikungunya)
colnames(df_process_chikungunya_20_24)

# Salvando (chikungunya)
data.table::fwrite(df_process_dengue_20_24, "df_dengue_20_24.csv", 
                   row.names = FALSE)


### REFERÊNCIAS E FONTES ###
# https://rpubs.com/romulofreits/guiamicrodatasus
# https://github.com/rfsaldanha/microdatasus
# https://www.scielo.br/j/csp/a/gdJXqcrW5PPDHX8rwPDYL7F/abstract/?lang=pt