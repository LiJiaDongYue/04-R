
#RMysql
library(DBI)
library(RMySQL)
#rmysql localhost & remote
conn <- dbConnect(MySQL(), dbname = "rmysql", username="rmysql", password="leal",host='127.0.0.1',port=3306)
users = dbGetQuery(conn, "SELECT id,user FROM t_user order by id")
dbDisconnect(conn)

dbListTables(conn)#查看数据库的表
dbListFields(conn, "t_user")#查看表的字段
summary(MySQL(), verbose = TRUE)#查询MySQL信
summary(conn, verbose = TRUE)#MySQL连接实例信息
dbListConnections(MySQL())#MySQL连接信息


# 建表并插入数据
t_demo <- data.frame(
  id=seq(1:10),
  letter=letters[1:10],
  value=rnorm(10)
)
dbWriteTable(conn, "t_demo", t_demo)
## 获得整个表数据
dbReadTable(conn, "t_demo")
dbWriteTable(conn, "t_demo", t_demo, append=TRUE)# 插入新数据
dbWriteTable(conn, "t_demo", t_demo, overwrite=TRUE)# 覆盖原表数据
dbGetQuery(conn, "SELECT * FROM t_demo where c>0")#查询数据 get data.frame
dbSendQuery(conn, "SELECT * FROM t_demo where c>0")# 执行SQL脚本查询 get "MySQLResult"
fetch(rs, n = 3) #分页
summary(rs, verbose = TRUE) #查看集统计信息
#删除表
if(dbExistsTable(conn,'t_demo')){
       dbRemoveTable(conn, "t_demo")
}

strsql <- "CREATE TABLE t_blog(
id INT PRIMARY KEY AUTO_INCREMENT,
title varchar(12) NOT NULL UNIQUE,
author varchar(12) NOT NULL, 
length int NOT NULL,
create_date timestamp NOT NULL DEFAULT now()
)ENGINE=INNODB DEFAULT CHARSET=UTF8;"
dbGetQuery(conn,strsql)
dbListFields(conn,'t_blog')

blog <- data.frame(
  title=c("one","two","查看集统计信息"),
  author=c("1","2","3"),
  length=seq(1:3)
)

dbGetQuery(conn,"SET NAMES utf8")
dbWriteTable(conn,"t_blog",blog,row.names=FALSE,append=TRUE)
dbGetQuery(conn,"INSERT INTO t_blog VALUES(NULL,'234','看集',4,NULL)")
dbSendQuery(conn,"INSERT INTO t_blog VALUES(NULL,'123','看集',5,NULL)")
dbReadTable(conn,"t_blog")






