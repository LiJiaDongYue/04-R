
#1.Test
#devtools::install_github("qinwf/jiebaR")
library("jiebaRD")
library("jiebaR")
mixseg = worker()
#1
mixseg["这是一段测试文本"]
#2
mixseg <='这是第二种JiebaR的分词写法'
#3segment
segment("这是第3种JiebaR的分词写法",mixseg)
#4txt
mixseg['TestJieba.txt']

#2.分词引擎
pryr::otype(mixseg)#面向对象的类型检查 S3
class(mixseg)  # 查看class是属性
#3.配置词典
show_dictpath()#查看默认的词库位置
dir(show_dictpath())#查看目录
#打开系统词典文件jieba.dict.utf8，并打印前50行
#词项，词频，词性标记
scan(file="/home/leal/R/x86_64-pc-linux-gnu-library/3.3/jiebaRD/dict/jieba.dict.utf8",
               what=character(),nlines=50,sep='\n', encoding='utf-8',fileEncoding='utf-8')
#打开用户词典文件user.dict.utf8，并打印前50行
#词项，词性标记，没有词频的列--用户词典默认词频为系统词库中的最大词频
scan(file="/home/leal/R/x86_64-pc-linux-gnu-library/3.3/jiebaRD/dict/user.dict.utf8",
     what=character(),nlines=50,sep='\n', encoding='utf-8',fileEncoding='utf-8')
#使用自定义的用户词典
worker(user='user.utf8')['TestJieba.txt']#OK
#使用搜狗词典--本次测试全国地名的词典(找不到其他)
#可通过文本挖掘的内容的相关性，到搜狗上下载对应的词典成为自己的词典(http://pinyin.sogou.com/dict/)
devtools::install_github("qinwf/cidian")
cidian::decode_scel(scel = "china.scel",cpp = TRUE)#转换搜狗词典二进制词典到文本文件
# 查看生成的词典文件
scan(file="china.scel_2017-03-13_17_11_29.dict",
          what=character(),nlines=50,sep='\n', encoding='utf-8',fileEncoding='utf-8')


#5.停止词过滤
#停止词就是分词过程中，我们不需要作为结果的词
worker()["对于别人来说，你只是你，而对于我，你是我的世界"]
worker(stop_word='stop_word')["对于别人来说，你只是你，而对于我，你是我的世界"]

#6.关键词提取
#TF（Term Frequency）代表词频，IDF（Inverse Document Frequency）表示逆文档频率
#TF-IDF = TF(词频) * 逆文档频率(IDF)
#IDF的语料库     词项,权重
scan(file="/home/leal/R/x86_64-pc-linux-gnu-library/3.3/jiebaRD/dict/idf.utf8",
           what=character(),nlines=50,sep='\n',encoding='utf-8',fileEncoding='utf-8')
#取TF-IDF的前5的关键词 worker("keywords",topn=5)
freq(worker("keywords",topn=5)["使用jiebaR包处理分词确实简单，几行的代码就能实现分词的各种算法操作。有了这个工具，我们就可以文档中，发现各种语言规则进行文本挖掘了"])
#计算关键词
vector_keywords(worker()["使用jiebaR包处理分词确实简单，几行的代码就能实现分词的各种算法操作。
              有了这个工具，我们就可以文档中，发现各种语言规则进行文本挖掘了"],worker("keywords",topn=5))

#自然语言处理（NLP）在数据分析领域有其特殊的应用，在R中除了jiebaR包，中文分词Rwordseg包也非常常用。
#一般的文本挖掘步骤包括：文本获取（主要用网络爬取）——文本处理（分词、词性标注、删除停用词等）
#——文本分析（主题模型、情感分析）——分析可视化（词云、知识图谱等）


