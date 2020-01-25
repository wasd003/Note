# 第一章 了解SQL  
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
# 第三章 使用MySQL  
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
# 第四章 检索数据  
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
# 第五章 排序检索数据  
## 5.1 排序数据  
给数据排序使用order by 子句，如果想要逆序排序添加desc关键字  
select productName from products order by productName;  
## 5.2 按多个列排序  
select xx,xx,xx from tableName order by xx1,xx2    
优先按照xx1排序，如果xx1相等按照xx2排序。   
## 5.3 指定排序方向  
desc关键字只能作用于直接位于其前面的列名  
selct xx,xx,xx from tableName order by xx1 desc ,xx2  
# 第六章 过滤数据  
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

