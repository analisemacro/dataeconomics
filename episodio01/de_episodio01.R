### Episódio 1 do projeto Data Economics
### Tema: importação de arquivos.

### Pacotes utilizados

library(readr)
library(openxlsx)
library(sidrar)

### Exemplo 1: arquivos CSV ----

ler_csv <- readr::read_csv("episodio1/daily.csv")

ler_csv_web <- readr::read_csv("https://covidtracking.com/api/v1/us/daily.csv")

readr::write_csv(ler_csv, "episodio1/salvos/nosso_csv.csv")

## Exemplo 2: arquivos XLSX ----

ler_xlsx <- openxlsx::read.xlsx("episodio1/daily.xlsx", detectDate = T)

openxlsx::write.xlsx(ler_xlsx, "episodio1/salvos/nosso_xlsx.xlsx")

## Exemplo 3: dados via API (pacote sidrar) ----

ler_api <- sidrar::get_sidra(api = "/t/7060/n1/all/v/63/p/all/c315/7169/d/v63%202")

## Exemplo 4: dados de arquivos rds

ler_rds <- readRDS("episodio1/tracking/tracking_2020-05-10.rds")

saveRDS(ler_rds, "episodio1/salvos/nosso_rds.rds")

## Bônus: importar todos os arquivos de uma só vez e reuni-los ----

files_names <- list.files("episodio1/tracking/")

empilhar_dados <- purrr::map_df(.x = as.list(files_names), .f = function(x){
  
  file_name_i <- paste0("episodio1/tracking/", x)  
  
  readRDS(file_name_i)

})
