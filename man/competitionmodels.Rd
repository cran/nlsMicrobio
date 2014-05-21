\name{competitionmodels}
\alias{competitionmodels}
\alias{jameson_buchanan}
\alias{jameson_baranyi}
\alias{jameson_without_lag}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Competition models for simultaneous growth of two bacterial flora }
\description{
  Formulas of primary growth models used in predictive microbiology to model the
  simultaneous growth of two competitive bacterial flora assuming a Jameson effect
  }
\usage{
jameson_buchanan
jameson_baranyi
jameson_without_lag
}

%- maybe also 'usage' for other objects documented here.

%\arguments{ }

\details{


    These models describe the simultaneous evolution of the decimal logarithm of 
    the microbial 
    counts of two flora (LOG10N) as a function of the time (t) and of the flora (flora)
    coded as 1 for counts of flora 1 and 2 for counts of flora 2. These three
    models assume independent lag and growth parameters for flora 1 and 2, except for
    the saturation which is supposed to be governed by the Jameson effect and modelled
    by a common parameter (tmax) which represents the time at which both flora stop to
    multiply. Modelling the simultaneous saturation by this way enables the model
    to be fitted by \code{nls}, as an analytical form of the model is available.
    
    \code{jameson_buchanan} is based on the model of Buchanan et al. (1997) for lag phase modelling
and is characterized by seven parameters 
(LOG10N0_1, mumax_1, lag_1, LOG10N0_2, mumax_2, lag_2 and the common saturation
time tmax). This model was described and used in Vimont et al. (2006).\cr\cr
    \code{jameson_baranyi} is based on the model of Baranyi and Roberts (1994) for lag phase modelling
and is characterized by seven parameters 
(LOG10N0_1, mumax_1, lag_1, LOG10N0_2, mumax_2, lag_2 and the common saturation
time tmax)\cr\cr
    \code{jameson_without_lag} is based on the exponential model without lag phase 
and is thus characterized by five parameters 
(LOG10N0_1, mumax_1, LOG10N0_2, mumax_2 and the common saturation time tmax)\cr\cr
}

\value{ 
    A formula 
}

\references{ 
Baranyi J and Roberts, TA (1994) A dynamic approach to predicting bacterial growth in food, \emph{International Journal of Food Microbiology}, \bold{23}, 277-294.\cr\cr
Buchanan RL, Whiting RC, Damert WC (1997) When is simple good enough: a comparison of the Gompertz, Baranyi, and three-phase linear models for fitting bacterial growth curves. \emph{Food Microbiology}, \bold{14}, 313-326.\cr\cr
Vimont A, Vernozy-Rozand C, Montet MP, Lazizzera C, Bavai C and Delignette-Muller ML (2006) Modeling and predicting the simultaneous growth of Escherichia coli O157:H7 and ground beef background microflora in various enrichment protocols. 
\emph{Applied and Environmental Microbiology} \bold{72}, 261-268.}

\author{ 
Florent Baty \email{florent.baty@gmail.com}\cr
Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}
}

%\note{  }

\examples{
options(digits=3)

### Example 1: fit of model jameson_buchanan  
data(competition1)
nls1 <- nls(jameson_buchanan, competition1, 
        list(lag_1 = 2, mumax_1 = 1, LOG10N0_1 = 1, tmax = 12,
     lag_2 = 2, mumax_2 = 1, LOG10N0_2 = 4))

overview(nls1)

   # Plot of theoretical curves with data
twocolors <- c("red","blue")
npoints <- 100
seq.t <- seq(0,max(competition1$t),length.out=npoints)
prednls1.1 <- predict(nls1,data.frame(t=seq.t,flora=rep(1,npoints)))
prednls1.2 <- predict(nls1,data.frame(t=seq.t,flora=rep(2,npoints)))
plot(competition1$t,competition1$LOG10N,col=twocolors[competition1$flora],xlab="t",ylab="LOG10N")
lines(seq.t,prednls1.1,col=twocolors[1])
lines(seq.t,prednls1.2,col=twocolors[2])


### Example 2 : fit of model jameson_baranyi  
data(competition1)
nls2 <- nls(jameson_baranyi, competition1, 
        list(lag_1 = 2, mumax_1 = 1, LOG10N0_1 = 1, tmax = 12,
     lag_2 = 2, mumax_2 = 1, LOG10N0_2 = 4))

overview(nls2)
plotfit(nls2)

   # Plot of theoretical curves with data
twocolors <- c("red","blue")
npoints <- 100
seq.t <- seq(0,max(competition1$t),length.out=npoints)
prednls2.1 <- predict(nls2,data.frame(t=seq.t,flora=rep(1,npoints)))
prednls2.2 <- predict(nls2,data.frame(t=seq.t,flora=rep(2,npoints)))
plot(competition1$t,competition1$LOG10N,col=twocolors[competition1$flora],xlab="t",ylab="LOG10N")
lines(seq.t,prednls2.1,col=twocolors[1])
lines(seq.t,prednls2.2,col=twocolors[2])


### Example 3: fit of model jameson_without_lag  
data(competition2)
nls3 <- nls(jameson_without_lag, competition2, 
        list(mumax_1 = 1, LOG10N0_1 = 1, tmax = 12,
     mumax_2 = 1, LOG10N0_2 = 4))

overview(nls3)
plotfit(nls3)

 # Plot of theoretical curves with data
twocolors <- c("red","blue")
npoints <- 100
seq.t <- seq(0,max(competition2$t),length.out=npoints)
prednls3.1 <- predict(nls3,data.frame(t=seq.t,flora=rep(1,npoints)))
prednls3.2 <- predict(nls3,data.frame(t=seq.t,flora=rep(2,npoints)))
plot(competition2$t,competition2$LOG10N,col=twocolors[competition2$flora],xlab="t",ylab="LOG10N")
lines(seq.t,prednls3.1,col=twocolors[1])
lines(seq.t,prednls3.2,col=twocolors[2])

}

\keyword{ models }% at least one, from doc/KEYWORDS
