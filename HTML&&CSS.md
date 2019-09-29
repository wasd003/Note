<font size="5" face="黑体"/>
<center><h1>HTML</h1></center>  
<center><h2>第四课 如何做表格</h2></center>

```
<table>
        <tr>
            <td> 一个单元</td>
            <td> 一个单元</td>
            <td> 一个单元</td>
        </tr>
        <tr>
            <td> 一个单元</td>
            <td> 一个单元</td>
            <td> 一个单元</td>
        </tr>
        <tr>
            <td> 一个单元</td>
            <td> 一个单元</td>
            <td> 一个单元</td>
        </tr>
</table> 
```
每一个tr表示一行，每一个td顺序排在当前行  
表格保证自动对齐  
> 表头与表尾：将tr->thead/tfoot,td->th。默认表头表尾加粗显示  
```
<table>
        <thead>
            <th> 一个单元</th>
            <th> 一个单元</th>
            <th> 一个单元</th>
        </thead>
        <tr>    </tr>
        <tr>
            <td> 一个单元</td>
            <td> 一个单元</td>
            <td> 一个单元</td>
        </tr>
        <tfoot>
            <th> 一个单元</th>
            <th> 一个单元</th>
            <th> 一个单元</th>
        </tfoot>
    </table>
```
<center><h2>第五课 如何做列表</h2></center>

ul是无序的，ol是有序的  
```
<!--无序列表-->
<ul>
    <li>第一点</li>
    <li>第二点</li>
    <li>第三点</li>
</ul>
<!--有序列表-->
<ol>
    <li>第一点</li>
    <li>第二点</li>
    <li>第三点</li>
</ol>
```  
<center><h2>第六课 丰富我们的标签库</h2></center>  

###1. img标签
```
<img src="" alt="">
```
src：图片的地址  
alt:在浏览器无法载入图像时，alt文本内容告诉读者它们失去的信息。此时，浏览器将显示这个替代性的文本而不是图像。为页面上的图像都加上替换文本属性是个好习惯，这样有助于更好的显示信息，并且对于那些使用纯文本浏览器的人来说是非常有用的。  

###2. button标签  
也是一个按钮，它与由input创建出来的按钮不同之处在于，buttion的两个标签之间可以插入丰富的内容，比如文本或者图片  

###3. Input标签  
> 四种常用的input  
- **Text Fields**
当用户要在表单中键入字母、数字等内容时，就会用到文本域。
```
<form>
First name: <input type="text" name="firstname"><br>
Last name: <input type="text" name="lastname">
</form>
```  
**name 属性用于在 JavaScript 中引用元素，或者在表单提交后引用表单数据**  
- **Password**  

```
<form>
Password: <input type="password" name="passwords">
</form>
```

- **Checkboxes**
```
<form>
<input type="checkbox" name="vehicle" >I have a bike<br>
<input type="checkbox" name="vehicle" >I have a car
</form>
```
- **submit**  

当用户单击确认按钮时，表单的内容会被传送到另一个文件。表单的动作属性定义了目的文件的文件名。由动作属性定义的这个文件通常会对接收到的输入数据进行相关的处理。:
```
<form name="input" action="html_form_action.php" method="get">
Username: <input type="text" name="user">
<input type="submit" value="提交">
</form>
```
**对于submit，value定义按钮上的显示文本**    
- **单选框**  
```
<input type="radio"/>
```
这句表现在页面上就是一个可选择的小圆点  
为多个选项添加共同的name属性，可以使得一次只能在多个选项中选择一个。  
 ```
男<input type="radio" name="gender"/>
女<input type="radio" name="gender"/>
 ```
###4. textarea标签  
```
<textarea rows="" cols="">
你想要填入文本框的内容
</textarea>
```

<center><h2>第七课 制作百度首页</h2></center>  

###**收获**：  
1. 使用子元素选择器的时候逐级向下选择，每一级之间需要使用空格隔开  
```
.top .right   正确  
.top.right 错误
```  
2. 如果想要查看网页中某一元素尺寸大小可以右键-检查-在网页源代码中选中想要查看的元素-网页上会自动浮现该元素的尺寸大小  
3. 边界线样式的常用写法：solid 1px red  
4. 文本居中的方法：text-align:center
5. button通常的使用:(1)background-color:按钮背景色 (2)color：按钮文字颜色 (3)border:none 通常把外边界线去掉  
6. vertical-align:该属性定义行内元素的基线相对于该元素所在行的基线的垂直对齐方式。**具体应用**：如果想把一行的元素对齐（比如百度页面的input和button），就将他们的Vertical-align设置为相同  
7. 同一行的元素即便是内联的也默认会有一个字的间距，如果想紧挨着，就把font-size设置为0(比如本例中的.search)  
源代码：  
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        a{
            color:#555;
            font-size:14px;
        }
        .top{
            height:33px;
            border-bottom:solid 1px #ebebeb;
        }
        .top .left{
            float:left;
        }
        .top .right{
            float:right;
        }
        .top span{
            color:#555;
            font-size:14px;
        }
        .main .logo{
            width:270px;
            height:129px;
            margin-top:100px;
        }
        .logo-container,.search{
            text-align: center;
        }
       
        .footer .footer-top{
            margin-top:300px;
            text-align:center;
        }
        .footer .footer-buttom{
            text-align:center;
        }
        input {
            height:40px;
            width:650px;
            border:solid 1px #b8b8b8;
            vertical-align: middle;
        }
        button{
            height:45px;
            width:100px;
            background-color:#38f;
            color:white;
            border:none;
            font-size:18px;
            vertical-align: middle;
        }
        .search{
            font-size:0px;
        }
    </style>
</head>
<body>
    <div class="top">
        <div class="left">
            <span>上海|</span>
            <a href="#">换肤</a>
            <a href="#">消息</a>
            <a href="#">频道</a>
        </div>
        <div class="right">
            <a href="#">新闻</a>
            <a href="#">hao123</a>
            <a href="#">地图</a>
            <a href="#">贴吧</a>
            <a href="#">视频</a>
            <a href="#">学术</a>
        </div>  
    </div>
    <div class="main">
        <div class="logo-container">
                <img src="https://www.baidu.com/img/bd_logo1.png" alt="百度logo" class="logo">
        </div>
        <div class="search">
            <input type="text">
            <button>百度一下</button>
        </div>
            
    </div>
    <div class="footer">
        <div class="footer-top">
            <a href="#">设为首页</a>
            <span>2019 baidu</span>
            <a href="#">使用百度前必读</a>
            <a href="#">意见反馈</a>
        </div>
        <div class="footer-buttom">
                京公网安备11000002000001号
        </div>
    </div>
  
</body>
</html>
```  

<center><h2>第八课 初步认识CSS</h2></center>

引入外部css文件：  
```
<link rel="stylesheet" type="text/css" href="css文件名称">
```   
<center><h2>第九课 认识表单</h2></center>

form：表单，用户在表单中填写数据然后提交到服务器上。表单中可以包含input元素比如文本字段 复选框 单选框 提交按钮    
**表单是块级元素**
label：把自己和其他元素关联起来，这样点击label就相当于点击了关联元素[示例](https://www.jianshu.com/p/59b63d07ab04)  
**关联的方式就是把要关联的元素嵌套进label中**  

<center><h2>第十一课 Table进阶</h2></center>


### 1. 完整的table结构  
包含thead，tbody，tfoot。thead和tfoot中有tr，tr中有th；tbody中有tr，tr中有td。  

### 2.居中的写法  
对于标签元素使用margin：0 auto居中；对于文字内容使用text-align:center居中。  
### 3.选择器选中同一元素  
当多个选择器选中了同一元素，并对相同的样式声明了不同的属性，听最下面那个选择器的。  
```
.div{
	color:red;
}
.div{
	color:blue;
}
<div>测试</div>
```
结果是蓝色。  

### 4. 表格中跨多格元素的写法  
设置td元素的colspan属性  
- 横跨
```
 <td colspan="5">该元素会横跨五格</td>
```  
- 竖跨  
```
 <td rowspan="5">该元素会横跨五格</td>
```  
### 5.把表格中多条竖线合并成一条  
```
 border-collapse:collapse;
```
### 5.伪类选择器  
- nth-child  
```
div:nth-child(1)  
选中div元素下第一个子元素
div:nth-child(even)
选中div元素下排名为偶数的子元素 
```
注意：**排名是从1开始算起的**  
- hover  
鼠标滑过时选中  

##项目示例--课程表  
```
<style>
        table,tr,td,th{
            border:solid 1px blueviolet;
            width:600px;
            border-collapse:collapse;
            margin:0 auto;
        }
        td{
            text-align: center;
        }
       td:hover{
           background-color:yellowgreen;
           color:white;
       }
        li{
            text-align:left;
        }
        tr:nth-child(even)
        {
            background-color: blueviolet;
            color:white;
        }
    }
    </style>
    
</head>
<body>
        <table>
           <thead>
                <tr>
                        <th></th>
                        <th>周一</th>
                        <th>周二</th>
                        <th>周三</th>
                        <th>周四</th>
                        <th>周五</th>
                    </tr>
           </thead>
           <tbody>
                <tr>
                        <td rowspan="3">上午</td>
                        <td>语文</td>
                        <td>英语</td>
                        <td>数学</td>
                        <td>体育</td>
                        <td>生物</td>
                </tr>
                <tr>
                        <td>物理</td>
                        <td>化学</td>
                        <td>生物</td>
                        <td>数学</td>
                        <td>语文</td>
                </tr>
                <tr>
                        <td>语文</td>
                        <td>物理</td>
                        <td>物理</td>
                        <td>体育</td>
                        <td>数学</td>
                </tr>
                <tr>
                    <td colspan="6">午休</td>
                </tr>
                <tr>
                        <td rowspan="4">下午</td>
                        <td>物理</td>
                        <td>化学</td>
                        <td>生物</td>
                        <td>数学</td>
                        <td>语文</td>
                </tr>
                <tr>
                        <td>物理</td>
                        <td>化学</td>
                        <td>生物</td>
                        <td>数学</td>
                        <td>语文</td>
                </tr>
                <tr>
                        <td>物理</td>
                        <td>化学</td>
                        <td>生物</td>
                        <td>数学</td>
                        <td>语文</td>
                </tr>
                <tr>
                    <td colspan="5">班会</td>
                </tr>
           </tbody>
           <tfoot>
            <tr>
                <th>备注</th>
                <th colspan="5">
                    <ol>
                        <li>第一点</li>
                        <li>第二点</li>
                        <li>第三点</li>
                    </ol>
                </th>
            </tr>
           </tfoot>
        </table>
</body>
```

<center><h2>第十二课 表单进阶</h2></center>  


### 下拉列表 
```
<select name="" id="">
        <option>选择一</option>
        <option>选择二</option>
</select>
```  
### 给边框加圆角  
```
border-radius: 5px;
```  
### 属性选择器
例子：  
```
input[type="text"]
```
选择input标签中type属性是text的标签  
### display样式
block：类似div,不同元素在不同行  
inline：类似span，不同元素在同一行并且紧挨着  
inline-block:不同元素在同一行但是之间有间隔  
### 常用技巧  
先给各个元素加上border，便于识别每一个区域，写好以后再去掉。  
### 项目示例-调查问卷  
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        div{
            margin:0 auto;
            width: 50%;
        }
        span{
            width:150px;
            display: inline-block;
            text-align: right;
        }
        form{
            border:dashed 3px blueviolet;
            border-radius: 5px;
            margin:20px;
            padding:20px;
        }
        h1{
            text-align: center;
            color:blueviolet;
        }
        .SubMit{
            color:white;
            background-color: blueviolet;
            width:100px;
            height:30px;
            border-radius: 10px;
        }
        textarea{
            width:200px;
        }
        input[type="text"]
        {
            width:200px;
        }
    </style>
</head>
<body>
    <form action="#">
        <h1>意见反馈</h1>
        <div>
            <span>姓名:</span>
            <input type="text">
        </div>
        <div>
            <span>选择您的性别:</span>
            <input type="radio" name="gender">男
            <input type="radio" name="gender">女
        </div>
        <div>
            <span>选择你的爱好:</span>
            <input type="checkbox">看书
            <input type="checkbox">跑步
            <input type="checkbox">音乐
        </div>
        <div>
            <span>学历程度:</span>
            <select name="" id="">
                <option value="">大专</option>
                <option value="">本科</option>
                <option value="">研究生</option>
            </select>
        </div>
        <div>
            <span>反馈意见:</span>
            <textarea name="" id="" cols="30" rows="10"></textarea>
        </div>
        <div>
            <input type="submit" value="提交" class="SubMit">
        </div>

    </form>
</body>
</html>
```

<center><h2>第十三课 CSS进阶</h2></center>

###CSS样式的优先级  
**默认样式**<**标签样式**(由标签选择器选择到的样式)<**类样式**(由类选择器选择到的样式)<**ID样式**(由ID选择器选择到的样式)<**!important**(添加!important)  

<center><h2>第十四课 排版相关的样式</h2></center>  

### Position属性  
用于定位，可以设置绝对(absoute,相对于整个页面)和相对(relative,相对于其原始正常的位置)  
[relative示例](https://www.w3school.com.cn/tiy/t.asp?f=csse_position_relative)
[absolute示例之使用像素](https://www.w3school.com.cn/tiy/t.asp?f=csse_position_absolute)
[absolute示例之使用百分比](https://www.w3school.com.cn/tiy/t.asp?f=csse_position_top_percent)  
**概念精析**：
1. **relative**是相对它**自身原来的位置**进行偏移而**absolute**是相对于它的**父元素**，如果父元素没有position属性，会继续向上找(**事件冒泡**)。  
2. 偏移量为百分比：  
**translate(x,y)**括号里的值为百分数时，会以目前元素**本身的宽高**做参考，比如，目前元素本身的宽为100px，高为50px， 那填(50%,50%)，则表示就是向右移动50px、向下移动25px。  
**top,left**等是基于**父元素**的。
  
**代码分析**:使子元素在父元素中居中显示的方法：**先相对父元素x，y方向偏离50%,再拉回相对于自身的50%**
```
<head>
<style>
        .main{
            background-color: #D7D8DD;
            width:1600px;
            height:1200px;
            position: relative;/*给父元素设置position属性，使子元素参照它*/
        }
        .page{
            width:1400px;
            height:790px;
            background-color: #F5F4FA;
            border-radius: 50px;
            left:50%;/*相对于父元素x，y方向各偏离50%*/
            top:50%;
            position:absolute;
            transform: translate(-50%,-50%);/*再拉回自身长和宽的50%*/
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="page">

        </div>
    </div>
</body>
```
看至18min  
<center><h2>附加课 grid布局</h2></center>  

### 一.基本概念  
1. 容器和项目  
**容器**：采用网格布局的区域，称为"容器"（container）  
**项目**：容器内部采用网格定位的子元素，称为"项目"（item）**注意：项目只能是容器的顶层子元素，不包含项目的子元素**。  
```
<div>
  <div><p>1</p></div>
  <div><p>2</p></div>
  <div><p>3</p></div>
</div>
```  
上面代码中，最外层的div元素就是容器，内层的三个div元素就是项目,p元素不是项目。  
2. 网格线  
正常情况下，n行有n + 1根水平网格线，m列有m + 1根垂直网格线，比如三行就有四根水平网格线。  
![](https://www.wangbase.com/blogimg/asset/201903/1_bg2019032503.png)  
上图是一个 4 x 4 的网格，共有5根水平网格线和5根垂直网格线。  
### 二.容器属性  
####1. display属性  
display:grid将指定一个容器采用网格布局。默认网格布局的容器都是块级元素，但是可以指定行内元素。  
display:inline-grid.  
**注意，设为网格布局以后，容器子元素（项目）的float、display: inline-block、display: table-cell、vertical-align等设置都将失效**。 
####2. grid-template-columns/grid-template-rows属性  
grid-template-columns属性定义每一列的列宽，grid-template-rows属性定义每一行的行高。  
例如：
```
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
}
```  
上面的代码定义了一个3×3，行高和列宽都是100px的网格。  

也可以使用百分比指定  
```
.container {
  display: grid;
  grid-template-columns: 33.33% 33.33% 33.33%;
  grid-template-rows: 33.33% 33.33% 33.33%;
}
```  
- repeat 
可以使用repeat改写上述代码  
```
.container {
  display: grid;
  grid-template-columns: repeat(3, 33.33%);
  grid-template-rows: repeat(3, 33.33%);
}
```  
- auto-fill  
适用于：**容器的大小不确定，但是项目的大小确定的情况**。让项目尽可能放，直到不能放为止。  
```
.container {
  display: grid;
  grid-template-columns: repeat(auto-fill, 100px);
}
```
上面代码表示每列宽度100px，然后自动填充，直到容器不能放置更多的列  
- fr  
**适用于容器大小确定，项目大小只知道比例关系。虽然也可以通过比例算出每一个Item的大小，但是使用fr关键字就不用算了**
如果两列的宽度分别为1fr和2fr，就表示后者是前者的两倍。  
```
.container {
  display: grid;
  grid-template-columns: 1fr 1fr;
}
```
上面代码表示两个相同宽度的列。

fr可以与绝对长度的单位结合使用，这时会非常方便。

```
.container {
  display: grid;
  grid-template-columns: 150px 1fr 2fr;
}
```
上面代码表示，第一列的宽度为150像素，第二列的宽度是第三列的一半。1,2,3列共同填满整个容器
- 网格线名称  
grid-template-columns属性和grid-template-rows属性里面，还可以使用方括号，指定每一根网格线的名字，方便以后的引用。  
示例：
```
.container {
  display: grid;
  grid-template-columns: [c1] 100px [c2] 100px [c3] auto [c4];
  grid-template-rows: [r1] 100px [r2] 100px [r3] auto [r4];
}
```  
- 布局实例  
grid-template-columns属性对于网页布局非常有用。两栏式布局只需要一行代码。
```
.wrapper {
  display: grid;
  grid-template-columns: 70% 30%;
}
```
传统的十二网格布局，写起来也很容易。
```
grid-template-columns: repeat(12, 1fr);
```  
#### 3. grid-row-gap 属性，grid-column-gap 属性，grid-gap 属性  
grid-row-gap和grid-colume-gap分别设置行列间距  
```
.container {
  grid-row-gap: 20px;
  grid-column-gap: 20px;
}
```  
grid-gap是它们的结合体，上述代码也可以这样改写  
```
.container {
  grid-gap: 20px 20px;
}
```  
>根据最新标准，上面三个属性名的grid-前缀已经删除，grid-column-gap和grid-row-gap写成column-gap和row-gap，grid-gap写成gap。  
#### 4.grid-template-areas 属性  
用来给区域命名  
```
.container{
display: grid;
grid-template-columns: 100px 100px 100px;
grid-template-rows: 100px 100px 100px;
grid-template-areas: "header header header"
                     "main main sidebar"
                     "footer footer footer";
}
```
上述代码定义了一个九宫格，名称如areas所示  
>注意，区域的命名会影响到网格线。每个区域的起始网格线，会自动命名为区域名-start，终止网格线自动命名为区域名-end。
>比如，区域名为header，则起始位置的水平网格线和垂直网格线叫做header-start，终止位置的水平网格线和垂直网格线叫做header-end。  
#### 5.grid-auto-flow属性  
划分网格以后，容器的子元素会按照顺序，自动放置在每一个网格。默认的放置顺序是"先行后列"，即先填满第一行，再开始放入第二行，即下图数字的顺序。  
![](https://www.wangbase.com/blogimg/asset/201903/bg2019032506.png)  
这个顺序由grid-auto-flow属性决定，默认值是row，即"先行后列"。也可以将它设成column，变成"先列后行"。

```
grid-auto-flow: column;
```  
![](https://www.wangbase.com/blogimg/asset/201903/bg2019032512.png)  
row dense，表示"先行后列"，并且尽可能紧密填满，尽量不出现空格。column dense，表示"先列后行"，并且尽量填满空格。  
#### 6.justify-items 属性，align-items 属性，place-items 属性  
justify-items属性设置单元格**内容**的水平位置（靠左，居中，靠右），align-items属性设置单元格内容的垂直位置（靠上，居中，靠下）。  
这两个属性的可选值完全相同  
- center:居中  
- start：靠左/上  
- end：靠右/下  
- stretch：拉伸，占满单元格的整个宽度（默认值）  
place-items是他们两个的合并简写形式  
#### 7. justify-content,align-content,place-content属性  
这三个属性是设置内容区在整个容器内位置的属性  
- center 居中
- start 靠左/上  
- end 靠右/下  
- stretch 占据整个容器  
- space-around  
![](https://www.wangbase.com/blogimg/asset/201903/bg2019032522.png)  
- space-between  
![](https://www.wangbase.com/blogimg/asset/201903/bg2019032523.png)  
- space-evenly  
![](https://www.wangbase.com/blogimg/asset/201903/bg2019032524.png)  
#### 8.grid-auto-columns,grid-auto-rows属性  
**grid-auto-columns**属性和**grid-auto-rows**属性用来设置浏览器自动创建的多余网格的列宽和行高。它们的写法与grid-template-columns和    grid-template-rows完全相同。如果不指定这两个属性，浏览器完全根据单元格内容的大小，决定新增网格的列宽和行高。  

### 三.项目属性  
####  1. grid-column-start 属性，grid-column-end 属性，grid-row-start 属性，grid-row-end 属性  

- grid-column-start属性：左边框所在的垂直网格线
- grid-column-end属性：右边框所在的垂直网格线
- grid-row-start属性：上边框所在的水平网格线
- grid-row-end属性：下边框所在的水平网格线  
> 这四个属性的值，除了指定为第几个网格线，还可以指定为网格线的名字。  

#### 2. grid-column 属性，grid-row 属性  
上面属性的简写形式  
```
.item-1 {
  grid-column: 1 / 3;
  grid-row: 1 / 2;
}
/* 等同于 */
.item-1 {
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 2;
}
```  
#### 3. justify-self 属性，align-self 属性，place-self 属性  
**justify-self**属性设置单元格内容的水平位置（左中右），跟justify-items属性的用法完全一致，但只作用于单个项目。  
**align-self**属性设置单元格内容的垂直位置（上中下），跟align-items属性的用法完全一致，也是只作用于单个项目。  
### 四.与选择器配合  
html文件
```
<div class="container">
  <div class="item item-1">1</div>
  <div class="item item-2">2</div>
  <div class="item item-3">3</div>
  <div class="item item-4">4</div>
  <div class="item item-5">5</div>
  <div class="item item-6">6</div>
  <div class="item item-7">7</div>
  <div class="item item-8">8</div>
  <div class="item item-9">9</div>
</div>
```  
css文件
```
.container {
  /*对容器的属性进行规定*/
  display: grid;
  grid-template-columns: 1fr 1fr;
}

.item {
    /*对所有item的属性进行规定*/
  font-size: 4em;
  text-align: center;
  border: 1px solid #e5e4e9;
}

.item-1 {
    /*对单个item进行规定*/
  background-color: #ef342a;
}

.item-2 {
  background-color: #f68f26;
}

.item-3 {
  background-color: #4ba946;
}

.item-4 {
  background-color: #0376c2;
}

.item-5 {
  background-color: #c077af;
}

.item-6 {
  background-color: #f8d29d;
}

.item-7 {
  background-color: #b5a87f;
}

.item-8 {
  background-color: #d0e4a9;
}

.item-9 {
  background-color: #4dc7ec;
}
```
