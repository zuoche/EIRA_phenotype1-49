setwd("H:/Project Results/IC_pheno1-49_unadj/")
datatot<-c()
for (i in 1:49) { 
  nam <- paste("plink.P",i,".assoc.logistic",sep="")
  dataread<-read.table(nam, header=T)
  dataread$Pheno <- i
  datatot <- rbind(datatot, dataread)
  
  nam<-NULL
  dataread<-NULL
  
}


seq(from=1, to=1539383, by=2)
