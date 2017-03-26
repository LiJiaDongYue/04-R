
#画个性化词云图
#主要有两个函数letterCloud和wordcloud2
#wordcloud2提供了基本的词云功能，letterCloud可以使用选定的词绘制词云，这个词可以是英文，也可以是中文
library(wordcloud2)
wordcloud2(demoFreq)
#画一个五角星
wordcloud2(demoFreq, size = 0.6,shape='star')
#黑白照片
wordcloud2(demoFreqC, size = 1,figPath=system.file("examples/t.png",package="wordcloud2"),backgroundColor = "black")

#letterCloud
letterCloud(demoFreqC,word="R",size = 3)

letterCloud(demoFreqC,word="挖",size = 4)