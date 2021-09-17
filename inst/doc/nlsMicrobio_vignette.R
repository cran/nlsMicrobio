### R code from vignette source 'nlsMicrobio_vignette.Rnw'

###################################################
### code chunk number 1: nlsMicrobio_vignette.Rnw:26-27
###################################################
library(nlstools)


###################################################
### code chunk number 2: nlsMicrobio_vignette.Rnw:44-48
###################################################
library(nlsMicrobio)
data(survivalcurve2)
preview(formula=mafart, data=survivalcurve2,
        start=list(p = 1, delta = 1, LOG10N0 = 7))


###################################################
### code chunk number 3: nlsMicrobio_vignette.Rnw:53-55
###################################################
preview(formula=mafart, data=survivalcurve2,
        start=list(p = 1, delta = 10, LOG10N0 = 7))


###################################################
### code chunk number 4: nlsMicrobio_vignette.Rnw:60-62
###################################################
preview(formula=mafart, data=survivalcurve2,
        start=list(p = 2, delta = 10, LOG10N0 = 7.5))


###################################################
### code chunk number 5: nlsMicrobio_vignette.Rnw:71-73
###################################################
nlsmaf <- nls(mafart, survivalcurve2, list(p = 2, delta = 10, LOG10N0 = 7.5))
plotfit(nlsmaf,smooth=TRUE)


###################################################
### code chunk number 6: nlsMicrobio_vignette.Rnw:78-80
###################################################
model <- LOG10N ~ LOG10N0 - (t/delta)^p
nlsmaf <- nls(model, survivalcurve2, list(p = 2, delta = 10, LOG10N0 = 7.5))


###################################################
### code chunk number 7: nlsMicrobio_vignette.Rnw:85-91
###################################################
data(ross)
d6<-subset(ross, select = c(T, pH, aw, sqrtmumax))
nls6 <- nls(cpm_T_pH_aw, d6, list(muopt = 2, Tmin = 4,
                                  Topt = 40, Tmax = 49,pHmin = 4, pHopt = 6.5, pHmax = 9,
                                  awmin = 0.95, awopt = 0.995))
plotfit(nls6, variable = 1)


###################################################
### code chunk number 8: nlsMicrobio_vignette.Rnw:93-94
###################################################
plotfit(nls6, variable = 2)


###################################################
### code chunk number 9: nlsMicrobio_vignette.Rnw:99-100
###################################################
overview(nlsmaf)


###################################################
### code chunk number 10: resmaf
###################################################
resmaf<-nlsResiduals(nlsmaf)
plot(resmaf)


###################################################
### code chunk number 11: nlsMicrobio_vignette.Rnw:119-120
###################################################
test.nlsResiduals(resmaf)


###################################################
### code chunk number 12: nlsMicrobio_vignette.Rnw:132-133
###################################################
contmaf <- nlsContourRSS(nlsmaf)


###################################################
### code chunk number 13: nlsMicrobio_vignette.Rnw:136-137
###################################################
plot(contmaf, col=FALSE, nlev=10)


###################################################
### code chunk number 14: nlsMicrobio_vignette.Rnw:151-152
###################################################
rcmaf <- nlsConfRegions(nlsmaf, length=500, exp=1)


###################################################
### code chunk number 15: nlsMicrobio_vignette.Rnw:154-155
###################################################
plot(rcmaf, bounds=T)


###################################################
### code chunk number 16: nlsMicrobio_vignette.Rnw:160-161
###################################################
rcmaf <- nlsConfRegions(nlsmaf, length=500, exp=2)


###################################################
### code chunk number 17: nlsMicrobio_vignette.Rnw:164-165
###################################################
plot(rcmaf,bounds=T)


###################################################
### code chunk number 18: nlsMicrobio_vignette.Rnw:170-171
###################################################
rcmaf <- nlsConfRegions(nlsmaf, length=2000, exp=2)


###################################################
### code chunk number 19: nlsMicrobio_vignette.Rnw:174-175
###################################################
plot(rcmaf, bounds=F)


###################################################
### code chunk number 20: nlsMicrobio_vignette.Rnw:182-185
###################################################
plot(rcmaf$cr[,1], rcmaf$cr[,3], pch=16, xlab='p', ylab='LOG10N')
contour(contmaf$seqPara[, 1], contmaf$seqPara[, 3], contmaf$lrss[[2]], 
                labels = "", levels = contmaf$lrss95, lty = 1, col = "red",add=T,lwd=5)


###################################################
### code chunk number 21: nlsMicrobio_vignette.Rnw:195-196
###################################################
jackmaf <- nlsJack(nlsmaf)


###################################################
### code chunk number 22: nlsMicrobio_vignette.Rnw:198-199
###################################################
summary(jackmaf)


###################################################
### code chunk number 23: nlsMicrobio_vignette.Rnw:204-205
###################################################
plot(jackmaf)


###################################################
### code chunk number 24: nlsMicrobio_vignette.Rnw:213-214
###################################################
boomaf <- nlsBoot(nlsmaf, niter=2000) 


###################################################
### code chunk number 25: nlsMicrobio_vignette.Rnw:217-218
###################################################
summary(boomaf)


###################################################
### code chunk number 26: nlsMicrobio_vignette.Rnw:223-224
###################################################
plot(boomaf, type="pairs")


