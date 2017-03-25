#分析QQ群聊天记录

#1.读取数据 此方法读取很慢
#file_data<-readLines(file.choose(),encoding = "UTF-8")

#2.定义数据框和变量
data <- data.frame(user_name = c(), datetime = c(), text = c())
user_name <- character()
datetime <- character()
text <- character()

#3.开始遍历整个文本，取出三列数据
#201702201608-
for(i in 9:length(file_data)){
  dt_pattern <- regexpr('[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]+:[0-9]+:[0-9]+',file_data[i])#时间正则
  if(dt_pattern == 1) {
    user_begin <- dt_pattern+attr(dt_pattern,'match.length') + 1
    user_end <- nchar(file_data[i])
    user_name <- substring(file_data[i],user_begin,user_end)
    
    dt_begin <- dt_pattern
    dt_end <- dt_pattern+attr(dt_pattern,'match.length')-1
    datetime <- substring(file_data[i],dt_begin,dt_end)
    
    text <- file_data[i+1]
    
    data <- rbind(data, data.frame(Name = user_name,datetime = datetime,text = text))
  }
}
#4.字段类型转换
data$user_name <- as.character(data$Name)
data$text <- as.character(data$text)
data$datetime <- as.POSIXlt(data$datetime)
#取出时间戳（datetime）的年、月、日、时、分、秒部分
data <- transform(data,
                  year = datetime$year+1900,
                  month = datetime$mon+1,
                  day = datetime$mday,
                  hour = datetime$hour,
                  min = datetime$min,
                  sec = datetime$sec)
data$datetime <- as.character(data$datetime)

#操作1 统计每月每天总的聊天次数
library(sqldf)
my.data1 <- sqldf('select month,day,count(*) Freq from data
                  group by month,day')

#图1 月日群内活跃数
p1 <- ggplot(data = my.data1, mapping = aes(x = factor(day), y = factor(month), fill = Freq))
p1 <- p1 + geom_tile() + scale_fill_gradient(low = 'steelblue', high = 'darkred')


# 操作2 每个用户的发言频率
df <- as.data.frame(table(data$Name))
#这里挑出发言量前10的群员
top10 <- df[order(df$Freq, decreasing = TRUE),][1:10,]

#绘制没有排序的条形图
library(ggplot2) #？对Var1==>Name
p2 <- ggplot(data = top10, mapping = aes(x = Var1, weight = Freq, fill = Var1)) + xlab(NULL) + ylab(NULL)
p2 <- p2 + geom_bar() + coord_flip() #+ scale_fill_manual(values = rainbow(10), guide = FALSE)
#排序后
p3 <- ggplot(data = top10)+ xlab(NULL) + ylab(NULL)
p3 <- p3 + geom_bar(aes(x = reorder(Name, Freq), y = Freq, fill = Name), stat="identity") + coord_flip()

#读取10人的发言汇总信息
my.data3 <- sqldf('select Name,hour,count(*) Freq from data where Name in (select Name from top10) group by Name,hour')
Encoding(my.data3$Name) <- 'UTF-8'
#绘制面积图
p4 <- ggplot(data = my.data3, mapping = aes(x = hour, y = Freq, fill = Name))
p4 <- p4 + geom_area() + facet_wrap(~Name) + scale_fill_manual(values = rainbow(10), guide = FALSE)


#词频分析
library(Rwordseg)
library(tmcn)
library(tm)
word <-unlist(lapply(X=data$text,FUN=segmentCN))



