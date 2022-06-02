# for PWM linear regression
#load the data
# clean the data storage
rm(list= ls())
howmany <- 6

data <- read.csv("chr_table.csv")   #Read in the data from a csv
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

control <- c('G1','A2','T3','T4','A5','G6','T7')
#cut the control
combination <- combination[!(combination %in% control)]

#generate the command
command.a <- 'lm1 <- lm(LNRK ~'
for (i in 1:(length(combination)-1)){
  command.a <- paste(command.a, combination[i], '+')
}

command.a <- paste(command.a,combination[length(combination)], ')')
eval(parse(text = command.a))
    #regress reaction rate on each base-position variable, and 1 interaction term

#Get the coefficient and prepare for data visualization
coef1 <- coef(lm1)
coef1 <- coef1[-1]
coef1[is.na(coef1)] <- 0
factor1 <- names(coef1)
coef1 <- as.numeric(coef1)
loca <- cbind(factor1, coef1)

loc <- control
lon <- rep(0,length(control))
locc <- cbind(loc,lon)

locd<- rbind(loca,locc)
locb <- data.frame(locd)

locb$NT <- substr(locb[,1],1,1)

locb$POS <- (as.numeric(substr(locb[,1],2,2)))
locb[locb$NT == 'T',3] <- 'U'
locb <- as.matrix(locb)

#Using bubble chart to visualize the data
par(mar=c(5,5,2,2))
colorc <- c("lightpink",rgb(129/255,216/255,208/255),"orange","olivedrab2")
#rgb(129/255,216/255,208/255)
seq <- c('A','C','G','U')
plot(NA,NA ,pch = 21, cex = 5, col = NULL, bg = "green",
     xlim = c(1,7),
     ylim = c(-0.3,0.3),
     xlab = "Position in Leader",
     ylab = "Linear Coefficient")
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

#See the prediction quality by linear model
lc <- predict(lm1, newdata = data)
lcf <- lm(lc~data$LNRK)
plot(data$LNRK,lc,
     cex = 0.5,
     xlim = c(-2,1.5),
     ylim = c(-2,1.5),
     xlab = expression(
       italic(
         paste("ln(",phantom()^r*K[a], ")")
       )
     ),
     ylab = expression(
       italic(
         paste("predicted ln(",phantom()^r*K[a], ")")
       )
     )
)
text(-1.5,0.5,paste("R= ", round(summary(lcf)$r.square,2)))
detach(data) 


summary(lcf)