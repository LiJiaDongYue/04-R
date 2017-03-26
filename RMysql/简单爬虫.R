
#爬虫是一种利用代码（例如：R code或Python code）模拟浏览器访问（下载）页面并根据HTML结构筛选获取所需信息的一种工具
#在R里面我们通常用Rcurl包实现前一半的功能（模拟浏览器访问页面），用XML包完成后一半功能（通过HTML树结构筛选提取信息）。
#
#1.模拟浏览器行为
# 构造请求报头
cust_header <-  c(`User-Agent` = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0", 
                Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", 
                `Accept-Language` = "en-us", Connection = "keep-alive")
#2.模拟访问
library(bitops)
library(RCurl)
library(XML)
# 读取拉手深圳美食搜索
start_url <-  "http://shenzhen.lashou.com/cate/meishi"
# 读取PageSouce
pagesource <- getURL(start_url, httpheader = cust_header, .encoding = "utf-8")

#3.整理HTML结构
# 使用XML中的htmlTreeParse函数解析刚才得到的webpage变量
pagetree <- htmlTreeParse(pagesource, encoding = "GB2312", error = function(...) {}, 
                          useInternalNodes = TRUE, trim = TRUE)# 注意encoding

#4.定位节点
node<-getNodeSet(pagetree, "//div[contains(@class,"goods")]//a[@class="goods-name"]//text()")
goods_name<-sapply(node,xmlValue) 










