#统计学中R
#计算50位同学生日相同概率

#1.比较阶乘效率
system.time(replicate(1000000,factorial(100))) 
system.time(replicate(1000000,prod(1:100)))
system.time(replicate(1000000,gamma(100+1)))#效率更高

#1.1 自定义函数，效率不高
#循环的表达
factorial1 <-function(x) {
  y <- 1
  for (i in 1:x) y=y*i
  print (y)
}

#递归的表达方式
factorial2 <- function(x) {
  y=1
  if (x >1) return (y=x*factorial2(x-1))
  else print(y)
}
#2.次幂
2**3

#3.
1-(prod(316:365)/365**50)#0.9703736 概率相当

