\name{ross}
\alias{ross}
\docType{data}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Secondary growth curves }

\description{
A data frames describing the specific growth rate of \emph{Escherichia coli} as a function of various environmental factors
}

\usage{
data(ross)}
%- maybe also 'usage' for other objects documented here.

\format{ 
A data frame with five columns (author: the author of the paper from which the data was extracted, T: the temperature in Celsius, aw: the water activity, pH: the pH value, sqrtmumax: the square root of the maximum specific growth rate)
}

\source{
Ross T, Ratkowsky DA, Mellefont LA, McMeekin TA (2003) Modelling the effects of temperature, water activity, pH and lactic acid concentration on the growth rate of Escherichia coli. \emph{International of Food Microbiology}, \bold{82}, 33-43.
}

%\references{ }

\examples{
data(ross)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
plot(ross[c("T", "sqrtmumax")])
plot(ross[c("pH", "sqrtmumax")])
plot(ross[c("aw", "sqrtmumax")])
par(def.par)
}

\keyword{ datasets }% at least one, from doc/KEYWORDS
