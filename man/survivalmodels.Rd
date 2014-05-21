\name{survivalmodels}
\alias{survivalmodels}
\alias{geeraerd}
\alias{geeraerd_without_Nres}
\alias{geeraerd_without_Sl}
\alias{mafart}
\alias{albert}
\alias{trilinear}
\alias{bilinear_without_Nres}
\alias{bilinear_without_Sl}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Bacterial survival models }

\description{
  Formulas of primary survival models commonly used in predictive microbiology
}

\usage{
geeraerd
geeraerd_without_Nres
geeraerd_without_Sl
mafart
albert
trilinear
bilinear_without_Nres
bilinear_without_Sl
}
%- maybe also 'usage' for other objects documented here.
%\arguments{}

\details{

These models describe the evolution of the decimal logarithm of the microbial count (LOG10N) as a function of the time (t).

\code{geeraerd} is the model of Geeraerd et al. (2005) with four parameters (LOG10N0, kmax, Sl, LOG10Nres)\cr\cr
\code{geeraerd_without_Nres} is the model of of Geeraerd et al. (2005) with three parameters (LOG10N0, kmax, Sl), without tail\cr\cr
\code{geeraerd_without_Sl} is the model of of Geeraerd et al. (2005) with three parameters (LOG10N0, kmax, Nres), without shoulder\cr\cr
\code{mafart} is the Weibull model as parameterized by Mafart et al. (2002) with three parameters (p, delta, LOG10N0)\cr\cr
\code{albert} is the modified Weibull model proposed by Albert and Mafart (2005) with four parameters (p, delta, LOG10N0, LOG10Nres)\cr\cr
\code{trilinear} is the three-phase linear model with four parameters (LOG10N0, kmax, Sl, LOG10Nres)\cr\cr
\code{bilinear_without_Nres} is the two-phase linear model with three parameters (LOG10N0, kmax, Sl), without tail\cr\cr
\code{bilinear_without_Sl} is the two-phase linear model with three parameters (LOG10N0, kmax, LOG10Nres), without shoulder
	
}

\value{ 
	A formula 
}

\references{ 
Albert I, Mafart P (2005) A modified Weibull model for bacterial inactivation. \emph{International Journal of Food Microbiology}, \bold{100}, 197-211.\cr\cr
Geeraerd AH, Valdramidis VP, Van Impe JF (2005) GInaFiT, a freeware tool to assess non-log-linear microbial survivor curves. \emph{International Journal of Food Microbiology}, \bold{102}, 95-105.\cr\cr
Mafart P, Couvert O, Gaillard S, Leguerinel I (2002) On calculating sterility in thermal preservation methods : application of the Weibull frequency distribution model. \emph{International Journal of Food Microbiology}, \bold{72}, 107-113.
}

\author{ 
Florent Baty \email{florent.baty@gmail.com}\cr
Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}
}

%\note{  }

\examples{

# Example 1

data(survivalcurve1)
nls1a <- nls(geeraerd, survivalcurve1,
	list(Sl = 5, kmax = 1.5, LOG10N0 = 7, LOG10Nres = 1))
nls1b <- nls(trilinear, survivalcurve1,
	list(Sl = 5, kmax = 1.5, LOG10N0 = 7, LOG10Nres = 1))
nls1c <- nls(albert,survivalcurve1,
	list(p = 1.2, delta = 4, LOG10N0 = 7, LOG10Nres = 1))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
overview(nls1a)
plotfit(nls1a, smooth = TRUE)
overview(nls1b)
plotfit(nls1b, smooth = TRUE)
overview(nls1c)
plotfit(nls1c, smooth = TRUE)
par(def.par)

# Example 2

data(survivalcurve2)
nls2a <- nls(geeraerd_without_Nres, survivalcurve2,
	list(Sl = 10, kmax = 1.5, LOG10N0 = 7.5))
nls2b <- nls(bilinear_without_Nres, survivalcurve2, 
	list(Sl = 10, kmax = 1.5, LOG10N0 = 7.5))
nls2c <- nls(mafart, survivalcurve2,
	list(p = 1.5, delta = 8, LOG10N0 = 7.5))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
overview(nls2a)
plotfit(nls2a, smooth = TRUE)
overview(nls2b)
plotfit(nls2b, smooth = TRUE)
overview(nls2c)
plotfit(nls2c, smooth = TRUE)
par(def.par)

# Example 3

data(survivalcurve3)
nls3a <- nls(geeraerd_without_Sl, survivalcurve3,
	list(kmax = 4, LOG10N0 = 7.5, LOG10Nres = 1))
nls3b <- nls(bilinear_without_Sl, survivalcurve3,
	list(kmax = 4, LOG10N0 = 7.5, LOG10Nres = 1))
nls3c <- nls(mafart, survivalcurve3,
	list(p = 0.5, delta = 0.2, LOG10N0 = 7.5))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
overview(nls3a)
plotfit(nls3a, smooth = TRUE)
overview(nls3b)
plotfit(nls3b, smooth = TRUE)
overview(nls3c)
plotfit(nls3c, smooth = TRUE)
par(def.par)


}

\keyword{ models }% at least one, from doc/KEYWORDS
