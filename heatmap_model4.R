library(ggplot2)
BcKINB <- read.csv("demo_model4_real_number.csv")
BcKINB[is.na(BcKINB)] <- 0

(p <- ggplot(BcKINB,aes(X2,X1))
 +geom_tile(aes(fill = model4.coef),colour = "gray")
 +scale_fill_gradient2(low="steelblue",mid="white",
                       high="red", midpoint=0,space = "rgb",
                       na.value = "grey50", guide = "colourbar",
                       name = "HiTS-EQ IC")
 +theme_bw()
 + theme(text = element_text(size=20),
         axis.text= element_text(size=20,colour="black"))
 +theme(panel.background = element_rect(fill = "white"))
 +labs(size= 20,
       x = "",
       y = ""))

write.csv(BcKINB,"KINMODEL4.csv")
