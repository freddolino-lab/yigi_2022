# Title: Bayesian analysis of YigI growth assay data
# Date: 2021-10-12
# Author(s): Theresa Proctor, Peter Freddolino
# Description: Bayesian model code for Schmidt, Proctor, and Freddolino (submitted)

# Load brms package
library(brms)

# Load growth data
yigI_AUC_data <- read.csv("yigi_AUC_data.csv", header = TRUE)

# Fitting a Bayesian multilevel mixed effects model with the brms package
#   logAUC (metric predicted variable): log2-transformed Area Under the
#                                       Curve (AUC) data
#   media (nominal predictor variable): media condition (8 levels)
#   strain (nominal predictor variable): strain genotype (8 levels)
#   replicate (nominal predictor variable): experimental replicate (3 levels)

fit <- brm(logAUC ~ 0 + media + strain:media + (1|media:replicate),
           data = yigI_AUC_data,
           family = student(),
           prior = c(set_prior("normal(0,3)",  
                               class = "b")))
