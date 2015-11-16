setwd("H:/plink-1.07-dos/")
library(openxlsx)

#case-only in EIRA: 2458 patients
acpa <- read.xlsx("2014-10-06_ISAC_Results_EIRA2013_to_Henrik.xlsx", sheet=1)
cutoff <- read.xlsx("2014-10-06_ISAC_Results_EIRA2013_to_Henrik.xlsx", sheet=3)
names(cutoff)[1] <- names(acpa)[1]
test <- rbind(cutoff, acpa)
for (i in 2:68) test[4:2863,i]<-ifelse(test[4:2863,i]>test[2,i],2,1)
test <- test[4:2863,]
key <- read.table("key_ICHIP.txt", header=F)
names(key)[4] <- names(test)[1]
test <- merge(key, test, by="Sample.ID")
test <- test[,c(2:3,5:71)]
test <- test[,c(1:14,24:25,30:33,40:43,18:23,28,27,29,48:53,56:60,63:67,15:17,26,34:39,44:47,54:55,61:62,68:69)]
pheno49 <- read.table("EIRA_pheno1-49_newID_plink.txt", header=F)
names(test)[1:2] <- c("FID","IID")
names(pheno49)[1:2] <- c("FID","IID")
tmp <- merge(pheno49[,1:2], test, by="IID")
test <- tmp[,c(2,1,4:70)]
write.table(test, "EIRA_caseonly_pheno67.txt", quote=F, sep="\t", row.names=F, col.names=F)
case_case <- apply(test[,3:69],2,table)
case_case <- t(case_case)
case_case
# 
# 1    2
# CCP-1.cit.biotin     1426 1032
# CCP-1.arg.biotin     2385   73
# Vim60-75.cit.biotin  1332 1126
# Vim60-75.arg.biotin  2412   46
# Vim2-17.cit.biotin   1718  740
# Vim2-17.arg.biotin   2418   40
# Fib36-52.cit.biotin  1336 1122
# Fib36-52.arg.biotin  2431   27
# Fib573.cit.biotin    1417 1041
# Fib573.arg.biotin    2418   40
# Fib591.cit.biotin    1860  598
# Fib591.arg.biotin    2394   64
# CEP-1                1288 1170
# REP-1                2432   26
# ptm11                2386   72
# ptm12                2147  311
# ptm13                2221  237
# ptm15                2386   72
# ptm35                1877  581
# ptm36                1803  655
# ptm37                2319  139
# ptm66                2381   77
# Fib.alpha621-635.cit 1665  793
# Fib.alpha621-635.arg 2402   56
# Fib.Alpha36-50.cit   2099  359
# Fib.Alpha36-50.arg   2383   75
# Fib.beta60-74.cit    1029 1429
# Fib.beta60-74.arg    2420   38
# RA33                 2344  114
# Ro.52                2332  126
# SM.Biotin            2426   32
# Rip.P2               2420   38
# U1RNPC               2377   81
# PCNA                 2405   53
# U1.RNP.68k           2444   14
# U1-RNP-A             2393   65
# RNA.Pol3             2403   55
# Jo.1                 2391   67
# ds.DNA               2394   64
# La.(SS-B)            2381   77
# PMScl.100            2371   87
# Scl.70.Antigen       2320  138
# CENP.B               2384   74
# Fibrillarin          2383   75
# Ro60.Biotin          2327  131
# Lachsspermien-dsDNA  2364   94
# SmBB'                2443   15
# Fib72.cit.biotin     2329  129
# Fib74.cit.biotin     2122  336
# Fib72,.74.arg.biotin 2403   55
# Carb-CEP-1           1858  600
# HEP-1                2383   75
# KEP-1                2378   80
# CPP-3                2182  276
# RPP-3                2326  132
# CPP-5                2067  391
# RPP-5                2416   42
# Pept.Z1              1135 1323
# Pept.Z1-K            2338  120
# Pept.Z2              1433 1025
# Pept.Z2-K            2357  101
# Pept.-1              1719  739
# Pept-1-K             2380   78
# Pept-5               1094 1364
# Pept-5-K             2361   97
# Bla26                1694  764
# Bla26-K              2391   67
