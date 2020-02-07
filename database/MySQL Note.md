# 第1章 了解SQL  
## 1.1 数据库基础  
数据库：保存有组织的数据的容器，注意区分DB和DBMS  
表：某种特定类型数据的结构化清单，比如顾客清单，产品目录等。数据库中的表都有一个唯一的名字  
模式(schema):关于数据库和表的布局及结构的信息  
列：表中的一个字段，所有的表都是由一个或多个列组成的  
行：表中的一个记录  
主键(primary key)：能够唯一标识一行的列(或者一组列)。一个好的习惯是**总是定义主键**  
>主键列不允许是null值，也不应选择可能会更改的z值作为主键    

## 1.2 什么是SQL  
SQL: Structed Query Language 结构化查询语言  
# 第3章 使用MySQL  
## 3.1 选择数据库  
可以使用use关键字选择数据库  
```
IN:use crashcourse;
OUT:Database changes
```
## 3.2 了解数据库和表  
show命令  
```
show databases; 显示所有数据库  
show tables; 显示所有表  
show columns from tableName  
```   
show columns 要求给出一个表名，它对每个字段返回一行，行中包含字段名，数据类型，是否允许NULL，键信息，默认值，其他信息(如auto_increment)  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200120225125.png)  
可以使用describe tableName代替show columns from tableName  
# 第4章 检索数据  
## 4.1 检索单个列  
select xx from tableName;  
xx为要检索的列名  
## 4.2 检索多个列  
select xx,xx,xx from tableName;  
xx为要检索的列名  
## 4.3 检索所有列  
可以使用通配符\*表示检索所有列。一般，最好不要使用\*通配符，因为这样会降低检索的性能  
## 4.4 去重  
如果不想要每个值每次都出现可以使用distinct关键字  
selct distinct id from products   告诉MySQL只返回id不同的行。
例如：1 1 2 2 3 3 3 返回1 2 3  
## 4.5 限制结果  
使用limit子句可以限制检索范围。limit x,y 表示从x行开始，共取y行。  
注意MySQL中从第0行开始。  
## 4.6 使用完全限定的表名  
所谓完全限定的表名指的是从数据库开始，逐级向下说明  
databaseName.tableName.colName  
# 第5章 排序检索数据  
## 5.1 排序数据  
给数据排序使用order by 子句，如果想要逆序排序添加desc关键字  
select productName from products order by productName;  
## 5.2 按多个列排序  
select xx,xx,xx from tableName order by xx1,xx2    
优先按照xx1排序，如果xx1相等按照xx2排序。   
## 5.3 指定排序方向  
desc关键字只能作用于直接位于其前面的列名  
selct xx,xx,xx from tableName order by xx1 desc ,xx2  
# 第6章 过滤数据  
## 6.1 使用where子句  
select xx from tableName where 条件  
> 子句的顺序：where>order by>limit  
## 6.2 where子句操作符  
|操作符|说明|
|--|--| 
|=|等于|
|!=|不等于|
|<>|不等于|  
|<|小于|  
|<=|小于等于|  
|>|大于|
|>=|大于等于|  
|between a and b|在a和b之间|  
>MySQL执行匹配的时候不区分大小写  
## 6.3 空值检查  
NULL：注意它与字段0、空字符串不同，NULL就是NULL  
select语句有一个特殊的where子句，用来检查具有NULL值的列。  
is NULL  
> 在通过过滤选择出不具有特定值的行时(例如！=2)不会匹配null，即不等于是无法匹配到null的。  

# 第7章 数据过滤  
## 7.1 组合where子句  
可以使用and或者or来连接多个where子句  
select name from students where id=15 and height>180;
### 计算次序  
and的优先级高于or，A or B and C 会被理解为 A or (B and C)  
在and or 混合使用的情况下应该使用()来明确的指明运算顺序，消除歧义。  
## 7.2 IN操作符  
where x in (a,b,c..) 表示x字段的值为a或b或c或...     
## 7.3 not操作符  
MySQL中的not支持对in between exists等多种子句进行取反  
# 第8章 用通配符进行过滤  
## 8.1 like操作符  
为在子句中使用通配符，必须使用like操作符  
### 8.1.1 %通配符  
%可以匹配任意子句  
```
select id from students where name like li%;
```    
查找所有姓李的同学。  
> 注意：表面上%可以匹配所有字符串，但是%是并不能匹配null的  

### 8.1.2 _通配符  
_可匹配任意的单个字符  

> tip:不要过度使用通配符，因为通配符很消耗时间  

# 第9章 用正则表达式进行搜索  
## 9.1 使用MySQL正则表达式  
### 9.1.1 基本字符匹配  
regexp与like的区别：like必须完全匹配上才算匹配，regexp只需要一部分匹配上就可以，比如2018，对于like必须要like'2018'或者like'%18'才能匹配上，而regexp可以直接regexp '18'  
MySQL中的正则匹配是不区分大小写的，如果想要区分大小写，可以使用binary关键字  
```
where regexp binary '...';
```
### 9.1.2 .  
.可以匹配任意的单个字符
### 9.1.3 or  
|为正则表达式中的or操作  
```
where id regexp '1000|2000';
```
### 9.1.4 加强or  
如果想匹配1t,2t或者3t，可以使用[123]t。[]就是加强的|，事实上[123]t本身就是[1|2|3]t的简写  
### 9.1.5 匹配范围  
[0123456789]可简化为[0-9]  
### 9.1.6 匹配特殊字符  
上面介绍了诸如.[]-等字符，那么如果想要匹配这些字符该怎么办呢？  
可以使用转义字符，使用\\做前导。  
```
\\.表示匹配.
```  
为了匹配\自身需要使用  
```
\\\
```  
### 9.1.7 匹配字符类  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200131174549.png)
### 9.1.8 匹配多个实例  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200131174640.png)  
### 9.1.9 定位元字符  
```
^表示串的开头，$表示串的结尾  
^..$使得regexp与like功能相同  
```

# 第10章 创建计算字段  
## 10.1 拼接字段  
多数DBMS使用+或||来实现拼接，MySQL则使用concat函数来实现。  
```
select concat(a,'(',b,')') from table;
```  
## 10.2 使用别名  
别名用as关键字赋予  
```
select concat(a,'(',b,')') as vend_title from table;
```
## 10.3 执行算术运算  
```
select a*b as newCol from table;
```
# 第11章  
## 11.1 函数  
### 11.1 文本处理函数  
```
left(s,n) 返回串s从左侧开始数长度为n的子串  
right(s,n) 返回串s从右侧开始数长度为n的子串  
substring(s,pos,n) 返回串s从pos开始长度为n的子串
length() 返回串的长度  
upper()
lower() 
ltrim()
rtrim()
locate(substring,string) 返回substring在string中出现的首位置，位置从1开始算，如果返回0说明不存在。
soundex() 将串转换为描述其读音的值
select a from table where soundex(s) =soundex("T a"); 选取s字段读音接近“T a”的。
```  
### 11.2 日期和时间处理函数  
日期时间的格式：xxxx-xx-xx xx:xx:xx 例如：2005-09-01 11：30：05
```
date() 提取日期事件中的日期部分  
time() 提取日期时间中的时间部分
```
进行where筛选的时候注意，如果只是使用where order_date="2005-09-01"是不行的，因为order_data很可能含有时间，这样就不能匹配了。所以正确的做法是：where date(order_date)="2005-09-01"  

# 第12章 汇总数据  
## 12.1 聚集函数  
```
avg() 返回某列的平均值
count() 返回某列的行数
max()
min()
sum() 返回某列值之和
```  
count(*) 表示对表中行的数目进行计数，不管是否是null，count(column)表示对特定的列进行计数，忽略null值。  
## 12.2 聚集不同值  
如果想要去重可以添加distinct关键字  
```
select avg(distinct prod_price) as avg_price from table where id=1003;
```  


# 第13章 分组数据  
## 13.1 创建分组  
使用group by来创建分组，如果group by x，那么所有x字段相同的行就会被分到一组。  
例如：  
```
select count(*) as num from class group by id ;
表示按照id分组，计算每个id组各有多少个元素。
```  
**注意**：group by出现在where之后，order by之前。  
 
## 13.2 过滤分组  
where判断可以起到过滤的作用，但是where的过滤针对的是行而不是分组，可以使用having来代替where。  
注意：having和group by一起写的时候要把group by写在前面。  
```
select count(*) as num from class group by id having count(*)>=1 ;
```
## 13.4 select子句顺序  

**where>group by>having>order by>limit**  
# 第14章 使用子查询  
如果一个查询语句的输入是另一个查询语句的输出，那么可以使用子查询。  
例如一个表中存储物品与订单号(order_object表)，一个表中存储订单号和客户ID(order_id表)。现在想找到所有购买tnt2物品的客户id。  
思路就是通过tnt2找到订单号，在通过订单号找到客户id  
```
select id from order_id where order_num in(select order_num from order_object where object ='tnt2');
```    
子查询会涉及到查询多个表，如果多个表中有名字相同的字段，注意要使用完全限定符清晰地说明要的是哪一个表中的哪一个字段。  
子查询最常见的使用是在WHERE子句的IN操作符中。  
# 第15章 联结表  
外键：外键为某个表中的一列，它是另一个表的主键，外键关联两个表之间的数据。  
分解数据为多个表能更有效地存储，更方便地处理，并且具有更大的可伸缩性。但这些好处是有代价的。  
如果数据存储在多个表中，怎样用单条SELECT语句检索出数据？ 答案是**联结**。  
## 15.1 创建联结  
创建联结说白了就是select的时候from两个表(使用，连接)。  
```
select product_name,product_price,vend_name from venders,products where venders.vend_id=products.vend_id order by vend_name,product_name;
```  
当select from两个表的时候，相当于进行了一个二重循环，第一个表的每一行会与第二个表的每一行进行匹配，如果where子句的条件成立则输出。  

除了用上面这种方法还可以使用特定的语法：inner join on。使用的方式是：from 表1 inner join 表2 on 匹配条件
```
select product_name,product_price,vend_name from venders inner join products on venders.vend_id=products.vend_id order by vend_name,product_name;
```  
第十四章中的订单例子同样也可以使用联结来解决，而且更加清晰。  

# 第16章 创建高级联结  
## 16.1 使用表别名  
SQL允许给表取别名，这样在自联结的时候可以区分。  
## 16.2 自联结  
二重遍历相同的表时使用表别名区分。例：  
```
select p1.id,p1.name from products as p1,products as p2 where p1.id=p2.id and p2.id='DTNTR';
```
## 16.3 外联结  
select的本质：**选择一些行，展示其部分字段**  
在此前学习过的内部联结中，只有满足条件的行会被选中并展示，但是在外联结会选择左表或者右表全部展示，如果该行并不匹配会显示null。  
内连接是inner join，外联结是left/right outter join  
# 第17章 组合查询  
## 17.1 创建组合查询  
### 17.1.1 使用union  
union的使用方式很简单，在每一个select语句之间加入union即可。union会每一个select的语句产生的表合并。合并的规则是:如果一条记录出现多次，那么只会出现一次。如果想直接合并不去重，可以使用union all。  
## 17.1.2 union规则  
union中的查村必须包含相同的列，表达式或聚集函数，因为只有这样才能把多个表合并。  
## 17.1.3 对组合查询结果排序  
select语句的输出用order by子句排序。在用union组合查询时，只能使用一条order by子句，它必须出现在最后一条select语句之后。  
# 第18章 全文本搜索  
## 18.1 理解全文本搜索  
全文本搜索相比于通配符和正则表达式的优势：  
- 性能：通配符和正则表达式会由于被搜索行数增加，变得十分耗时。  
- 明确控制：使用通配符和正则表达式很难明确的控制匹配什么不匹配什么。  
## 18.2 使用全文本搜索  
使用全文本搜索的前提：为了进行全文本搜索，必须索引被搜索的列，而且要随着数据的改变不断地重新索引。在对表列进行适当设计后，MySQL会自动进行所有的索引和重新索引。  
### 18.2.1 启用全文本搜索支持  
在使用create table语句创建表的时候使用fulltext子句开启全文本搜索支持。  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/%E6%AF%94%E7%89%B9%E6%88%AA%E5%9B%BE2020-02-06-23-34-28.png)  
fulltext可以索引单个列，也可以指定多个列。  
### 18.2.2 进行全文本搜索  
match()指定被搜索的列，against()指定要使用的搜索表达式  
```
select note_text from products where match(note_text) against('rabbit');
``` 
该语句会搜索所有行note_text字段含有rabbit的记录。  
全文本搜索的一个很重要的部分就是对结果进行排序，具有较高等级的行会先返回。如果不在where子句中使用match和against而是在select语句中使用表示的是MySQL计算的优先级等级。  
```
select note_text ,match(note_text) against('rabbit') as rank from products;
```
### 18.2.3 使用查询扩展  
查询扩展过程中发生了什么：  
1. 进行基本的全文本搜索，找出与搜索条件匹配的所有行  
2. MySQL检查这些匹配行并选择所有有用的词  
3. MySQL再次进行全文本搜索，这次不仅使用原来的条件，而且还适用所有有用的词。  
开启查询扩展的方法：
```
match() against('rabbit'with query expansion)
``` 
# 第19章 插入数据  
## 19.1 插入单行  
基本格式：insert into tableName (...,...,...) values(...,...,...)  
如果某个列没有值，应该使用null填充，不必指定含有自动增量的字段。  
如果数据检索(select)是最重要的，则可以通过在insert和into之间添加关键字low_priority，指示MySQL降低insert的优先级  
```
insert low_priority into 
```
## 19.2 插入多个行  
insert into tableName (...,...,...) values(...,...,...),(...,...,...)  
## 19.3 插入select出的数据  
使用select代替values  
```
insert into tableName (...,...,...) select ...;
```  
> select和insert列名不匹配的情况：MySQL并不关心select指定的列名，它使用select返回的第1列填充insert指定的第一列，select返回的第2列填充insert指定的第二列。但是select和insert指定的列名数目必须匹配。    

# 第20章 更新和删除数据  
## 20.1 更新数据  
基本格式：update table set oldValue=newValue where...  
如果用update更新多行，并且在更新这些行中的一行或多行时出现一个错误，则整个update操作被取消，为即使发生错误，也继续进行更新，可使用ignore关键字。  
如果想删除某一行的某几个字段，可以使用update，将这些字段设为null。  
## 20.2 删除数据  
基本格式:delete from table where  

## 20.3 更新和删除的原则  
在对update或delete语句使用where子句前，应该先使用select进行测试，保证它过滤的是正确的记录，以防编写的where子句不正确。  
