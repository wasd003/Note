<font size="5" face="黑体"/>  

- 标签  
形如：
```
<tag>...</tag>
```
- 注释
```
<!--...-->
```
- 标题
```
<title>(在这里写网页标题)</title>
```
- 常用tag

```
<h1~h6> </h1~h6>：1到6号标题
注意一个页面只能有一个h1，过多的一级标题会被搜索引擎判断为垃圾网站

<p></p>：段落

<font></font>：字体
```
- 基本架构  

```
<!DOCTYPE html> <!--文档声明：当前网页按照Html5标准编写-->
<html>

	<head>

	</head>

	<body>

	</body>

</html>
```
- 特殊字符
```
在html5中，多个空格会被解析成一个空格，回车也会被解析为空格。如果想要换行可以使用<br/>标签进行换行，（<br/>是一个自结束标签）
水平线：<hr/>
自结束标签斜杠放在末尾<.../>
转义字符：
<:& lt;   &nbsp;&nbsp;&nbsp;&nbsp;>:& gt;(没有空格)
空格：& nbsp;
版权符号：& copy;
```
- 图片标签  
图片标签是一个自结束标签<img/>,中间可以填一些属性，用空格隔开，不要加逗号  
src:图片地址  
alt：图片描述 &nbsp;&nbsp;&nbsp;&nbsp;alt的作用：搜索引擎会根据alt对图片进行检索  
width:图片宽度（单位：px）  
height:图片高度（单位：px）  
宽度和高度如果只调整一个，另一个也会等比例调整

- 相对路径
../表示当前文件夹的上一级，使用几个../就返回几级目录

- meta
meta是一个自结束标签  
作用：  
> (1)可以用来指定网页的关键字
```
<meta name="keywords" content="Html5 JavaScript Java"/>
<!--一个content中可以包含多个关键字，搜索引擎搜索网页的时候也会根据meta中的keywords的content进行搜索-->
```
> (2)可以用来指定网页的描述
```
<meta name="description" content="this is a decription"/>
<!--搜索引擎同样会检索网页的描述-->
```
>(3)可以进行网页的跳转
```
<meta http-equiv="refresh" content="5;url=https://www.baidu.com/ "/>
```

- 内联框架
```
<iframe src="" width="" height=""></iframe>
```
引入外部页面

- 超链接
```
<a href="http:www.baidu.com">我是一个超链接 </a>
如果href设置为#，则点击超链接后会回到顶部
```
- center
```
<center> </center>
将其内部的文字居中显示
```
****
<center><strong>CSS</strong></center>
一.设置style的方式
> (1)设置内联style：在标签内部设置属性
```
<p style="color:red;font-size:40px;">文本</p>
```
> (2)在head中设置style标签
```
<style type="text/css">
			p/*选择器*/
			{/*声明块*/
				color:red;
				font-size:40px;
			}
		</style>
```
> （3）引入外部样式表
```
<link rel="stylesheet" type="text/css" href=""/>
<!--href中填写外部css文件的路径，可以是相对路径-->
```

> 注释：/**/

二.块元素和内联元素
```
<div>文本</div> 独占一行
div是典型的块元素，用于页面布局  
```
```
<span>文本</span> 只占自身大小的空间
span是内联元素
```
三.选择器
(1)元素选择器
```
p
{
	color:red;
}
```
(2)id选择器
>通过给某一句话添加唯一id，然后查找id选中该句话
>id必须是唯一的


```
#abc/*通过#选中id*/
{
	color:red;
}

<p id="abc">测试</p>
```
(3)class选择器
>id只能一句话用，但是class可以多句话共用
>同时一个元素也可以拥有多个class，使用空格隔开 多类样式声明

```
.abc/*通过.选中class*/
{
	color:red;
}
<p class="abc">测试</p>
<p class="abc cde">另一个测试 </p>
```
> 一句话可以有多class，中间用空格隔开

(4)并集选择器：多种选择器采用同一个样式，采用逗号隔开即可

```
#p1,.p2,p
{
	color:red;
}
```
(5)交集选择器，对同时满足多个条件的元素进行操作

```
#p1.p2p/*不用逗号隔开即可*/
{
color:red;
}
```

父元素：直接包含子元素的元素
子元素：直接被父元素包含的元素
祖先元素：直接或间接包含后代元素的元素
后代元素：直接或间接被祖先元素包含的元素
兄弟元素：拥有相同父元素的元素
(6)后代元素选择器
>作用：选中指定元素的后代元素
>语法：祖先元素 后代元素{}

```
div span
{
	color:green;/*选择div中的span*/
}
```
>如果指定找子元素加上>即可

```
div>span
{
	color:green;/*选择div中的span*/
}
```


四.伪类选择器
伪类专门用来表示元素的一种特殊的状态
*伪类选择器*
```
a:link /*未访问过的链接*/
a:visited/*访问过的链接*/
a:hover/*鼠标划过的链接*/
a:active/*鼠标点击时的链接*/
```

## first-child&&first-of-type伪类选择器
### 四种情况  
- article :在article中所有的后代选择  
- article>:在article的下一级中选择  
- article h1:在article后代中的h1中选择
- article>h1:article的下一级中的h1选择  
>注意article可能代表着一个复杂的祖先-后代关系，例如：h1 h2 h3  
### 对应的两种伪类  
>first-child:所有的元素中第一个  
>first-of-type：指定类型中的第一个
### 示例:
```
<style>
article :first-child{
background-color: red;
}
    </style>
<body>
<main>
       <article>
           <h1>111111</h1>
           <aside>
               <h2>2222222</h2>
           </aside>
           <h2>33333333</h2>
       </article>
   </main>  
</body>
```
>效果：1111和22222都被选中  

```
<style>
article>:first-child{
background-color: red;
}
    </style>
<body>
<main>
       <article>
           <h1>111111</h1>
           <aside>
               <h2>2222222</h2>
           </aside>
           <h2>33333333</h2>
       </article>
   </main>
</body>  
```
>效果：只有111111被选中，因为限定了只能在下一级中选择  
```
article h1:first-child{
background-color: red;
}
    </style>
</head>
<body>
   <main>
       <article>
           <h1>111111</h1>
           <aside>
               <h2>2222222</h2>
           </aside>
           <h2>33333333</h2>
       </article>
   </main>
</body>
```
>效果：选择article后代中即是h1也是first-child的，只选中了11111   

五.属性选择器
> title属性：可以为任何标签打上title属性，title属性会成为该元素的提示文字，当鼠标划过该元素时显示

属性选择器的语法：
>(1)[属性]：选择有该属性的标签，例如：p[title]
>(2)[属性名=“属性值”]：选择属性为属性值的标签,例如：p[title="hello"]
>(3)[属性名^="x"]：选择title属性值以x开头的属性
>(4)[属性名$="x"]:选择title属性值以x结尾的属性
>(5)[属性名*="x"]:通配x（字串而非子序列）

六.文本标签及样式

>斜体：
```
<em> </em>
```
黑体
```
<strong></strong>
```
大/小一号的字体
```
<big></big>
<small></small>
```
参考的内容：比如书目
```
表现出来的效果就是斜体
<cite></cite>
```
引用的内容：比如名人名言
```
表现出来的效果就是加了引号
<q></q>
```
上标:
```
<sup></sup>
```
下标:
```
<sub></sub>
```
删除：
```
<del></del>
```
插入：
```
表现出的效果就是下划线
<ins></ins>
```
保存格式：
```
会按照预先的格式显示，即：不会忽略空格换行符等,类似于代码块
<pre></pre>
```
无序列表：
```
<ul>
	<li>  </li>
	<li>  </li>
<ul>
ul 具有list-style-type属性：disc（实心圆点），square（实心方块），circle（空心圆圈）
每一个<li>就是一个点
```
有序列表
```
<ol>
	<li>  </li>
	<li>  </li>
<ol>
```
定义列表
```
<dl>
	<dt>名词</dt>
	<dd>名词的定义</dd>
</dl>
```

七.颜色

使用RGB值表示不同的颜色
<dl>
<dt style="font-size:30px ">RGB:</dt>
<dd>Red；Green；Blue 三原色。通过这三种颜色不同的浓度来表示不同的颜色</dd>
</dl>
使用方法：
```
color:rgb(红色浓度，绿色浓度，蓝色浓度);
//浓度的两种表示方法:
(1)0-255
(2)0%-100%
```
八.字体
<ul style="list-style-type:circle;">
<li>font-family:字体</li>该样式可以同时指定多个字体，当采用多个字体时，浏览器会优先采用放在前面的字体
<li>font-style:字体样式</li>italic：斜体
<li>font-weight：字体粗细</li>bold：加粗显示
</ul>

九.行高
<ul>
<li>line-height 单位是px 如果直接写一个数字表示相对于字体大小的倍数</li>
<li>行间距：行高-字体大小</li>
</ul>

十.box model
<ul>
<li>**设置边框**</li><hr/>border-width:边框的宽度<ul><li>如果指定四个值表示边框的上，右，下，左的宽度（顺时针）。下面有关边框的样式设置也遵循这个规则
border-width:10px,20px,30px,40px</li></ul>
border-color:边框颜色
border-style:边框样式<ul><li>可选值：solid:实线；dotted：点状；dashed：虚线；double：双实线</li></ul>
三个属性缺一不可
<li>**边框的另一种设置方式**</li><hr/>	border:red solid 10px 表示四条边设置为红色实线，宽度为10px
border-left:单独设置左边框，与之类似的还有right，top，bottom
<li>**内边距**</li><hr/>内边距指的是盒子的内容区与盒子边框之间的距离
padding-top
padding-left
padding-right
padding-bottom
padding：直接设置四个边的内边距大小，如果写四个表示上右下左
**注意：**因为内容区的大小已经设置好了，所以如果加上内边距，整个盒子的大小会发生变化
盒子的大小由：内容区，内边距，边框共同决定
<li>**外边距**</li><hr/>margin-top
margin-left
margin-right
margin-bottom
margin还可以设置为auto，通常设置给左右外边距，如果只指定左/右外边距，会把左/右外边距设置为最大，如果都设置为auto，会把盒子居中。上下方向的外边距如果设置为auto，会把外边距变为0
如果设置margin:0 auto 表示把页面居中
<li>**垂直外边距的重叠**</li><hr/>（1）上下相邻的两个盒子，上盒子有下边距a，下盒子有上边距b，则两个盒子上下相距不是a+b而是max(a,b)
（2）div嵌套的盒子，如果只想将子box的垂直方向位置向下移动，不能直接设置子box的top外边距，因为这会使得父box也向下移动。解决方案是：设置父box的内边距，将子box“挤”下来(能够挤下来的原因是子元素默认是位于父元素的内容区的)，但是这样做的问题是会改变父box的总的垂直方向的高度，再修正父box的垂直高度即可。[教程](https://www.bilibili.com/video/av21557880/?p=52)
<li>**清除浏览器的默认样式**<hr/>p，div等标签在浏览器中是有默认的内外边距的。想要去掉他们的方法是：使用*选中所有标签，将样式中的padding和margin设置为0</li><li><strong>内联元素的box model</strong><hr/>内联元素：不独占一行的元素，比如span，比如超链接。与块元素（比如div）相对。内联元素无法设置height和width。如果要想设置内联元素的height和width，可以将其变成块元素。即设置display：block
</li><li><strong>overflow</strong><hr/>子元素默认是在父元素的内容区现实的，如果子元素的尺寸超过了父元素的尺寸，会造成溢出。overflow属性可以对于溢出的内容进行可见性的设置。hidden:隐藏，visible:显示（默认）,scroll(滚动条的方式显示，不论是否溢出都会添加滚动条)，auto（根据是否溢出，选择性添加滚动条）
</li>
</ul>

十一.浮动  
当为一个元素设置了浮动以后，该元素会尽量向页面的左上(left)或者右上漂浮(right)，直到遇到父元素的边框或者其他浮动元素。<strong>如果浮动元素上面是一个没有浮动的块元素，那么它不会超过该块元素</strong>
在文档流中块元素默认独占一行，宽度为父元素的宽度。如果设置了浮动，元素就会脱离文档流。造成的效果是：
（1）如果没有设置宽度，那么宽度默认是0  
（2）其他块元素会上浮，因为之前把他们挤下来的块元素不见了。  

十二.高度塌陷问题  
如果父div不设置高度，那么它的高度由子div撑起。但是如果设置了子div是浮动的，由于它脱离了文档流，就无法撑起父div，导致高度塌陷。一种解决办法是设置父div的高度，但是这样造成的问题是如果子div的高度改变，那么为了适应还需要相应的去改变父div的高度。我们希望父div的高度是自动的，即由子div撑起的。
<a href="https://sm.ms/image/m1tM6gu74KTpfZI" target="_blank"><img src="https://i.loli.net/2019/08/06/m1tM6gu74KTpfZI.png" ></a>
<strong>解决方案一：</strong>页面中每一个元素都有一个隐含的属性叫做BFC，该属性可以设置打开或者关闭（默认关闭），开启BFC的父元素可以包含浮动的子元素。
开启BFC的方法：
**将overflow设置为hidden**（有副作用）



**解决方案二：**可以直接在高度塌陷的父元素的最后，添加一个空白的块元素，由于这个块元素并没有浮动，所以可以撑起父元素。然后对该块元素清除浮动（clear）
>clear:left 清除向左浮动的元素对当前元素的影响
>clear:right 清除向右浮动的元素对当前元素的影响
>clear:both 清除两侧浮动的元素中对当前元素影响较大的那一个的影响

十三.导航条练习
```
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<style type="text/css">
			*{
				margin:0;/*清除默认样式*/
				padding:0;
			}
			.nav{
				list-style:none;/*去除无序列表的点*/
				overflow:hidden;/*解决高度塌陷*/
				margin:50px auto;/*居中*/
				width:1000px;
				background-color: skyblue;
			}
			.nav li{
				float :left;/*把每个li设置为浮动，使他们在一行*/
				width:25%;/*设置每个li的宽度*/
				text-align: center;/*设置超链接居中*/
				
			}
			.nav a{
				display:block;
				width:100%/*设置可点的区域宽度*/
				text-align: center;/*设置超链接描述居中*/
				padding:5px 0;
				text-decoration: none;/*去除下划线*/
				color:white;/*字体颜色*/
				font-weight: bold;/*字体加粗*/
			}
			.nav a:hover{
				background-color: red;
			}
		</style>
		
	</head>
	<body>
		<ul class="nav">
			<li><a href="#">首页</a></li>
			<li><a href="#">新闻</a></li>
			<li><a href="#">联系</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</body>
</html>

```