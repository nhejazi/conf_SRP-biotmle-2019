# clean up the data structure for use in downstream analysis
library(here)
library(tidyverse)
library(SummarizedExperiment)
library(preprocessCore)
"%ni%" = Negate("%in%")
load(here("data", "illumina2007.rda"))

data <- illumina2007 %>%
  dplyr::select(which(colnames(.) %ni% c("box", "riboaveugml", "ng", "exclude",
                                         "hyb", "totalrnaug", "chip", "Chip.Id",
                                         "Chip.Section", "label.c", "benzene",
                                         "illumID", "berkeley_vial_label",
                                         "cRNA"))) %>%
  dplyr::filter(!duplicated(.$id)) %>%
  dplyr::mutate(
    benzene = I(newbenz),
    smoking = I(current_smoking)
  ) %>%
  dplyr::select(which(colnames(.) %ni% c("newbenz", "current_smoking")))
subj_id <- data$id


# create O = (W, A, Y) structure from cleaned up data

# W - age, sex, smoking
W <- data %>%
  dplyr::select(which(colnames(.) %in% c("age", "sex", "smoking"))) %>%
  dplyr::mutate(
    age = as.numeric((age > quantile(age, 0.25))),
    sex = I(sex),
    smoking = I(smoking)
  )

# A - benzene exposure (discretized)
A <- data %>%
  dplyr::select(which(colnames(.) %in% c("benzene"))) %>%
  unlist() %>%
  as.numeric()

# Y - genes
Y <- data %>%
  dplyr::select(which(colnames(.) %ni% c("age", "sex", "smoking", "benzene",
                                         "id")))
gene_id <- colnames(Y)

# create SE object for biotmle
pData <- DataFrame(cbind(A, W))
eData <- normalize.quantiles.robust(t(Y))
se <- SummarizedExperiment(assays = list(expGenes = eData),
                           colData = pData)

