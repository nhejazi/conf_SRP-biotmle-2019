library(here)
library(biotmle)
library(data.table)
library(tidyverse)
library(latex2exp)
library(patchwork)
library(ggsci)

# load and summarize simulation results
sim_results <- readRDS(here("data",
                            "biotmle_comparison_2018-11-09_07:22:38.rds"))
sims_fixed <- lapply(sim_results, function(x) {
                         fixed_df <- suppressWarnings(apply(x, 2, as.numeric))
                         fixed_df <- as.data.frame(fixed_df)
                         fixed_df[, 4] <- as.character(unlist(x[, 4]))
                         return(fixed_df)
                        })
sim_results_tabulated <- rbindlist(sims_fixed, idcol = "n_samp") %>%
  mutate(
    n_samp = as.numeric(str_remove(n_samp, "n_")),
  ) %>%
  group_by(n_samp, estimator) %>%
  summarise(
    fd_avg_0.10 = mean(padj_0.10),
    fd_avg_0.05 = mean(padj_0.05),
    fd_avg_0.01 = mean(padj_0.01)
  )

# Comparison plot for FWER 0.10
p1 <- sim_results_tabulated %>%
  as.data.table() %>%
  setnames(c("n_samp", "Method", "fd_0.1", "fd_0.05", "fd_0.01")) %>%
  ggplot(aes(x = as.factor(n_samp), y = fd_0.1, colour = Method)) +
  geom_point(aes(colour = Method, shape = Method), size = 5, alpha = 0.75) +
  xlab("Sample size") +
  ylab("Proportion of false discoveries") +
  ggtitle("FWER = 0.10") +
  #ggtitle(paste("Enhanced error rate control with variance moderation",
                #"of nonparametric-efficient estimators",
                #"\n(family-wise error rate = 0.10)")) +
  theme_bw() +
  theme(legend.position = "none")

# Comparison plot for FWER 0.05
p2 <- sim_results_tabulated %>%
  as.data.table() %>%
  setnames(c("n_samp", "Method", "fd_0.1", "fd_0.05", "fd_0.01")) %>%
  ggplot(aes(x = as.factor(n_samp), y = fd_0.05, colour = Method)) +
  geom_point(aes(colour = Method, shape = Method), size = 5, alpha = 0.75) +
  xlab("Sample size") +
  ylab("Proportion of false discoveries") +
  ggtitle("FWER = 0.05") +
  theme_bw() +
  theme(legend.background = element_rect(fill = "gray90", size = .25,
                                         linetype = "dotted"),
        legend.position = "bottom",
        legend.title = element_text(colour = "red", size = 12))

# Comparison plot for FWER 0.01
p3 <- sim_results_tabulated %>%
  as.data.table() %>%
  setnames(c("n_samp", "Method", "fd_0.1", "fd_0.05", "fd_0.01")) %>%
  ggplot(aes(x = as.factor(n_samp), y = fd_0.01, colour = Method)) +
  geom_point(aes(colour = Method, shape = Method), size = 5, alpha = 0.75) +
  xlab("Sample size") +
  ylab("Proportion of false discoveries") +
  ggtitle("FWER = 0.01") +
  theme_bw() +
  theme(legend.position = "none")

pdf(file = here("figs", "sims_error_rates.pdf"))
p1 + p2 + p3
dev.off()

