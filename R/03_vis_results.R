library(here)
library(biotmle)
library(tidyverse)
library(SummarizedExperiment)
eif_results <- readRDS(here("data", "eif_results.rds"))
tx <- colData(eif_results)$A

pdf(file = here("figs", "adj_pvals.pdf"))
p1 <- plot(x = eif_results, type = "pvals_adj") +
    theme(legend.position = "none")
p1
dev.off()

pdf(file = here("figs", "raw_pvals.pdf"))
p2 <- plot(x = eif_results, type = "pvals_raw") +
    theme(legend.position = "none")
p2
dev.off()

#mean_param_subj <- colSums(eif_results@tmleOut)
pdf(file = here("figs", "supervised_heatmap.pdf"))
heatmap_ic(x = eif_results,
           clustering.method = "hierarchical",
           left.label = "none",
           #bottom.label = "variable",
           row.dendrogram = TRUE,
           pretty.order.rows = TRUE,
           pretty.order.cols = TRUE,
           #dist.method = "manhattan",
           #linkage.method = "centroid",
           #smooth.heat = TRUE,
           scale = TRUE,
           title.size = 5,
           design = as.numeric(tx == min(tx)),
           FDRcutoff = 0.2,
           top = 25)
dev.off()

