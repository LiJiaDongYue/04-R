
#Time 2017-03-08
#Author leal
#from https://zhuanlan.zhihu.com/p/25271241

#R向数据框中添加新的列,以数据集Loblolly为例。
head(Loblolly)
#除单个变量使用rm(object) 
#函数清除内存中所有的变量rm(list = ls())
#way1 $
data1 <- Loblolly
data1$logHeight <- log(data1$height)
#rm(data1)
#way2 within函数 必须在新添加的变量中加上花括号
data1 <- within(data1,{logHeight1=log(height)})
#way3 也可以使用with函数，该函数可以用于任何表达式的计算，
#但每次只能生成一个计算字段，最后还需要结合使用cbind函数
data1 <- cbind(data1,with(data1,log(height)))
names(data1)[6]<- 'logHeight2'
#way4 transform
data1 <- transform(data1,logHeight3=log(height),powerage=age^2)
#delete colomn删除数据框中的某一列：建议使用subset函数，只需在删除的列前添加负号即可
data1 <- subset(data1,select = -c(logHeight1,logHeight2,logHeight3))
head(data1)

#Test data
tdata <- data.frame(x1=rnorm(1000),x2=rt(1000,2,3),x3=sample(c('a','c','b'),size = 1000,replace = TRUE))
#更改数据框中所有数值变量的值，可以考虑结合使用apply函数和sapply函数
tdata <- cbind(tdata,apply(tdata[,-3],2,function(x) log(x^2)))
#tdata <- cbind(tdata,sapply(tdata[-3],function(x) log(x^2)))
names(tdata)[c(4,5)] <- c('tx1','tx2')
tdata <- subset(tdata,select = -c(tx1,tx2))
head(tdata)
#变量的重编码：即根据已有的变量重新编码，如连续变量的离散化
rdata <- Loblolly
rdata <- within(rdata,{
    recode_x=0
    recode_x[height<13]=1
    recode_x[height>=13&height<15]=2
    recode_x[height>=15]=3
})
head(rdata)
#System already library(car)
#语法：
#recode(var, recodes, as.factor.result, as.numeric.result=TRUE, levels)
#var为一个数值向量，recodes为重编码的规则

#row&col switch
dfrow <- data.frame(id=c(1,2,3),phase1=rnorm(3),phase2=rnorm(3),phase3=rnorm(3))
dfcol <- data.frame(id=rep(1:3,each=3),x=rep(c('a','b','c'),times=3),c=rnorm(9))
#对于宽型数据框转换为长型数据框可以使用reshape2包中的melt函数 row-->col
library(reshape2)
dfrow_c <- melt(dfrow,id.vars='id')
#rename in package plyr
library(plyr)
dfrow_c <- rename(dfrow_c,c('variable'='parse','value'='index'))

#对于长型数据框转化为宽型数据框可以使用stats包中的reshape函数
#reshape函数需要至少5个参数，第一个参数为被重塑的数据框，第二个参数通过v.names指定非分组变量或观测值
#第三个参数timevar指定分组变量或因子，第四个参数idvar指定重复出现的观测单位
#最后一个参数direction指定转换的类型，其值为'wide'和'long'两种
#当然可能用到drop参数，指定不需要的观测值变量
library(stats)
dfcol_r <- reshape(data = dfcol,v.names = 'y',timevar = 'x',idvar='id',direction='wide')







