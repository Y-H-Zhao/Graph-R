setwd("D:/R/Graph")
#基础图形
library(ggplot2)
#比较两种方法的区别，geomgeom_point()与stat_smooth()未兼存
ggplot(faithful,aes(x=eruptions,y=waiting))+geom_point()+stat_smooth()

p<-ggplot(faithful,aes(x=eruptions,y=waiting))
p+geom_point()
p+stat_smooth()
#使用geoms来绘制条形图
ggplot(quakes,aes(x=depth))+geom_bar()
ggplot(quakes,aes(x=depth))+geom_bar(binwidth = 50)

quakes.agg<-aggregate(mag~round(depth,-1),data = quakes,FUN = length)
names(quakes.agg)<-c("depth","mag")
ggplot(quakes.agg,aes(x=depth,y=mag))+
  geom_bar(stat = "identity")
#使用geom_point()
ggplot(quakes,aes(x=long,y=lat))+
  geom_point()
#折线图
ggplot(longley,aes(x=Year,y=Unemployed))+geom_line()
#stat_bin来处理数据
ggplot(quakes,aes(x=depth))+geom_bar(binwidth = 50)
ggplot(quakes,aes(x=depth))+stat_bin(binwidth = 50)
#使用stat_smooth进行数据平滑
ggplot(longley,aes(x=Year,y=Employed))+geom_point()

ggplot(longley,aes(x=Year,y=Employed))+geom_point()+
  stat_smooth()

ggplot(longley,aes(x=Year,y=Employed))+geom_point()+
  stat_smooth(method = "lm")
#添加Facets,Scales,Options
ggplot(mtcars,aes(x=hp,y=mpg))+geom_point()

ggplot(mtcars,aes(x=hp,y=mpg))+geom_point()+
  stat_smooth(method = "lm")+facet_grid(~cyl) #以cy1为因子分开

ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(shape=factor(cyl),colour=factor(cyl)))
#以cy1为因子分开 形状 颜色

ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(shape=factor(cyl),colour=factor(cyl)))+
  scale_shape_discrete(name="Cylinders")+
  scale_colour_discrete(name="Cylinders") #改名
#最后加文本注释geom_text()
#对坐标轴的设置labs(title=...,x=...,y=...)或者ggtitle()
#对文字的设置theme(plot.title=element_text(size=...,colour=...))
#theme(axis.title.x=element_text(size=...,colour=...))
#theme(axis.title.y=element_text(size=...,colour=...))
