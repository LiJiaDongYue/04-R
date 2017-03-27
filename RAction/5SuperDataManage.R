
#R语言实战第五章--高级数据管理
#explame5.1
x1 <- c(1:8)
mean(x)
sum(x)/length(x)
sd(x)
var(x)
sum((x-sum(x)/length(x)^2))/(length(x)-1)#方差标准计算方式


x2 <- pretty(c(-3,3),30)
y1 <- dnorm(x2)#密度函数
y2 <- pnorm(x2)#分布函数
y3 <- qnorm(x2)#分位数函数
y4 <- rnorm(x2)#随机数函数
plot(x2,y1,type = "l")
plot(x2,y2,type = "l")
plot(x2,y3,type = "l")
plot(x2,y4,type = "l")

set.seed(1)#结果重现
runif(5)

#生成服从正态分布的数据
library(MASS)
options(digits = 3)
set.seed(1) #设定随机种子
#指定均值向量 协方差阵
tmean <- c(230.7,146.7,3.6)
tsigma <- matrix(c(15360.8,6721.2,-47.1,
                  6721.2,4700.9,-16.5,
                  -47.1,-16.5,0.3),nrow = 3,ncol = 3)
mydata <- as.data.frame(mvrnorm(500,tmean,tsigma))
head(mydata)
dim(mydata)

name <- "leal"
cat("hello",name,"\n")
tmatirx <- matrix(runif(12),nrow = 3)
mean(tmatirx)
apply(tmatirx,1,mean)
apply(tmatirx,1,mean,trim=0.3)#计算每列的截尾均值
tmatirx

#解决方案
options(digits = 3)
a <- sample(letters,3)

#如何获取随机姓名
getdata <- function(){
  firstname <- sample(letters,ceiling(runif(1)*5),replace = TRUE)
  lastname <- sample(letters,ceiling(runif(1)*5),replace = TRUE)
  as.vector(paste(toupper(substr(firstname,1,1)),lastname,sep = ""))
}

ceiling(runif(10)*400)+200
student <-c("Qwe Werter","Rwefr Twe","Twe Rfg","Frt Gyt","Yert Ufdg",
            "Qwfe Werfter","Rwfefr Twe","Tfwe Rfg","Frft Gyt","Yefrt Ufdg")
math <- ceiling(runif(10)*400)+200
chinese <- ceiling(runif(10)*90)+10
english <- ceiling(runif(10)*90)+10
roster <- data.frame(student,math,chinese,english,stringsAsFactors = FALSE)
#计算综合得分
z <- scale(roster[,2:4]) #数据对象标准化 为了使其分数可以进行比较
score <- apply(z,1,mean)
roster <- cbind(roster,score)
y <- quantile(score,c(.8,.6,.4,.2))
roster <- within(roster,{
  grade <- ""
  grade[score>=y[1]] <- "A"
  grade[score>=y[2]&score<y[1]] <- "B"
  grade[score>=y[3]&score<y[2]] <- "C"
  grade[score>=y[4]&score<y[3]] <- "D"
  grade[score<y[4]] <- "E"
})

#抽取学生姓名
name <- strsplit(roster$student," ")
#循环获得分割后的函数
firstname <- sapply(name,"[",1)
lastname <- sapply(name,"[",2)
#绑定替换第一列
roster <- cbind(lastname,firstname,roster[,-1])
roster <- roster[order(lastname,firstname),]

#整合和重塑数据
options(digits = 3)
attach(mtcars)
head(mtcars)
# Group.1表示汽缸数量（4、 6或8）， Group.2代表挡位数（3、 4或5）
aggdata <- aggregate(mtcars,by=list(Group.cyl=cyl,Group.gears=gear),FUN = mean,na.rm=TRUE)
aggdata

#reshape 数据重塑



