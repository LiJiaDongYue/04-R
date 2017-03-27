
#更新R的包
#在原来的R中
oldip <- installed.packages()[,1]
save(oldip,file = "installedPackages.Rdata")

#在更新后的R中
load("installedPackages.Rdata")
newip <- installed.packages()[,1]
for(i in setdiff(oldip,newip))
  install.packages(i)
  
