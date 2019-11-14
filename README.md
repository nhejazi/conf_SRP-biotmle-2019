# Poster: Variance moderation for locally efficient estimators

> Materials for a poster to be given at the 2018 retreat of the Center for
> Computational Biology at UC Berkeley.

**Authors:** [Nima Hejazi](https://nimahejazi.org), [Mark van der
Laan](https://statistics.berkeley.edu/~laan), [Alan
Hubbard](https://hubbard.berkeley.edu)

---

## Summary

Exploratory analysis of high-dimensional biological data has received much
attention since the explosion of high-throughput biotechnology enabled the
simultaneous screening of thousands of molecular characteristics (genomics,
metabolomics, proteomics, microbiomics, metallomics). Such analyses pose
numerous challenges for statisticians and scientists. We focus on (1) how
to derive estimation of independent associations (variable importance
measures) in the context of many competing causes in a semiparametric
statistical model, and (2) the use of robust variance estimators to enable
small-sample inference when data-adaptive techniques are leveraged in such
settings. We present an approach that constructs locally efficient estimators
of causal parameters, rooted in the Targeted Learning framework, in the
construction of nonparametric variable importance measures. The resultant
estimates are equipped with scientifically convenient interpretations, under
the standard assumptions of causal models, and are robust to model
misspecification, since ensemble machine learning may be used in estimating
relevant factors of the data-generating distribution. The estimators we present
have closed-form representations based on influence functions, allowing for
variance moderation to be applied in constructing robust hypothesis tests and
confidence intervals. We illustrate the methodology by applying these approaches
to high-dimensional data sets of relatively modest sample size, combining existing
targeted maximum likelihood learning methods with a simple generalization of empirical
Bayes approaches to improve the stability of estimators in small samples. The result
is a machine learning-based approach that can estimate independent associations of
biomarkers within high-dimensional data, teasing apart the effects of potential
confounds and protecting against the unreliability introduced by small-sample
inference. Time-permitting, we also discuss recently developed software (the
`biotmle` R package: https://bioconductor.org/packages/biotmle) as well as methods
to circumvent the statistical pitfalls of multiple comparisons.

---

## Principal References

* [Mark J. van der Laan & Sherri Rose. _Targeted Learning: Causal Inference for
    Observational and Experimental Data_,
    2011.](http://www.targetedlearningbook.com)

* [Gordon K. Smyth. "Linear models and empirical Bayes methods for assessing
    differential expression in microarray experiments." _Statistical
    Applications in Genetics and Molecular Biology_, 3(1),
    2004.](http://www.statsci.org/smyth/pubs/ebayes.pdf)

---

## License

&copy; 2018 [Nima S. Hejazi](https://nimahejazi.org), [Mark J. van der
Laan](https://statistics.berkeley.edu/~laan), [Alan E.
Hubbard](https://hubbard.berkeley.edu)

