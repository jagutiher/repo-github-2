library(tidyverse)

isciii <- read_csv("https://cnecovid.isciii.es/covid19/resources/casos_hosp_uci_def_sexo_edad_provres.csv",
                   na = "NC")

isciii_m <- 
  isciii |> 
  drop_na( sexo) |> 
  filter( provincia_iso == "M",
          fecha <= ymd("2020-12-31")) |> 
  select( fecha, sexo, grupo_edad, num_casos) |> 
  summarise( num_casos = sum(num_casos), 
             .by = c(fecha, sexo))

write_csv( isciii_m, "./datos_madrid.csv")

iscii_bcn <- 
  isciii |> 
  drop_na( sexo) |> 
  filter( provincia_iso == "B",
          fecha <= ymd("2020-12-31")) |> 
  select( fecha, sexo, grupo_edad, num_casos) |> 
  summarise( num_casos = sum(num_casos), 
             .by = c(fecha, sexo))

write_csv( iscii_bcn, "./datos_barcelona.csv")
