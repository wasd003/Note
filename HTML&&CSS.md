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
1. img标签
```
<img src="" alt="">
```
src：图片的地址  
alt:在浏览器无法载入图像时，alt文本内容告诉读者它们失去的信息。此时，浏览器将显示这个替代性的文本而不是图像。为页面上的图像都加上替换文本属性是个好习惯，这样有助于更好的显示信息，并且对于那些使用纯文本浏览器的人来说是非常有用的。  
看至第10分钟