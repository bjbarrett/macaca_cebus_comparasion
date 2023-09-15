library(RColorBrewer)
##plot it
pal <- brewer.pal(3, "Dark2")
post <- extract.samples(m1)
plot(density(d_list_tc$weight_g), xlim=c(min(d_list_tc$weight_g),max((d_list_tc$weight_g)))  , col="grey" , ylim=c(-0.0002,0.012) , main="" , xlab="mean T. catappa stone tool weight (g)" , cex.lab=1.5, yaxt='n' , ylab="")
#almendras, no shells
#cebus
xx <- exp(post$a[,1]) 
farbe <- pal[1]
dens( tc$weight[tc$genus_index==1]  , col=farbe , add=TRUE)
pts <- tc$weight[tc$genus_index==1]
dens( xx  , col=farbe , add=TRUE)
shade( density(xx) , lim= as.vector(HPDI(xx, prob=0.9999)) , col = col.alpha(farbe, 0.5))
points( pts , rep(-0.0001, length(pts)) , pch=19 , col=col.alpha(farbe , 0.2) , cex=0.5)
##macacque
xx <- exp(post$a[,2]) 
farbe <- pal[2]
dens( tc$weight[tc$genus_index==2]  , col=farbe , add=TRUE)
pts <- tc$weight[tc$genus_index==2]
dens( xx , add=TRUE , col=farbe )
shade( density(xx) , lim= as.vector(HPDI(xx, prob=0.9999)) , col = col.alpha(farbe, 0.5))
points( pts , rep(-0.0002, length(pts)) , pch=19 , col=col.alpha(farbe , 0.2) , cex=0.5)

legend("topright", c("Cebus" , "Macaca"), pch=15, col=pal, box.col=NA, cex=1 )