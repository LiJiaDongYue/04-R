
#zhihu
#R中有四大框架用于产生图形，基本图形，网格，格子和ggplot2.
#分类数据的可视化使用条形图、点图、柱形图、脊柱图、马赛克图、饼图及四折图
#连续数据的可视化使用箱线图、直方图、散点图及其变种、帕累托图

#一、分类数据的可视化
#1.条形图
#条形图可以通过graphics库中的barplot函数实现，也可以通过lattice包的barplot函数实现，我们使用RSADBE包中的数据进行举例
library(RSADBE)
data("Severity_Counts")
library(lattice)
barchart(Severity_Counts,xlab="bug count",xlim=c(0,12000)) 
i