
#data依旧是前面所创建的data
#关系矩阵测试 简单循环
data_matrix <- matrix(as.integer(data.matrix(data[,-1])), ncol = 7)
system.time(
  for (i in 1:3661) {
  a <- setdiff(data_matrix[i, ], NA) #这步放这里可以减少重复，而且只要a里面没有NA即可
  for (j in 1:i) {
    b <- data_matrix[j, ]
    relation_matrix[i, j] <- ifelse(sum(a %in% b), 1, 0)
  }
})
