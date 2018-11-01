# statistics by David Anderson

# clean the data storage
rm(list= ls())


data <- read.csv("PWM_11132013_50.csv")   #Read in the data from a csv
data$LNRK <- log(data$RK)
attach(data)                                #Attach the column headers to the data as variable names



#Generate the interaction terms

A1A2  <-	A1 * A2
A1C2	<-	A1 * C2
A1G2	<-	A1 * G2
A1T2	<-	A1 * T2
A1A3	<-	A1 * A3
A1C3	<-	A1 * C3
A1G3	<-	A1 * G3
A1T3	<-	A1 * T3
A1A4	<-	A1 * A4
A1C4	<-	A1 * C4
A1G4	<-	A1 * G4
A1T4	<-	A1 * T4
A1A5	<-	A1 * A5
A1C5	<-	A1 * C5
A1G5	<-	A1 * G5
A1T5	<-	A1 * T5
A1A6	<-	A1 * A6
A1C6	<-	A1 * C6
A1G6	<-	A1 * G6
A1T6	<-	A1 * T6
A2A3	<-	A2 * A3
A2C3	<-	A2 * C3
A2G3	<-	A2 * G3
A2T3	<-	A2 * T3
A2A4	<-	A2 * A4
A2C4	<-	A2 * C4
A2G4	<-	A2 * G4
A2T4	<-	A2 * T4
A2A5	<-	A2 * A5
A2C5	<-	A2 * C5
A2G5	<-	A2 * G5
A2T5	<-	A2 * T5
A2A6	<-	A2 * A6
A2C6	<-	A2 * C6
A2G6	<-	A2 * G6
A2T6	<-	A2 * T6
A3A4	<-	A3 * A4
A3C4	<-	A3 * C4
A3G4	<-	A3 * G4
A3T4	<-	A3 * T4
A3A5	<-	A3 * A5
A3C5	<-	A3 * C5
A3G5	<-	A3 * G5
A3T5	<-	A3 * T5
A3A6	<-	A3 * A6
A3C6	<-	A3 * C6
A3G6	<-	A3 * G6
A3T6	<-	A3 * T6
A4A5	<-	A4 * A5
A4C5	<-	A4 * C5
A4G5	<-	A4 * G5
A4T5	<-	A4 * T5
A4A6	<-	A4 * A6
A4C6	<-	A4 * C6
A4G6	<-	A4 * G6
A4T6	<-	A4 * T6
A5A6	<-	A5 * A6
A5C6	<-	A5 * C6
A5G6	<-	A5 * G6
A5T6	<-	A5 * T6
C1A2	<-	C1 * A2
C1C2	<-	C1 * C2
C1G2	<-	C1 * G2
C1T2	<-	C1 * T2
C1A3	<-	C1 * A3
C1C3	<-	C1 * C3
C1G3	<-	C1 * G3
C1T3	<-	C1 * T3
C1A4	<-	C1 * A4
C1C4	<-	C1 * C4
C1G4	<-	C1 * G4
C1T4	<-	C1 * T4
C1A5	<-	C1 * A5
C1C5	<-	C1 * C5
C1G5	<-	C1 * G5
C1T5	<-	C1 * T5
C1A6	<-	C1 * A6
C1C6	<-	C1 * C6
C1G6	<-	C1 * G6
C1T6	<-	C1 * T6
C2A3	<-	C2 * A3
C2C3	<-	C2 * C3
C2G3	<-	C2 * G3
C2T3	<-	C2 * T3
C2A4	<-	C2 * A4
C2C4	<-	C2 * C4
C2G4	<-	C2 * G4
C2T4	<-	C2 * T4
C2A5	<-	C2 * A5
C2C5	<-	C2 * C5
C2G5	<-	C2 * G5
C2T5	<-	C2 * T5
C2A6	<-	C2 * A6
C2C6	<-	C2 * C6
C2G6	<-	C2 * G6
C2T6	<-	C2 * T6
C3A4	<-	C3 * A4
C3C4	<-	C3 * C4
C3G4	<-	C3 * G4
C3T4	<-	C3 * T4
C3A5	<-	C3 * A5
C3C5	<-	C3 * C5
C3G5	<-	C3 * G5
C3T5	<-	C3 * T5
C3A6	<-	C3 * A6
C3C6	<-	C3 * C6
C3G6	<-	C3 * G6
C3T6	<-	C3 * T6
C4A5	<-	C4 * A5
C4C5	<-	C4 * C5
C4G5	<-	C4 * G5
C4T5	<-	C4 * T5
C4A6	<-	C4 * A6
C4C6	<-	C4 * C6
C4G6	<-	C4 * G6
C4T6	<-	C4 * T6
C5A6	<-	C5 * A6
C5C6	<-	C5 * C6
C5G6	<-	C5 * G6
C5T6	<-	C5 * T6
G1A2	<-	G1 * A2
G1C2	<-	G1 * C2
G1G2	<-	G1 * G2
G1T2	<-	G1 * T2
G1A3	<-	G1 * A3
G1C3	<-	G1 * C3
G1G3	<-	G1 * G3
G1T3	<-	G1 * T3
G1A4	<-	G1 * A4
G1C4	<-	G1 * C4
G1G4	<-	G1 * G4
G1T4	<-	G1 * T4
G1A5	<-	G1 * A5
G1C5	<-	G1 * C5
G1G5	<-	G1 * G5
G1T5	<-	G1 * T5
G1A6	<-	G1 * A6
G1C6	<-	G1 * C6
G1G6	<-	G1 * G6
G1T6	<-	G1 * T6
G2A3	<-	G2 * A3
G2C3	<-	G2 * C3
G2G3	<-	G2 * G3
G2T3	<-	G2 * T3
G2A4	<-	G2 * A4
G2C4	<-	G2 * C4
G2G4	<-	G2 * G4
G2T4	<-	G2 * T4
G2A5	<-	G2 * A5
G2C5	<-	G2 * C5
G2G5	<-	G2 * G5
G2T5	<-	G2 * T5
G2A6	<-	G2 * A6
G2C6	<-	G2 * C6
G2G6	<-	G2 * G6
G2T6	<-	G2 * T6
G3A4	<-	G3 * A4
G3C4	<-	G3 * C4
G3G4	<-	G3 * G4
G3T4	<-	G3 * T4
G3A5	<-	G3 * A5
G3C5	<-	G3 * C5
G3G5	<-	G3 * G5
G3T5	<-	G3 * T5
G3A6	<-	G3 * A6
G3C6	<-	G3 * C6
G3G6	<-	G3 * G6
G3T6	<-	G3 * T6
G4A5	<-	G4 * A5
G4C5	<-	G4 * C5
G4G5	<-	G4 * G5
G4T5	<-	G4 * T5
G4A6	<-	G4 * A6
G4C6	<-	G4 * C6
G4G6	<-	G4 * G6
G4T6	<-	G4 * T6
G5A6	<-	G5 * A6
G5C6	<-	G5 * C6
G5G6	<-	G5 * G6
G5T6	<-	G5 * T6
T1A2	<-	T1 * A2
T1C2	<-	T1 * C2
T1G2	<-	T1 * G2
T1T2	<-	T1 * T2
T1A3	<-	T1 * A3
T1C3	<-	T1 * C3
T1G3	<-	T1 * G3
T1T3	<-	T1 * T3
T1A4	<-	T1 * A4
T1C4	<-	T1 * C4
T1G4	<-	T1 * G4
T1T4	<-	T1 * T4
T1A5	<-	T1 * A5
T1C5	<-	T1 * C5
T1G5	<-	T1 * G5
T1T5	<-	T1 * T5
T1A6	<-	T1 * A6
T1C6	<-	T1 * C6
T1G6	<-	T1 * G6
T1T6	<-	T1 * T6
T2A3	<-	T2 * A3
T2C3	<-	T2 * C3
T2G3	<-	T2 * G3
T2T3	<-	T2 * T3
T2A4	<-	T2 * A4
T2C4	<-	T2 * C4
T2G4	<-	T2 * G4
T2T4	<-	T2 * T4
T2A5	<-	T2 * A5
T2C5	<-	T2 * C5
T2G5	<-	T2 * G5
T2T5	<-	T2 * T5
T2A6	<-	T2 * A6
T2C6	<-	T2 * C6
T2G6	<-	T2 * G6
T2T6	<-	T2 * T6
T3A4	<-	T3 * A4
T3C4	<-	T3 * C4
T3G4	<-	T3 * G4
T3T4	<-	T3 * T4
T3A5	<-	T3 * A5
T3C5	<-	T3 * C5
T3G5	<-	T3 * G5
T3T5	<-	T3 * T5
T3A6	<-	T3 * A6
T3C6	<-	T3 * C6
T3G6	<-	T3 * G6
T3T6	<-	T3 * T6
T4A5	<-	T4 * A5
T4C5	<-	T4 * C5
T4G5	<-	T4 * G5
T4T5	<-	T4 * T5
T4A6	<-	T4 * A6
T4C6	<-	T4 * C6
T4G6	<-	T4 * G6
T4T6	<-	T4 * T6
T5A6	<-	T5 * A6
T5C6	<-	T5 * C6
T5G6	<-	T5 * G6
T5T6	<-	T5 * T6


#Create a data frame (variable matrix) with the interatcion terms
DF <- data.frame( A1A2	, A1C2	, A1G2	, A1T2	, A1A3	, A1C3	, A1G3	, A1T3	,
                  A1A4	, A1C4	, A1G4	, A1T4	, A1A5	, A1C5	, A1G5	, A1T5	, A1A6	, A1C6	,
                  A1G6	, A1T6	, A2A3	, A2C3	, A2G3	, A2T3	, A2A4	, A2C4	, A2G4	, A2T4	,
                  A2A5	, A2C5	, A2G5	, A2T5	, A2A6	, A2C6	, A2G6	, A2T6	, A3A4	, A3C4	,
                  A3G4	, A3T4	, A3A5	, A3C5	, A3G5	, A3T5	, A3A6	, A3C6	, A3G6	, A3T6	,
                  A4A5	, A4C5	, A4G5	, A4T5	, A4A6	, A4C6	, A4G6	, A4T6	, A5A6	, A5C6	,
                  A5G6	, A5T6	, C1A2	, C1C2	, C1G2	, C1T2	, C1A3	, C1C3	, C1G3	, C1T3	,
                  C1A4	, C1C4	, C1G4	, C1T4	, C1A5	, C1C5	, C1G5	, C1T5	, C1A6	, C1C6	,
                  C1G6	, C1T6	, C2A3	, C2C3	, C2G3	, C2T3	, C2A4	, C2C4	, C2G4	, C2T4	,
                  C2A5	, C2C5	, C2G5	, C2T5	, C2A6	, C2C6	, C2G6	, C2T6	, C3A4	, C3C4	, 
                  C3G4	, C3T4	, C3A5	, C3C5	, C3G5	, C3T5	, C3A6	, C3C6	, C3G6	, C3T6	,
                  C4A5	, C4C5	, C4G5	, C4T5	, C4A6	, C4C6	, C4G6	, C4T6	, C5A6	, C5C6	, 
                  C5G6	, C5T6	, G1A2	, G1C2	, G1G2	, G1T2	, G1A3	, G1C3	, G1G3	, G1T3	,
                  G1A4	, G1C4	, G1G4	, G1T4	, G1A5	, G1C5	, G1G5	, G1T5	, G1A6	, G1C6	,
                  G1G6	, G1T6	, G2A3	, G2C3	, G2G3	, G2T3	, G2A4	, G2C4	, G2G4	, G2T4	,
                  G2A5	, G2C5	, G2G5	, G2T5	, G2A6	, G2C6	, G2G6	, G2T6	, G3A4	, G3C4	,
                  G3G4	, G3T4	, G3A5	, G3C5	, G3G5	, G3T5	, G3A6	, G3C6	, G3G6	, G3T6	,
                  G4A5	, G4C5	, G4G5	, G4T5	, G4A6	, G4C6	, G4G6	, G4T6	, G5A6	, G5C6	,
                  G5G6	, G5T6	, T1A2	, T1C2	, T1G2	, T1T2	, T1A3	, T1C3	, T1G3	, T1T3	,
                  T1A4	, T1C4	, T1G4	, T1T4	, T1A5	, T1C5	, T1G5	, T1T5	, T1A6	, T1C6	,
                  T1G6	, T1T6	, T2A3	, T2C3	, T2G3	, T2T3	, T2A4	, T2C4	, T2G4	, T2T4	,
                  T2A5	, T2C5	, T2G5	, T2T5	, T2A6	, T2C6	, T2G6	, T2T6	, T3A4	, T3C4	,
                  T3G4	, T3T4	, T3A5	, T3C5	, T3G5	, T3T5	, T3A6	, T3C6	, T3G6	, T3T6	,
                  T4A5	, T4C5	, T4G5	, T4T5	, T4A6	, T4C6	, T4G6	, T4T6	, T5A6	, T5C6	,
                  T5G6	, T5T6	)






DINUCINT <- c()
TVAL <- c()

for(n in 1:length(DF)){   #for each interaction term
  lm1 <- lm(LNRK ~ A1 + C1 + T1 + A2 + C2 + T2 + +A3 + C3 +T3 + C4 + G4 + T4 
            + A5 +C5 + G5  + A6 + C6 + G6 + DF[,n])     #regress reaction rate on each base-position variable, and 1 interaction term
  DINUCINT[n] <- mean(coefficients(lm1)[20])       #store the effect size of the interaction term 
  TVAL[n] <- summary(lm1)$coefficients[20,3]             #store the t-value of the interaction term
}

DINUCINT    #display interaction effect sizes
TVAL        #display T-values
whichin <- which(abs(TVAL) > 3.5)  #tells you which interaction terms have strongly statisticaly signficant interactions (T-statistcs greater than 3.5 standard deviations from the mean)
dataForlm <- cbind(data,DF)
DFname <- colnames(DF)
#convert the string to the command
command1 <- ""
for (i in 1:length(whichin))
  {
  str <- whichin[i]
  command1 <- paste(command1, "+", DFname[str]  ,sep = " ")
}

command2 <- "model3 <- lm(LNRK ~ A1 + C1 + T1 + A2 + C2 + T2 + +A3 + C3 +T3 + C4 + G4 + T4 + A5 +C5 + G5  + A6 + C6 + G6"

commandf <- paste(command2, command1,", data = dataForlm)",sep = "")
eval(parse(text = commandf))
#Fill in DF[,1] + DF[,10] ... with the indices given to you by the which command.  
#These happen to be the ones from this model


model4 <- step(model3)  # runs stepwise regression to pare down the variable list, and to exclude redundant/superflous interaction terms

summary(model4) # gives the summary of the final model

# plot the result


Ka4 <- predict(model4, newdata=dataForlm)
plotfig4 <- cbind(data$LNRK,Ka4)
plotfig4<-data.frame(plotfig4)
names(plotfig4) <- c("x","y")
fits4 <- lm(y~x, data = plotfig4)


pdf("PWM-IC_50.pdf", 6,6)
par(mar=c(5,5,2,2))
plot(plotfig4,
     ylab = expression(paste(italic(ln(phantom()^r*K[a])), ", predicted by model4")),
     xlab = expression(paste(italic(ln(phantom()^r*K[a])), ", experimental")),
     xlim = c(-1.5,0.5),
     ylim = c(-1.5,0.5),
     cex = 1,
     cex.lab = 1.5,
     cex.axis = 1.5)

text(-1.0,0.4,paste("R = ",round(summary(fits4)$r.square,2), sep = ""), cex = 1.5)
dev.off()



#abline(fits4, col = "red", lwd = 3)

#plot the heatmap

colNamedf <- colnames(DF)
matrix1 <- cbind(colNamedf,matrix(0,length(colNamedf),1))
names(matrix1) <- c("N","V")

matrix1 <- cbind(colNamedf,DINUCINT)
#replace T to U

#new method
matrix2 <- matrix1
matrix2 <- data.frame(matrix2)
C <- as.numeric(substr(matrix2[,1],2,2))
matrix2$X1 <- paste(C,substr(matrix2[,1],1,1),sep = "")
D<- as.numeric(substr(matrix2[,1],4,4))
matrix2$X2 <- paste(D,substr(matrix2[,1],3,3),sep = "")
detach(data)

model4.coef <- coef(model4)
model4.coef<- data.frame(model4.coef)
model4.coef$NAME <- rownames(model4.coef)
model4.coef <- model4.coef[-1,]


C <- as.numeric(substr(model4.coef[,2],2,2))
model4.coef$X1 <- paste(C,substr(model4.coef[,2],1,1),sep = "")
D<- as.numeric(substr(model4.coef[,2],4,4))
model4.coef$X2 <- paste(D,substr(model4.coef[,2],3,3),sep = "")
model4.coef$X2[model4.coef$X2 == "NA"] <- model4.coef$X1[model4.coef$X2 == "NA"]
plotfig4 <- cbind(data[,1],plotfig4)
write.csv(matrix2, "pop50.csv")
write.csv(model4.coef,"pop50_model4.csv")
write.csv(plotfig4, "predict50.csv")