导入所需的开发包
library(readxl)
library(jiebaRD)
library(jiebaR)
library(plyr)
library(wordcloud2)

# 读入评论数据
evaluation <- read_excel('Emotion/comment.xlsx') # file.choose()
head(evaluation)
str(evaluation)

# 读入正负面词库及停止词
pos <- readLines('Emotion/positive.txt', encoding = 'UTF-8')
neg <- readLines('Emotion/negative.txt', encoding = 'UTF-8')
stopwords <- readLines('Emotion/mystopwords.txt', encoding = 'UTF-8')

# 合并情感词库
mydict <- c(pos, neg)
head(mydict)
# 为jieba分词准备工作引擎
engine <- worker()
#往jieba分词引擎中添加自定义词汇，目的是能够将一些词正常的切开
# 例如，不添加自定义词汇
sentence <- '超韧细密，湿水不易破'
segment(sentence, engine)
# 添加自定义词汇
new_user_word(engine, '不易破')
segment(sentence, engine)

new_user_word(engine, mydict)

# 对每一条评论进行切词
segwords <- sapply(evaluation$space, segment, engine)
head(segwords)

# 删除停止词（即对分析没有意义的词，如介词、虚词等）
# 自定义函数：用于删除停止词
removewords <- function(target_words,stop_words){
  target_words = target_words[target_words%in%stop_words==FALSE]
  return(target_words)
}

segwords2 <- sapply(segwords, removewords, stopwords)
head(segwords2)

#自定义情感类型得分函数
fun <- function(x,y) x %in% y

getEmotionalType <- function(x,pwords,nwords){ 
  pos.weight = sapply(llply(x,fun,pwords),sum)
  neg.weight = sapply(llply(x,fun,nwords),sum)
  total = pos.weight - neg.weight
  
  return(data.frame(pos.weight, neg.weight, total)) 
}

# 计算每条评论的正负得分
score <- getEmotionalType(segwords2, pos, neg)
head(score)

# 将原始数据与得分数据进行合并
evalu.score <- cbind(evaluation, score)

# 这里不妨将总得分大于等于0的记录设置为正面情感，小于0的记录设置为负面情感
evalu.score <- transform(evalu.score, 
                         emotion = ifelse(total>=0, 'Pos', 'Neg'))
head(evalu.score)

# 随机挑选10条评论，做一个验证
set.seed(1)
validation <- evalu.score[sample(1:nrow(evalu.score),
                                 size = 10),]
validation[,c(2,6)]

# 不妨，我们再对评论数据绘制文字云
# 计算词频
wf <- unlist(segwords2)
wf <- as.data.frame(table(wf))
wf <- arrange(wf, desc(Freq))
head(wf)  

# 绘制词云
wordcloud2(wf[1:50,], backgroundColor = 'black')

# 有很多一个字的词在词云中，影响了表达的内容，不妨我们在词云中只保留包含2个字及以上的词
#自定义函数：保留至少2个字符长度的词语
more2words <- function(x){
  words = c()
  for (word in x) {
    if (nchar(word)>1) words = c(words,word)
  }
  return(words)
}

segwords3 <- more2words(unlist(segwords2))

# 计算词频
wf2 <- unlist(segwords3)
wf2 <- as.data.frame(table(wf2))
wf2 <- arrange(wf2, desc(Freq))
head(wf2)  

# 绘制Top50的词云
wordcloud2(wf2[1:50,], backgroundColor = 'black')

# 由于该评论就是针对汽车的空间加以说明的，显然词云中的“空间”的存在并没有意义。
wordcloud2(wf2[2:51,], backgroundColor = 'black')
