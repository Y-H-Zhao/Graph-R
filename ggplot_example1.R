setwd("D:/R/R实战")
library(ggplot2)
ggplot(data = mtcars,aes(x=wt,y=mpg))+
  geom_point()+
  labs(title="Automobile Data",x="Weight",y="Miles per Gallon")
#win.graph()
ggplot(data = mtcars,aes(x=wt,y=mpg))+
  geom_point(pch=17,color="blue",size=2)+
  geom_smooth(method = "lm",color="red",linetype=2)+
  labs(title="Automobile Data",x="Weight",y="Miles per Gallon")

#分组
mtcars$am<-factor(mtcars$am,levels = c(0,1),
                  labels = c("Automatic","Manual"))
mtcars$vs<-factor(mtcars$vs,levels = c(0,1),
                  labels = c("V-Engine","Straight Engine"))
mtcars$cyl<-factor(mtcars$cyl)
ggplot(data = mtcars,aes(x=hp,y=mpg,shape=cyl,color=cyl))+
  geom_point(size=3)+
  facet_grid(am~vs)+
  labs(title="Automobile Data by Engine Type",
       x="Horsepower",y="Miles Per Gallon")
#分成了四块

#不同学位对应的薪水缺口箱线图。观察值重叠，给予一定透明度，抖动减少
#重叠，左侧地毯图指示薪水的一般扩散
data(Salaries,package = "car")
library(ggplot2)
ggplot(data = Salaries,aes(x=rank,y=salary))+
  geom_boxplot(fill="cornflowerblue",
               color="black",notch = TRUE)+
  geom_point(position = "jitter",color="blue",alpha=0.5)+
  geom_rug(sides = "1",color="black")
#箱线图结合小提琴图
data(singer,package = "lattice")
ggplot(singer,aes(x=voice.part,y=height))+
  geom_violin(fill="lightblue")+
  geom_boxplot(fill="lightgreen",width=0.2)

#用颜色分组 每一组不同颜色
data(Salaries,package = "car")
library(ggplot2)
ggplot(data = Salaries,aes(x=salary,fill=rank))+
  geom_density(alpha=0.3)

#用颜色和形状 分组
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,
                         color=rank,shape=sex))+
  geom_point(size=3)
#用学术等级和性别来可视化教授的人数
ggplot(Salaries,aes(x=rank,fill=sex))+
  geom_bar(position = "stack")+labs(title='position = "stack"')

ggplot(Salaries,aes(x=rank,fill=sex))+
  geom_bar(position = "dodge")+labs(title='position = "dodge"')

ggplot(Salaries,aes(x=rank,fill=sex))+
  geom_bar(position = "fill")+labs(title='position = "fill"',
                                   y="proportion")
#刻画 创建网格图形 将一个画面根据设定因子刻画开来,两种方法
#facet_wrap()，
data(singer,package = "lattice")
library(ggplot2)
ggplot(data = singer,aes(x=height))+
  geom_histogram()+
  facet_wrap(~voice.part,nrow = 4)
#两个刻面
ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank,
                    shape=rank))+geom_point()+facet_grid(.~sex)
#纵排列.~sex
#一个刻面
ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank,
                    shape=rank))+geom_point()
#展示Singer数据集中每个声部成员的身高分布，并利用核密度图水平排列。
#给每个声部配置不同的颜色，一个解决方案如下：
data(singer,package = "lattice")
library(ggplot2)
ggplot(data = singer,aes(x=height,fill=voice.part))+
  geom_density()+
  facet_grid(voice.part~.) #横排列voice.part~.
#添加光滑曲线
data(Salaries,package = "car")
library("ggplot2")
ggplot(Salaries,aes(x=yrs.since.phd,y=salary))+
  geom_smooth()+geom_point()

ggplot(Salaries,aes(x=yrs.since.phd,y=salary,linetype=sex,
                    shape=sex,color=sex))+
  geom_smooth(method = "lm",formula = y~poly(x,2),se=F,size=1)+
  geom_point(size=2)
#stat_smooth()
#修改ggplot2图形的外观
#坐标轴可以通过labs()函数，本节我们自定义轴标签
#scale_x_continuous() scale_x_discrete() coord_flip()
data(Salaries,package = "car")
library(ggplot2)
ggplot(Salaries,aes(x=rank,y=salary,fill=sex))+
  geom_boxplot()+
  scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),
                   labels=c("Assistant\nProfessor",
                            "Associate\nProfessor",
                            "Full\nProfessor"))+
  scale_y_continuous(breaks = c(50000,100000,150000,200000),
                     labels = c("$50k","$100k","$150k","$200k"))+
  labs(title="Salary by Rank and Sex",x="",y="")
#breaks制定刻度标记，数据集中有的量
#图例 与上一个图对比，改变图例名称个位置
ggplot(Salaries,aes(x=rank,y=salary,fill=sex))+
  geom_boxplot()+
  scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),
                   labels=c("Assistant\nProfessor",
                            "Associate\nProfessor",
                            "Full\nProfessor"))+
  scale_y_continuous(breaks = c(50000,100000,150000,200000),
                     labels = c("$50k","$100k","$150k","$200k"))+
  labs(title="Salary by Rank and Sex",x="",y="",fill="Gender")+
  theme(legend.position = c(0.1,0.8)) #0.1表示距左侧边缘10%，0.8
#表示下侧边缘80%
#标尺 使用标尺将数据空间映射到可视化空间 Scale开头的
ggplot(mtcars,aes(x=wt,y=mpg,size=disp))+
  geom_point(shape=21,color="black",fill="cornsilk")+
  labs(x="Weight",y="Miles Per Gallon",
       title="Bubb",size="Engine\nDisplacement")
#disp发动机排量标尺，可以发现汽车的行驶里程随发动机排量和重量
#的增加而降低
data(Salaries,package = "car")
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+
  scale_color_manual(values = c("orange","olivedrab","navy"))+
  geom_point(size=2)
#scale_color_manual来人为设定这三个点的颜色，否则执行默认。
#色弱怎么办？使用 scale_color_brewer（）和 scale_fill_brewer()
#来进行人为设定，fill是设定填充颜色
ggplot(data = Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+
  scale_color_brewer(palette = "Set1")+geom_point(size=2)
ggplot(data = Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+
  scale_color_brewer(palette = "Set2")+geom_point(size=2)
#palette选项有Set2,Set3,Pastell等，可以通过如下语句进行显示：
library(RColorBrewer)
display.brewer.all()
#主题theme()调整字体，背景，颜色和网格线
data(Salaries,package = "car")
library(ggplot2)
mytheme<-theme(plot.title = element_text(face = "bold.italic",
                                         size="14",color="brown"),
               axis.title = element_text(face = "bold.italic",
                                         size="10",color="brown"),
               axis.text = element_text(face = "bold",
                                        size="9",color="darkblue"),
               panel.background = element_rect(fill="green",
                                               color = "darkblue"),
               panel.grid.major.y = element_line(color = "grey",
                                                 linetype = 1),
               panel.grid.minor.y = element_line(color = "grey",
                                                 linetype = 2),
               panel.grid.major.x = element_blank(),
               legend.position = "top")
ggplot(Salaries,aes(x=rank,y=salary,fill=sex))+
  geom_boxplot()+
  labs(title="Salary by Rank and Sex",x="Rank",y="Salary")+
  mytheme
#多重图 使用grid.arrange()函数，在gridExtra包中
library(ggplot2)
data(Salaries,package="car")
p1<-ggplot(Salaries,aes(x=rank))+geom_bar()
p2<-ggplot(Salaries,aes(x=sex))+geom_bar()
p3<-ggplot(Salaries,aes(x=yrs.since.phd,y=salary))+geom_point()

library(gridExtra)
grid.arrange(p1,p2,p3,ncol=3)
#和截面图的区别：截面图的数据在一个数据集中，多重图是几个独立的图
#保存图形ggsave()
myplot<-ggplot(mtcars,aes(x=mpg))+geom_histogram()
ggsave(file="mygraph.png",plot = myplot,width = 5,height = 4)
ggsave(file="mygraph.png")
#plot选项不指定就默认前一个图形，扩展名可以为ps tex jpeg pdf tiff
#png bmp svg或wmf来指定不同的保存类型
