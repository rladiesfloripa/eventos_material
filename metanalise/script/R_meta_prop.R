# META-ANÁLISE DE PROPORÇÃO #

# Introdução ao R #

1 + 1
x <- 1 + 1 

print(x)
x

# Instalando pacotes no R 

install.packages("meta")
install.packages("readxl")

# Carregando pacotes

library(readxl)
library(meta)

getwd()

## Proporção ##

# Importar/ler os dados já tabulados

dados <- read_excel("data/rladiesprop.xlsx")

# Olhar os dados

dados

# Checar a classe do objetvo

class(dados)

# Para entender uma função e seus argumentos clique em cima da função e aperte F1
# ou use help() com o nome da função dentro, ex:

help(forest)

## Plotar gráfico em floresta ##

# Para o subgrupo Fêmea:

forest(
# primeiro argumento/parâmetro é um objeto da classe meta
    metaprop(
    eventos,
    n,
    autor,
    method = "Inverse",
    sm = "PLOGIT",
    fixed = F,
    random = T,
    level.predict = 0.95,
# o seguinte argumento escolhe o subgrupo
    dados$subgroup == "Female",
    data = dados
  ),
# escolher limites do eixo x
  xlim = c(-0.35, 1.2)
)

# Sem especificar subgrupo:

forest(
  metaprop(
    eventos,
    n,
    autor,
    method = "Inverse",
    sm = "PLOGIT",
    fixed = T,
    random = T,
    prediction = T,
    level.predict = 0.95,
    subgroup = dados$subgroup,
    data = dados
  ),
  xlim = c(-1, 1)
)

