


#时间:2017-03-03 11:14
#Leal
#问题描述:
#需要做的数据处理是，求所有专利之间的关系矩阵，这里的关系指的是：
#当同一个企业同时申请了两个不同的专利，那么就认为这两个专利是有关系的。
#也就是说，当两个专利对应的企业的集合存在交集，则认为这两个专利存在关系。
#需要用矩阵表达这3660个专利的相互关系，有关系的两个专利交叉的位置置为1，否则置为0。

#创建数据，默认每个公司都申请有专利
patent_id <- seq(1, 3661, by = 1)
comany1 <- round(runif(3661, 1, 3000))
comany2 <- round(runif(3661, 1, 3000))
comany3 <- round(runif(3661, 1, 3000))
comany4 <- round(runif(3661, 1, 3000))
comany5 <- round(runif(3661, 1, 3000))
comany6 <- round(runif(3661, 1, 3000))
comany7 <- round(runif(3661, 1, 3000))
data <-
  data.frame(patent_id,
             comany1,
             comany2,
             comany3,
             comany4,
             comany5,
             comany6,
             comany7)


library(reshape)
md <- melt(data, id = (c("patent_id")))
#paste 连接向量转换为字符
md <- data.frame(md[, 1], paste(md[, 2], md[, 3]))
#重命名
colnames(md) = c("patent_id", "num")
ch <- data.frame(table(md$num))
#ch1),][,1]
ch <- as.character(ch)

#Create Martirx defaulr  all zero
relation_matrix <- matrix(0, 3661, 3661)
#进度条
pb <- txtProgressBar(min = 0, max = 3661, style = 3)

i <- 1
while (i < (length(ch) + 1)) {
  x <- which(md$num == ch[i])
  n <- 1
  while (n < length(x)) {
    relation_matrix[md[x[n], 1], md[x[n + 1], 1]] <- 1
    n = n + 1
  }
  rm(x, n)
  i <- i + 1
  
  Sys.sleep(0.00001);
  setTxtProgressBar(pb, i);
}
relation_matrix <- relation_matrix + t(relation_matrix)
#write.csv(relation_matrix, "result.csv")