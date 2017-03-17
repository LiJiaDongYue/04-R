
#在黑板上写下50个数字：1至50.在接下来的49轮操作中，
#每次做如下动作：选取两个黑板上的数字a和b，擦去，在黑板上写|b – a|
#请问最后一次动作之后剩下数字可能是什么？为什么
w <- rep(0,50)
for (j in 1:50) {
  nums <- c(1:50)
  for (i in 1:49) {
    #random two nums
    q <- sample(nums, 2)
    a <- q[1]
    b <- q[2]
    c <- abs(a - b)
    #delete a
    nums <- nums[-which(nums == a)]
    length1 <- length(nums) - 50 + i
    if (length1 < 0) {
      nums <- c(nums, rep(a, abs(length1)))
    }
    # delete b
    nums <- nums[-which(nums == b)]
    length2 <- length(nums) - 49 + i
    if (length2 < 0) {
      nums <- c(nums, rep(b, abs(length2)))
    }
    
    c <- nums[length(nums) + 1]
    if (length(nums) == 1) {
      w[j] <- nums
    }
  }
}