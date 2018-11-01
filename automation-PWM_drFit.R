
source('R-automation.R')
  M4 <- read.csv('Maria_result_2-5.csv')
  seq <- M4$sequence
  RKA <- M4$RKA
  data <- fillFunction(seq,RKA)
  
  
  data$LNRK <- log(data$RK)
  attach(data) 


lm1 <- lm(LNRK ~  A1 + C1 + T1 + A2 + C2 + T2 + +A3 + C3 +T3 + C4 + G4 + T4 
          + A5 +C5 + G5  + A6 + C6 + G6 )     #regress reaction rate on each base-position variable, and 1 interaction term

coef1 <- coef(lm1)
coef1 <- coef1[-1]
coef1[is.na(coef1)] <- 0

factor1 <- names(coef1)
coef1 <- as.numeric(coef1)
loca <- cbind(factor1, coef1)

loc <- c("T6","T5","A4","G3","G2","G1")
lon <- c(0,0,0,0,0,0)
locc <- cbind(loc,lon)

locd<- rbind(loca,locc)
locb <- data.frame(locd)
locb$NT <- substr(locb[,1],1,1)

locb$POS <- numberPhantom[as.numeric(substr(locb[,1],2,2))]
locb <- as.matrix(locb)


numberPhantom <- rev(1:6)
par(mar=c(5,5,2,2))

colorc <- c("lightpink",rgb(129/255,216/255,208/255),"orange","olivedrab2")
#rgb(129/255,216/255,208/255)
seq <- c('A','C','G','T')
plot(NA,NA ,pch = 21, cex = 5, col = NULL, bg = "green",
     xlim = c(1,6),
     ylim = c(-2,2),
     xlab = "Position in Leader",
     ylab = "Linear Coefficient",
     cex.lab = 1.5,
     cex.axis = 1.5)
for (i in 1:4)
{
  nt <- seq[i]
  points(locb[locb[,3]== nt ,4],locb[locb[,3]== nt ,2] ,pch = 21, cex = 5, col = NULL, bg = colorc[i])
  
}


for (i in 1:length(locb[,1]))
{
  text(as.numeric(locb[i,4]),as.numeric(locb[i,2]),locb[i,3], col = "black")
}

# if you need abline for tick
abline(h=0)





lc <- predict(lm1, newdata = data)
lcf <- lm(lc~data$LNRK)
summary(lcf)


par(mar= c(6,6,2,2))
plot(data$LNRK,lc,
     xlab = expression(paste("HiTS-EQ ",italic(ln^r*K[a]))),
     ylab = expression(paste("Predicted ",italic(ln^r*K[a]))),
     cex.lab = 1.5,
     cex.axis = 1.5)
text(-1,0, paste("R= ", round(summary(lcf)$r.squared,2)), cex = 1)


detach(data) 
