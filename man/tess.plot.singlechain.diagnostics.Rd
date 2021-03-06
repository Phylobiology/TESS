\name{tess.plot.singlechain.diagnostics}
\alias{tess.plot.singlechain.diagnostics}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{tess.plot.mcmc.diagnostics: Plotting the single chain mcmc diagnostics of a episodic diversification rate analysis with mass-extinction events.}
\description{tess.plot.singlechain.diagnostics plots MCMC diagnostics for the output generated by a tess.process.output(...) command. Fore more examples see the vignette.}
\usage{
tess.plot.singlechain.diagnostics(output,
                                      parameters=c("speciation rates",
                                                   "speciation shift times",
                                                   "extinction rates",
                                                   "extinction shift times",
                                                   "net-diversification rates",
                                                   "relative-extinction rates",
                                                   "mass extinction times"),
                                      diagnostics=c("ESS","geweke"),
                                      ess.crit=c(100,200),
                                      geweke.crit=0.05,
                                      correction="bonferroni",
                                      xlab="million years ago",
                                      col=NULL,
                                      xaxt="n",
                                      yaxt="s",
                                      pch=19,
                                      ...)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{output}{The processed output for plotting.}
  \item{parameters}{Which parameters to diagnose. See details for a complete description.}
  \item{diagnostics}{Which diagnostics to use. Options are "ESS" and "geweke".}
  \item{ess.crit}{Two values which correspond to low ESS threshold and acceptable ESS threshold. Default values are 100 and 200.}
  \item{geweke.crit}{The p-value cutoff for Geweke's diagnostic. Default is the canonical 0.05.}
  \item{correction}{What type of multiple-correction method to use. Options are "bonferroni" and "sidak".}
  \item{xlab}{The label of the x-axis. By default, millions of years.}
  \item{col}{Colors used for printing. Must be of same length as fig.types.}
  \item{xaxt}{The type of x-axis to plot. By default, no x-axis is plotted (recommended).}
  \item{yaxt}{The type of y-axis to plot.}
  \item{pch}{The type of points to draw (if points are drawn).}
  \item{...}{Arguments delegated to plot()}
}

\details{

This function generates visual summaries of single-chain MCMC diagnostics for the CoMET analysis in the output object.
The argument parameters specifies the aspects of the model to summarize.
Valid options are:
  \itemize{
    \item{speciation rates: }{Plots the interval-specific speciation rates.}
    \item{speciation shift times: }{Plots the posterior probability of at least one speciation-rate shift for each interval.}
    \item{extinction rates: }{Plots the interval-specific extinction rates.}
    \item{extinction shift times: }{Plots the posterior probability of at least one extinction-rate shift for each interval.}
    \item{net-diversification rates}{Plots the interval-specific net-diversification rates.}
    \item{relative-extinction rates}{Plots the interval-specific relative-extinction rates.}
    \item{mass extinction times: }{Plots the posterior probability of at least one mass-extinction event for each interval.}
  }
}

\author{Michael R. May}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
# Load the data, compute the sampling fraction rho
data(conifers)
totalConiferSpecies <- 630
sampledConiferSpecies <- conifers$Nnode+1
rho <- sampledConiferSpecies / totalConiferSpecies

# Run a tess analysis
tess.analysis(tree = conifers,
              initialSpeciationRate=c(1.0),
              initialExtinctionRate=c(0.5),
              empiricalHyperPriors = FALSE,
              numExpectedRateChanges = 2,
              numExpectedMassExtinctions = 2,
              samplingProbability = rho,
              MAX_ITERATIONS = 200,
              BURNIN = 100)

# Process the output
coniferOutput <- tess.process.output(dir=getwd(),
                                     numExpectedRateChanges=2,
                                     numExpectedMassExtinctions=2)

# Plot the output
tess.plot.singlechain.diagnostics(coniferOutput)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ htest }
%\keyword{ birth-death }% __ONLY ONE__ keyword per line
