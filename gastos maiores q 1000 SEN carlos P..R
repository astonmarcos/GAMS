##importando a biblioteca
library(dplyr)
##listando objetos
ls()
##chamando os objetos
print(despesas_ceaps_2021)
#ajustando o data set com filtros
DF_filtrado <- despesas_ceaps_2021[despesas_ceaps_2021$NOME_SENADOR == "CARLOS PORTINHO", ]
DF_filtrado <- DF_filtrado[DF_filtrado$VALOR_REEMBOLSADO > 1000, ]
##somando os valores
soma_valores <- sum(DF_filtrado$VALOR_REEMBOLSADO)
#exibindo o DF filtrado
print(DF_filtrado)
# expondo a soma dos valores dos gastos>1000
print(soma_valores)
