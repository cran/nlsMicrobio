\name{competitioncurve}
\alias{competitioncurve}
\alias{competition1}
\alias{competition2}
\docType{data}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Growth kinetics of two competitive bacterial flora }

\description{
Kinetics of simultaneous growth of Escherichia coli O157:H7 and ground beef background microflora 
in enrichment broth
}

\usage{
data(competition1)
data(competition2)
}
%- maybe also 'usage' for other objects documented here.

\format{ 
Data frames with 3 columns (t: time, flora : 1 for the first flora and 2 for the second one, 
LOG10N: decimal logarithm of bacterial density)
}

\source{ Two of the kinetics used in Vimont et al. (2006) }

\references{ 
Vimont A, Vernozy-Rozand C, Montet MP, Lazizzera C, Bavai C and Delignette-Muller ML (2006) Modeling and predicting the simultaneous growth of Escherichia coli O157:H7 and ground beef background microflora in various enrichment protocols. 
\emph{Applied and Environmental Microbiology} \bold{72}, 261-268.
 }

\examples{
data(competition1)
data(competition2)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(1,2))
twocolors <- c("red","blue")
plot(competition1$t,competition1$LOG10N,col=twocolors[competition1$flora])
plot(competition2$t,competition2$LOG10N,col=twocolors[competition2$flora])
par(def.par)
}

\keyword{ datasets }% at least one, from doc/KEYWORDS
