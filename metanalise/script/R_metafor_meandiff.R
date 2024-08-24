# META-ANÁLISE DE DIFERENÇA DE MÉDIAS #

# Instalando e habilitando pacotes no R 

install.packages("metafor")
install.packages("readxl")

library(metafor)
library(readxl)

# Localizar diretório 

getwd()

# Importado data frame em Excel, e guardando em um objeto 

dados <- read_excel("data/rladies.xlsx")

# Omitimos o argumento path (1º argumento da função read_excel)
# path = "nome_da_pasta/nome_da_planilha.extensão"
# dados: objeto em que salvamos os dados 

# Vizualização dos dados 

dados
str(dados)

# Calculando tamanho de efeito 

smd_meta = escalc(data = dados,
                  measure = "SMD", 
                  m1i = ctr_mean , 
                  m2i = atd_mean, 
                  sd1i = ctr_sd, 
                  sd2i = atd_sd, 
                  n1i = ctr_n, 
                  n2i = atd_n)

# Vizualização dos dados

smd_meta  

# Modelo de efeito aleatório

smd_rem = rma(yi,vi, method = "REML", data=smd_meta)

# Vizualização dos dados

summary(smd_rem) 

# Agora abra a pasta "fig" 

# Plotando gráfico de floresta

png("fig/forest.png")

forest(smd_rem)
title("Gráfico de floresta - IntroRS")

dev.off()

# Plotando gráfico de funil 

png("fig/funnel.png")

funnel(smd_rem)
title("Gráfico de funil - IntroRS")

dev.off()
