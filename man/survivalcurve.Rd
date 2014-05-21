\name{survivalcurve}
\alias{survivalcurve1}
\alias{survivalcurve2}
\alias{survivalcurve3}
\docType{data}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Bacterial survival data sets }


\description{
  Bacterial kinetics data sets
}

\usage{
data(survivalcurve1)
data(survivalcurve2)
data(survivalcurve3)
}
%- maybe also 'usage' for other objects documented here.

\format{
Data frames with 2 columns (t: time, LOG10N: decimal logarithm of bacterial density)
}

\source{ Data obtained by Florent Baty \email{florent.baty@kssg.ch} and Marie-Laure Delignette-Muller \email{ml.delignette@vet-lyon.fr}}

%\references{  }

\examples{
data(survivalcurve1)
data(survivalcurve2)
data(survivalcurve3)
def.par <- par(no.readonly = TRUE)
par(mfrow=c(2,2))
plot(survivalcurve1, type="b")
plot(survivalcurve2, type="b")
plot(survivalcurve3, type="b")
par(def.par)
}

\keyword{ datasets }% at least one, from doc/KEYWORDS
