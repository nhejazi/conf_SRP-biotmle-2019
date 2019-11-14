library(biotmle)

g_lib = c("SL.mean", "SL.speedglm", "SL.earth", "SL.polymars", "SL.rpart")
Q_lib = c("SL.mean", "SL.speedglm", "SL.earth", "SL.ranger", "SL.xgboost")

biotmle_results <- biomarkertmle(se = se, varInt = 1,
                                 family = "gaussian",
                                 g_lib = g_lib, Q_lib = Q_lib,
                                 parallel = TRUE
                                )
eif_test <- modtest_ic(biotmle = biotmle_results)
saveRDS(eif_test, file = here("data", "eif_results.rds"))

