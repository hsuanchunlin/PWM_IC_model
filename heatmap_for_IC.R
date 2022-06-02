library(ggplot2)

hm <- read.csv("demo_heat.csv")

pdf("heatmap_demo.pdf", 10,8)
(p <- ggplot(hm,aes(X2,X1))
 +geom_tile(aes(fill = DINUCINT),colour = "gray")
 +scale_fill_gradient2(low="steelblue",mid="white",
                       high="red", midpoint=0,space = "rgb",
                       na.value = "grey50", guide = "colourbar",
                       name = "HiTS-EQ")
 +theme_bw()
 + theme(text = element_text(size=20),
         axis.text= element_text(size=20,colour="black"))
 +labs(size= 20,
       x = "",
       y = ""))

dev.off()