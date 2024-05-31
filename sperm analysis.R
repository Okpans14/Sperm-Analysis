##### NAME OF ANALYSISN#############

#rm(list=ls())#this code clears R memory

setwd("G:/PUBLICATIONS/SCRIPT") #Setwork directory tells R where (i.e. the folder) the all data is stored in you computer for the analysis

install.packages('ape') #this is rquired package for this analysis, you may not have it but just install by runing the next code make sure you have internet on
library(ape) #After installing load the package running this code

#stage 1: Importanting the Tree R
#Make sure the tree was stored in the folder as nexus format (ie. expect you have already inpoted the as nexus format into the folder where all dat ais stored for the anlsysis

phy<-read.nexus("nexustree") #Nexus tree is the name you stored the tree with in the folder
plot(phy, adj=0.1,cex=0.6)
phy
is.ultrametric(phy)

newtree<-phy
plot(newtree,adj=0.2,cex=0.6)
is.ultrametric(newtree)

#stage 2: Importing the data
#Make sure the data was stored in the folder as a textfile format (ie. expect you have already as text fiele format into the folder where all dat ais stored for the anlsysis. missing should be na

install.packages('caper') #this is rquired package for this analysis, you may not have it but just install by runing the next code make sure you have internet on
library(caper) #After installing load the package running this code


data<-read.table("spermdata.txt", header=T)
attach(data)
names(data)
str(data)
data

#Stage 3 : checking alignment of sperm data with the tips of the tree. It MUST correspond--otherwise mistake

#plot data to check alignment
plot(newtree,show.node.label=FALSE, adj=1, cex=0.5);
tiplabels(data$tsl,frame="none", bg="white", adj=0.3, cex=0.5)

##this organises data into comparative dataset for caper
cdata<-comparative.data(newtree,data,names.col=species,na.omit=FALSE,vcv=TRUE,warn.dropped=TRUE)
print(cdata)

#creates dataframe
data2<-data.frame(data[,3:23])
rownames(data2)<-data[,2]
attach(data2)
data2
head(data2)

#creates a vector for each continuous trait
names(head)<-rownames(data2)
names(midp)<-rownames(data2)
names(tail)<-rownames(data2)
names(flag)<-rownames(data2)
names(tsl)<-rownames(data2)
names(flag_head)<-rownames(data2)
