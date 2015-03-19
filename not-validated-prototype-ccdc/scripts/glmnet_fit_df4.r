library('glmnet')

x=read.table("glmnet_fit_inputs.txt",sep=",",col.names=c("x1","x2","x3","y"))
x<-as.matrix(data.frame(x1,x2,x3))
fit1<-glmnet(x,y,nlambda = 20)

cfs0<-coef(fit1)["(Intercept)",15]
cfs1<-coef(fit1)["x1",15]
cfs2<-coef(fit1)["x2",15]
cfs3<-coef(fit1)["x3",15]

cfs<-data.frame(cfs0,cfs1,cfs2,cfs3)
print(cfs)
write.table(cfs,"glmnet_fit_outputs.txt",sep=" ",row.names=FALSE,col.names=FALSE)
