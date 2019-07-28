基于Spring Boot改的一个WEB版本的视频播放器.<br/>

Q1：项目简介?<br/>
A1：女朋友要看JOJO的奇妙冒险 然后找了半天没找到合适的我就写了一个 不然就需要开通优酷和B站的会员 本身是腾讯视频会员 开这么多有点烦躁就写了一个.
.其实你可以用百度云盘直接以离线下载的方式直接看 别问我怎么知道的 我写完才想起来这个事情.<br/>

Q2:部署?<br/>

1.git clone https://github.com/LeeChang-GitHub/simplePlayer.git

2.project根路径下 mvn clean package

3.准备好web容器 丢进打包好的项目 创建一个play目录 把自己需要播放的视频放到play目录中

4.如果是播放电影需先建一个电影名的文件夹再放 因为现在只对剧集做了处理 你可以为电影 电视做单独做一个分类 so easy的一个事情或你可以直接修改List接口获取文件夹和文件也可以 这样再前端判断一下就可以.

Q3：实现思路?<br/>
A3：请求列表加载tomcat(这里以tomcat为例) webapp目录下的play 文件夹
遍历第一层文件夹作为剧集<br/>
![Image text](./pic/all_list.png)

请求剧集详情拿到当前剧集下的所有 文件 作为剧集的详情列表（点击过的都会A标签变色）<br/>

![Image text](./pic/details.png)

选择指定集播放（播放不支持上次看到继续看）<br/>

![Image text](./pic/play.png)

PS: 非常简单的一个实现,一个JDK一个容器就能跑得起来 适配移动端.

Thank you.
