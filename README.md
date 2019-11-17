# Poster: Semiparametric variance moderation in high-dimensional biology

> Materials for a poster to be given at the 2019 Superfund Research Program
> conference in Seattle, WA

**Authors:** [Nima Hejazi](https://nimahejazi.org), [Mark van der
Laan](https://statistics.berkeley.edu/~laan), [Martyn
Smith](https://publichealth.berkeley.edu/people/martyn-smith/), [Alan
Hubbard](https://hubbard.berkeley.edu)

---

## Summary

Exploratory analysis of high-dimensional biological data has received much
attention since the explosion of high-throughput biotechnology enabled the
simultaneous screening of thousands of molecular characteristics (genomics,
metabolomics, proteomics, microbiomics, metallomics). Unfortunately, such
analyses pose numerous challenges for both statisticians and scientists in (1)
deriving estimation of independent associations (variable importance measures)
in the context of many competing causes in flexible and honest statistical
models, and (2) the use of robust empirical Bayes variance estimators (e.g.,
LIMMA) to enable stable small-sample inference when modern machine learning is
leveraged in such settings. We present an approach that constructs locally
efficient estimators of nonparametric variable importance measures based on
causal effect parameters. The resultant estimates are endowed with
scientifically convenient interpretations, under the standard assumptions of
causal inference, and are robust to model misspecification by incorporating
ensemble machine learning in the estimation of relevant factors of the data-
generating distribution. The estimators we present have closed-form
representations, allowing for variance moderation to be applied in deriving
robust hypothesis tests and confidence intervals. We illustrate the methodology
by applying these approaches to high-dimensional data sets of relatively modest
sample size from microarray studies of exposure to environmental contaminants,
combining existing targeted maximum likelihood learning methodology with
a simple generalization of empirical Bayes approaches that improve the stability
of estimators in small samples. The result is a machine learning-based approach
that can estimate independent associations of biomarkers within high-dimensional
data, teasing apart the effects of potential confounds and protecting against
the unreliability introduced by small-sample inference. We also discuss
a recently developed software library (the biotmle R package:
https://bioconductor.org/packages/biotmle) as well as methods to circumvent the
statistical pitfalls of multiple comparisons.

---

## License

&copy; 2019 [Nima S. Hejazi](https://nimahejazi.org)
