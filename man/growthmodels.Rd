\name{growthmodels}
\alias{growthmodels}
\alias{baranyi}
\alias{baranyi_without_Nmax}
\alias{baranyi_without_lag}
\alias{buchanan}
\alias{buchanan_without_Nmax}
\alias{buchanan_without_lag}
\alias{gompertzm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Bacterial growth models }
\description{
  Formulas of primary growth models commonly used in predictive microbiology
  }
\usage{
baranyi
baranyi_without_Nmax
baranyi_without_lag
buchanan
buchanan_without_Nmax
buchanan_without_lag
gompertzm
}

%- maybe also 'usage' for other objects documented here.

%\arguments{ }

\details{

	These models describe the evolution of the decimal logarithm of the microbial count (LOG10N) as a function
	of the time (t).
	
	\code{baranyi} is the model of Baranyi and Roberts (1994) with four parameters (LOG10N0, mumax, lag, LOG10Nmax)\cr\cr
	\code{baranyi_without_Nmax} is the model of Baranyi and Roberts (1994) with three parameters (LOG10N0, mumax, lag), without braking\cr\cr
	\code{baranyi_without_lag} is the model of Baranyi and Roberts (1994) with three parameters (LOG10N0, mumax, LOG10Nmax), without lag\cr\cr
	\code{buchanan} is the three-phase linear model proposed by Buchanan et al. (1997)\cr\cr
	\code{buchanan_without_Nmax} is the two-phase linear model with three parameters (LOG10N0, mumax, lag), without braking\cr\cr
	\code{buchanan_without_lag} is the two-phase linear model with three parameters (LOG10N0, mumax, LOG10Nmax), without lag\cr\cr
	\code{gompertzm} is the modified Gompertz model introduced by Gibson et al. (1988) and reparameterized by Zwietering et al. (1990)\cr\cr
}

\value{ 
	A formula 
}

\references{ 
Baranyi J and Roberts, TA (1994) A dynamic approach to predicting bacterial growth in food, \emph{International Journal of Food Microbiology}, \bold{23}, 277-294.\cr\cr
Buchanan RL, Whiting RC, Damert WC (1997) When is simple good enough: a comparison of the Gompertz, Baranyi, and three-phase linear models for fitting bacterial growth curves. \emph{Food Microbiology}, \bold{14}, 313-326.\cr\cr
Gibson AM, Bratchell N, Roberts TA (1988) Predicting microbial growth: growth responses of salmonellae in a laboratory medium as affected by pH, sodium chloride and storage temperature. \emph{International Journal of Food Microbiology}, \bold{6}, 155-178.\cr\cr
Zwietering MH, Jongenburger I, Rombouts FM, Van't Riet K (1990) Modeling of the bacterial growth curve. \emph{Applied and Environmental Microbiology}, \bold{56}, 1875-1881.
}

\author{ 
Florent Baty \email{florent.baty@gmail.com}\cr
Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}
}

%\note{  }

\examples{

# Example 1

data(growthcurve1)
nls1 <- nls(baranyi, growthcurve1,
	list(lag=4, mumax=1, LOG10N0 = 4, LOG10Nmax = 9))
nls2 <- nls(gompertzm,growthcurve1,
	list(lag = 4, mumax = 1, LOG10N0 = 4, LOG10Nmax = 9))
nls3 <- nls(buchanan, growthcurve1,
	list(lag = 4, mumax = 1, LOG10N0 = 4, LOG10Nmax = 9))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
plotfit(nls1, smooth = TRUE)
plotfit(nls2, smooth = TRUE)
plotfit(nls3, smooth = TRUE)
par(def.par)

# Example 2

data(growthcurve2)
nls4 <- nls(baranyi_without_Nmax, growthcurve2,
	list(lag = 2, mumax = 0.4, LOG10N0 = 7.4))
nls5 <- nls(buchanan_without_Nmax,growthcurve2,
	list(lag = 2, mumax = 0.4, LOG10N0 = 7.4))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,1))
plotfit(nls4, smooth = TRUE)
plotfit(nls5, smooth = TRUE)
par(def.par)

# Example 3

data(growthcurve3)
nls6 <- nls(baranyi_without_lag, growthcurve3,
	list(mumax = 1, LOG10N0 = 0, LOG10Nmax = 5))
nls7 <- nls(buchanan_without_lag, growthcurve3,
	list(mumax = 1, LOG10N0 = 0, LOG10Nmax = 5))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,1))
plotfit(nls6, smooth = TRUE)
plotfit(nls7, smooth = TRUE)
par(def.par)
 }

\keyword{ models }% at least one, from doc/KEYWORDS
