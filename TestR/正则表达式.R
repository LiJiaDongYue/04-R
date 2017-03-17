word <- c('abc noboby@stat.berkeley.edu','text with no email','first me@mything.com also you@yourspace.com')
pattern <- '[-A-Za-z0-9_.%]+@[-A-Za-z0-9_.%]+\\.[A-Za-z]+'
p <- '[\\w]+@[\\w]'
out <- gregexpr(p,word)

#得到正则之后匹配的串
getcontent <- function(s,g){
    substring(s,g,g+attr(g,'match.length')-1)
}

for(i in 1:length(word)){
  if(getcontent(word[i],out[[i]])!="")
  {
    print (getcontent(word[i],out[[i]]))
  }
}
