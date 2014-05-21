\name{secondary}
\alias{secondary}
\alias{cpm_T}
\alias{cpm_pH_4p}
\alias{cpm_pH_3p}
\alias{cpm_aw_3p}
\alias{cpm_aw_2p}
\alias{cpm_T_pH_aw}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Secondary growth models }

\description{
  Formulas of secondary growth models commonly used in predictive microbiology
}

\usage{
cpm_T
cpm_pH_4p
cpm_pH_3p
cpm_aw_3p
cpm_aw_2p
cpm_T_pH_aw
}

%- maybe also 'usage' for other objects documented here.

%\arguments{}

\details{

	All the models describe the evolution of the square root of the maximum specific growth rate (sqrtmumax) as a function 
	of one or more environmental factors among temperature (T), pH (pH) and water activity (aw).
	Each model must be fitted to a data frame including at least two columns, the last one named "sqrtmumax" 
	and the first ones named "T", "pH" or "aw" according to the model.

	\code{cpm_T} is the cardinal temperature model with inflection (Rosso et al., 1993) with four parameters (Tmin, Topt, Tmax,muopt)\cr\cr
	\code{cpm_pH_4p} is the cardinal pH model (Rosso et al., 1995) with four parameters (pHmin, pHopt, pHmax, muopt)\cr\cr
	\code{cpm_pH_3p} is a symetric cardinal pH model with three parameters (pHmin, pHopt, muopt), obtained by fixing pHmax to 2pHopt-pHmin in the \code{cpm_pH_4p} model\cr\cr
	\code{cpm_aw_3p} is the cardinal aw model (Rosso and Robinson, 2001) with three parameters (awmin, awopt, muopt)\cr\cr
	\code{cpm_aw_2p} is a simplified cardinal aw model (Rosso and Robinson, 2001) with two parameters (awmin, muopt) obtained by fixing awopt to 1 in the \code{cpm_aw_3p} model\cr\cr
	\code{cpm_T_pH_aw} is the cardinal model based on the gamma concept (Pinon et al., 2004) with 9 parameters (Tmin, Topt, Tmax, pHmin, pHopt, pHmax, awmin, awopt, muopt)\cr\cr

}

\value{ 
	A formula 
}

\references{ 
Pinon A, Zwietering M, Perrier L, Membr\'e J, Leporq B, Mettler E, Thuault D, Coroller L, Stahl V, Vialette M (2004) Development and validation of experimental protocols for use of cardinal models for prediction of microorganism growth in food products. \emph{Applied Environmental Microbiology}, \bold{70}, 1081-1087.\cr\cr
Rosso L, Robinson TP (2001) A cardinal model to describe the effect of water activity on the growth of moulds. \emph{International Journal of Food Microbiology}, \bold{63}, 265-273.\cr\cr
Rosso L, Lobry JR, Bajard S, Flandrois JP (1995) Convenient model to describe the combined effects of temperature and pH on microbial growth. \emph{Applied Environmental Microbiology}, \bold{61}, 610-616.\cr\cr
Rosso L, Lobry JR, Flandrois JP (1993) An unexpected correlation between cardinal temperatures of microbial growth highlighted by a new model. \emph{Journal of Theoretical Biology} \bold{162}, 447-463.
}

\author{ 
Florent Baty \email{florent.baty@gmail.com}\cr
Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}
}

%\note{  }

\examples{

data(ross)

# Example for the cpm_T model

d1 <- subset(ross, author == "salter" & aw == 0.997, 
	select = c(T, sqrtmumax))
nls1 <- nls(cpm_T, d1, list(muopt = 1.7, Tmin = 4, Topt = 40, Tmax = 47))
plotfit(nls1, smooth = TRUE)
overview(nls1)

# Example for the cpm_pH_4p model

d2 <- subset(ross, author == "presser" & aw > 0.99, 
	select = c(pH, sqrtmumax))
nls2 <- nls(cpm_pH_4p, d2, list(muopt = 0.5, pHmin = 4, 
	pHopt = 6.5, pHmax = 9))
plotfit(nls2, smooth = TRUE)
overview(nls2)

# Example for the cpm_pH_3p model

d3 <- subset(ross, author == "presser" & aw == 0.997, 
	select = c(pH, sqrtmumax))
nls3 <- nls(cpm_pH_3p, d3, list(muopt = 0.5, pHmin = 4, pHopt = 6.5))
plotfit(nls3, smooth = TRUE)
overview(nls3)

# Example for the cpm_aw_3p model

d4<-subset(ross, author == "mellefont", select = c(aw, sqrtmumax))
nls4 <- nls(cpm_aw_3p, d4, list(muopt = 0.6, awmin = 0.95, awopt = 0.995))
plotfit(nls4, smooth = TRUE)
overview(nls4)

# Example for the cpm_aw_2p model

d5 <- subset(ross, author == "mellefont" & aw < 0.99, 
	select = c(aw, sqrtmumax))
nls5 <- nls(cpm_aw_2p, d5, list(muopt = 0.6, awmin = 0.95))
plotfit(nls5, smooth = TRUE)
overview(nls5)


# Examples for the cpm_T_pH_aw model

d6 <- subset(ross, select = c(T, pH, aw, sqrtmumax))
nls6 <- nls(cpm_T_pH_aw, d6, list(muopt = 2, Tmin = 4, Topt = 40, Tmax = 49, 
	pHmin = 4, pHopt = 6.5, pHmax = 9, awmin = 0.95, awopt = 0.995))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
plotfit(nls6, variable = 1)
plotfit(nls6, variable = 2)
plotfit(nls6, variable = 3)
overview(nls6)
par(def.par)
}

\keyword{ models }% at least one, from doc/KEYWORDS
