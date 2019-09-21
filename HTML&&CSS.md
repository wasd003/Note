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