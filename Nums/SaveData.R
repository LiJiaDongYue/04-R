
#储存数据，尤其是字符型数据，有时候不会储存完整的内容
#可能会用一个字符代替整个内容，这样会使存储的体积更小，
#那么我们在使用时候需要将数据完整的表达出来
library("bitops")
library("RCurl")

# 输入数据
#url = "https://raw.githubusercontent.com/chrisestevez/MSDA-Bridge/master/mushroom.csv"
#Rdata = getURL(url)
#完整的将数据导入到了内存中
MyData = read.csv(text = "mushroom.csv",header = FALSE,sep=",")
MyFinalData = data.frame(MyData)
samp = head(MyFinalData, n = 10)

samp = subset(samp, select = c(V1,V3,V5,V9))
colnames(samp) = c("MushroomType","CapSurface","Bruises","GillSize")

# 替换数据
samp$MushroomType = c('p'="poisonous",'e'="edible")[ as.character(samp$MushroomType)]
samp$CapSurface = c('f'="fibrous",'g'="grooves",y='scaly','s'="smooth")[ as.character(samp$CapSurface)]
samp$Bruises = c('t'="bruises",'f'="no")[ as.character(samp$Bruises)]
samp$GillSize = c('b'="broad",'n'="narrow")[ as.character(samp$GillSize)]