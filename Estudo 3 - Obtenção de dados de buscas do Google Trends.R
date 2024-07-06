### INICIANDO ###
if (!require("gtrendsR")){
  install.packages("gtrendsR")
  library(gtrendsR)
}

?gtrends

### IMPORTANDO GOOGLE TRENDS ###

serie01 <- gtrends(keyword ="dengue",
                   geo = "BR",
                   time =  "2023-01-01 2023-12-31")
head(serie01$interest_over_time)


serie02 <- gtrends(keyword ="febre",
                   geo = "BR",
                   time =  "2023-01-01 2023-12-31")
head(serie02$interest_over_time)


serie03 <- gtrends(keyword ="mosquito",
                   geo = "BR",
                   time =  "2023-01-01 2023-12-31")
head(serie03$interest_over_time)



### DESCREVENDO SÉRIE TEMPORAL DAS BUSCAS ###

plot(serie01)
plot(serie02)
plot(serie03)

plot(main="Buscas no Google", ts.union(ts(serie01$interest_over_time$hits),
              ts(serie02$interest_over_time$hits),
              ts(serie03$interest_over_time$hits)),
     plot.type = "single",col = c(1,2,3), ylab="", xlab="Semanas, 2023")
legend("bottomright", legend = c("dengue","febre","mosquito"),col = c(1,2,3), bty = 'n',lty = c(1,1))


### REFERÊNCIAS E FONTES ###

# https://rpubs.com/fjp/googletrends
# https://doi.org/10.1016/j.simpa.2024.100634
