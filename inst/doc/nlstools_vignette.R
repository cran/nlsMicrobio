### R code from vignette source 'nlstools_vignette.Rnw'

###################################################
### code chunk number 1: nlstools_vignette.Rnw:24-25
###################################################
library(nlsMicrobio)


###################################################
### code chunk number 2: nlstools_vignette.Rnw:41-44
###################################################
data(survivalcurve2)
preview(formula=mafart, data=survivalcurve2,
start=list(p = 1, delta = 1, LOG10N0 = 7))


###################################################
### code chunk number 3: nlstools_vignette.Rnw:49-51
###################################################
preview(formula=mafart, data=survivalcurve2,
start=list(p = 1, delta = 10, LOG10N0 = 7))


###################################################
### code chunk number 4: nlstools_vignette.Rnw:56-58
###################################################
preview(formula=mafart, data=survivalcurve2,
start=list(p = 2, delta = 10, LOG10N0 = 7.5))


###################################################
### code chunk number 5: nlstools_vignette.Rnw:67-69
###################################################
nlsmaf <- nls(mafart, survivalcurve2, list(p = 2, delta = 10, LOG10N0 = 7.5))
plotfit(nlsmaf,smooth=TRUE)


###################################################
### code chunk number 6: nlstools_vignette.Rnw:74-76
###################################################
model <- LOG10N ~ LOG10N0 - (t/delta)^p
nlsmaf <- nls(model, survivalcurve2, list(p = 2, delta = 10, LOG10N0 = 7.5))


###################################################
### code chunk number 7: nlstools_vignette.Rnw:81-87
###################################################
data(ross)
d6<-subset(ross, select = c(T, pH, aw, sqrtmumax))
nls6 <- nls(cpm_T_pH_aw, d6, list(muopt = 2, Tmin = 4,
Topt = 40, Tmax = 49,pHmin = 4, pHopt = 6.5, pHmax = 9,
awmin = 0.95, awopt = 0.995))
plotfit(nls6, variable = 1)


###################################################
### code chunk number 8: nlstools_vignette.Rnw:89-90
###################################################
plotfit(nls6, variable = 2)


###################################################
### code chunk number 9: nlstools_vignette.Rnw:95-96
###################################################
overview(nlsmaf)


###################################################
### code chunk number 10: nlstools_vignette.Rnw:105-107
###################################################
resmaf<-nlsResiduals(nlsmaf)
plot(resmaf)


###################################################
### code chunk number 11: nlstools_vignette.Rnw:114-115
###################################################
test.nlsResiduals(resmaf)


###################################################
### code chunk number 12: nlstools_vignette.Rnw:127-128
###################################################
contmaf <- nlsContourRSS(nlsmaf)


###################################################
### code chunk number 13: nlstools_vignette.Rnw:131-132
###################################################
plot(contmaf, col=FALSE, nlev=10)


###################################################
### code chunk number 14: nlstools_vignette.Rnw:146-147
###################################################
rcmaf <- nlsConfRegions(nlsmaf, length=500, exp=1)


###################################################
### code chunk number 15: nlstools_vignette.Rnw:149-150
###################################################
plot(rcmaf, bounds=T)


###################################################
### code chunk number 16: nlstools_vignette.Rnw:155-156
###################################################
rcmaf <- nlsConfRegions(nlsmaf, length=500, exp=2)


###################################################
### code chunk number 17: nlstools_vignette.Rnw:159-160
###################################################
plot(rcmaf,bounds=T)


###################################################
### code chunk number 18: nlstools_vignette.Rnw:165-166
###################################################
rcmaf <- nlsConfRegions(nlsmaf, length=2000, exp=2)


###################################################
### code chunk number 19: nlstools_vignette.Rnw:169-170
###################################################
plot(rcmaf, bounds=F)


###################################################
### code chunk number 20: nlstools_vignette.Rnw:177-180
###################################################
plot(rcmaf$cr[,1], rcmaf$cr[,3], pch=16, xlab='p', ylab='LOG10N')
contour(contmaf$seqPara[, 1], contmaf$seqPara[, 3], contmaf$lrss[[2]], 
                labels = "", levels = contmaf$lrss95, lty = 1, col = "red",add=T,lwd=5)


###################################################
### code chunk number 21: nlstools_vignette.Rnw:190-191
###################################################
jackmaf <- nlsJack(nlsmaf)


###################################################
### code chunk number 22: nlstools_vignette.Rnw:193-194
###################################################
summary(jackmaf)


###################################################
### code chunk number 23: nlstools_vignette.Rnw:199-200
###################################################
plot(jackmaf)


###################################################
### code chunk number 24: nlstools_vignette.Rnw:207-208
###################################################
boomaf <- nlsBoot(nlsmaf, niter=2000) 


###################################################
### code chunk number 25: nlstools_vignette.Rnw:211-212
###################################################
summary(boomaf)


###################################################
### code chunk number 26: nlstools_vignette.Rnw:217-218
###################################################
plot(boomaf, type="pairs")


