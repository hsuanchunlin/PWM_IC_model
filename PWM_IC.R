# statistics by David Anderson
# Optimized by Hsuan-Chun Lin
# Log of development
# control bug fixed on 1/26/2016

# clean the data storage
rm(list= ls())

#Setup hyper parameters

howmany <- 7
controlSeq <- 'GATTAGT'

data <- read.csv("inputESS3.csv")   #Read in the data from a csv
data$LNRK <- log(data$RK)
attach(data)                                #Attach the column headers to the data as variable names
#Automatic generate the pair
nucleotides <- c('A','C','G','T')
combination <- c()
k <- 1
for (i in 1:howmany){
  for(j in 1:4){
    combination[k] <- paste(nucleotides[j],i,sep = '')
    k <- k+1
  }
}


controlSeq <- unlist(strsplit(controlSeq, ''))
control <- c()
for (i in 1:length(controlSeq)){
  control[i] = paste(controlSeq[i],i, sep = '')
}
#cut the control
combination <- combination[!(combination %in% control)]
#Create IC list
control.comb <- c()
k <- 1
#make the combination control
for(i in 1:length(control)){
  for (j in 1:length(control)){
    control.comb[k] <- paste(control[i], control[j], sep = '')
    k <- k + 1
  }
}

IC.command <- c() # for the command
IC.comb <- c() # for combind the chart
k <- 1
#for all the possible sequence

for (i in 1:(howmany-1)){
  for (j in 1:4){
    for (q in (i+1):howmany){
      for(p in 1:4){

          IC.command[k] <- paste(nucleotides[j],i,nucleotides[p],q,'<-',nucleotides[j],i,'*',nucleotides[p],q,sep = '')
          IC.comb[k] <- paste(nucleotides[j],i,nucleotides[p],q,sep = '')
          k <- k+1
      }
    }
  }
}


#for the control

#execute the command
for (i in 1:length(IC.command)){
  eval(parse(text = IC.command[i]))
}

command.a <- 'DF <- data.frame('
for (i in 1:(length(IC.comb)-1)){
  command.a <- paste(command.a, IC.comb[i], ',', sep = '')
}

command.a <- paste(command.a,IC.comb[length(IC.comb)], ')', sep = '')

eval(parse(text = command.a))

#start the PWM + IC
DINUCINT <- c()
TVAL <- c()

#generate the command
command.a <- 'lm1 <- lm(LNRK ~'
for (i in 1:(length(combination))){
  command.a <- paste(command.a, combination[i], '+')
}
command.b <- paste(command.a, 'DF[,n] )')
for(n in 1:length(DF)){   #for each interaction term
       #regress reaction rate on each base-position variable, and 1 interaction term
  eval(parse(text = command.b))
  DINUCINT[n] <- mean(coefficients(lm1)[length(coefficients(lm1))])       #store the effect size of the interaction term
  if(length(summary(lm1)$coefficients[,3] >= length(coefficients(lm1)))){
    TVAL[n] <- summary(lm1)$coefficients[length(summary(lm1)$coefficients[,3]),3]
  }else{
    TVAL[n] = 0
  }
  #store the t-value of the interaction term
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
command2 <- 'model3 <- lm(LNRK ~'
for (i in 1:(length(combination))){
  command2 <- paste(command2, combination[i], '+')
}

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



par(mar=c(5,5,2,2))



plot(plotfig4,
     ylab = expression(paste(italic(ln(K["A,rel"])), ", predicted by model4")),
     xlab = expression(paste(italic(ln(K["A,rel"])), ", experimental")),
     xlim = c(-8,1.5),
     ylim = c(-8,1.5),
     cex = 0.5,
     cex.lab = 7/6,
     cex.axis = 7/6)

text(-6,0.5,paste("R2 = ",round(summary(fits4)$r.square,2), sep = ""), cex = 7/6)

smoothScatter(plotfig4,
     ylab = expression(paste(italic(ln(K["A,rel"])), ", predicted by model4")),
     xlab = expression(paste(italic(ln(K["A,rel"])), ", experimental")),
     xlim = c(-8,1.5),
     ylim = c(-8,1.5),
     cex = 0.5,
     cex.lab = 7/6,
     cex.axis = 7/6)

text(-6,0.5,paste("R2 = ",round(summary(fits4)$r.square,2), sep = ""), cex = 7/6)

#abline(fits4, col = "red", lwd = 3)

#plot the heatmap

colNamedf <- colnames(DF)
matrix1 <- cbind(colNamedf,matrix(0,length(colNamedf),1))
names(matrix1) <- c("N","V")

matrix1 <- cbind(colNamedf,DINUCINT)
#replace T to U
#matrix1 <- gsub("T","U",matrix1)

#new method
matrix2 <- matrix1
matrix2 <- data.frame(matrix2)
C <- (as.numeric(substr(matrix2[,1],2,2)))
matrix2$X1 <- paste(C,substr(matrix2[,1],1,1),sep = "")
D<- (as.numeric(substr(matrix2[,1],4,4)))
matrix2$X2 <- paste(D,substr(matrix2[,1],3,3),sep = "")
detach(data)

model4.coef <- coef(model4)
model4.coef<- data.frame(model4.coef)
model4.coef$NAME <- rownames(model4.coef)
model4.coef <- model4.coef[-1,]
#model4.coef$NAME <- gsub("T","U",model4.coef$NAME)


C <- -(as.numeric(substr(model4.coef[,2],2,2))+2)
model4.coef$X1 <- paste(C,substr(model4.coef[,2],1,1),sep = "")
D<- -(as.numeric(substr(model4.coef[,2],4,4))+2)
model4.coef$X2 <- paste(D,substr(model4.coef[,2],3,3),sep = "")
model4.coef$X2[model4.coef$X2 == "NA"] <- model4.coef$X1[model4.coef$X2 == "NA"]
write.csv(matrix2, "ESS3_heat.csv")
write.csv(model4.coef, "model4_real_number.csv")
