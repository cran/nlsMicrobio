\name{growthcurve}
\alias{growthcurve1}
\alias{growthcurve2}
\alias{growthcurve3}
\alias{growthcurve4}
\docType{data}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Bacterial kinetics data sets }

\description{
Bacterial kinetics data sets
}

\usage{
data(growthcurve1)
data(growthcurve2)
data(growthcurve3)
data(growthcurve4)
}
%- maybe also 'usage' for other objects documented here.

\format{ 
Data frames with 2 columns (t: time, LOG10N: decimal logarithm of bacterial density)
}

\source{ Data obtained by Florent Baty \email{florent.baty@gmail.com} and Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}}

%\references{  }

\examples{
data(growthcurve1)
data(growthcurve2)
data(growthcurve3)
data(growthcurve4)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
plot(growthcurve1)
plot(growthcurve2)
plot(growthcurve3)
plot(growthcurve4)
par(def.par)
}

\keyword{ datasets }% at least one, from doc/KEYWORDS
