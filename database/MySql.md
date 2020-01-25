[toc]

## 基本操作  
1. 连接服务器：在命令行中输入mysql -uroot -p;
2. 创建一个数据库： create database 数据库名;  
3. 进入该数据库： use 数据库名;  
4. 删除数据库：drop database if exists 数据库名； 
删除表 drop table 
5. 显示所有数据库: show databases;  
显示所有表:show tables;
6. 创建表：create table 表名(字段名 数据类型 其他属性)；
7. 查看表：desc 表名  
8. 复制表操作  
- 创建一个和已有表格式一样的表  
create teble 新表名 like 旧表名;   
- 将旧表中的数据导入到新表  
```
insert into 新表名 select* from 旧表名; 
``` 
## SELECT  
- 从一个表中查询某一字段的数据：**select 字段 from 表名**  
如果想查询全部字段，使用通配符即可  
```
select * from 表名
```  
- where关键字    
select 字段 from 表名 where 条件一 and 条件二  
- as关键字  
将select出的结果作为一个新的字段名显示  
select 字段 as 新的字段名 from 表名；  

- is关键字  
对null的查询不能使用=，应该使用is
```
select * from 表名 where 字段1=null; 错误  
select * from 表名 where 字段1 is null; 正确
```  
- order by关键字  
如果想要排序在筛选语句后加上order by关键字  
例如 ：  
select 字段一 from 表名 order by 字段二 asc，字段三 asc  表示按照字段二“从小到大的顺序优先，字段三从小到大的顺序其次”筛选出所有记录的字段一  
asc：从小到大  desc：从大到小  
- limit关键字  
区间筛选  
limit k 表示取前k个  
limit k，m表示从第k个开始取m个  
> 注意这个第k个是从0开始的  
## 操作表记录  
- 更新  
update 表名 set 字段名 值 where 条件;  
例如：
update stu set `classID`=3 where `classID`=5;  
将stu表中classID为5的记录修改为classID为3

- 删除  
delete from 表名 where 条件；  
删除满足条件的记录  
- 插入  
insert into 表名 (字段一,字段二) values(值一,值二),(值一,值二);  
## 操作表结构  
>操作表的记录使用delete/insert/update关键字 操作表的结构使用alter table 关键字
### 一.操作数据表本身  
1. 修改数据表名称(alter -- 修改)  
alter table 旧表名 rename 新表名  
2. 清空表  
truncate 表名    
###  二.操作数据表中的字段  
1. 改变字段数据类型和名称  
- 仅改变数据类型：modify  
alter table 表名 modify 字段名 新数据类型  
- 数据类型和名称一起改  
alter table 表名 change 字段名 新字段名 新数据类型  
> 这里可是注意到永远都是先写字段名再写字段数据类型  
2. 添加字段  
add关键字  
alter table 表名 add 字段名 数据类型    
> 默认在表的最默认加入新字段，如果想指定位置，可以使用after 关键字，表示在某个字段后插入，如果想添加在最前端可以使用first关键字。  
3. 删除字段  
alter table 表名 drop 字段名  
## 数据类型  
### 一.字符串  
![](http://i2.tiimg.com/699146/f2f8c2ec35d1e5e3.png)  
### 二.校对规则  
默认不区分大小写  
### 三.常用字符串处理函数  
1. substring(s,pos,n)  提取字串函数 从pos位置开始取n个字符。  
> 注意：字符从1开始算起  
2. concat(s1,s2) 将s1，s2合并   
3. char_length(s) 返回字符串s的长度  
4. if语句  
if(条件,a,b) 表示如果满足条件执行a，否则执行b
### 四.正则表达式   
待添加  
### 五.数值类型  
![](http://i2.tiimg.com/699146/f48f7e7ec904bfee.png)  
注意：设置数据类型比如int(5)的时候不是只能存五位而是显示五位，如果设置前导零(添加zerofill关键字)会自动填充前导零至显示位数(比如123显示00123)  
![](http://i1.fuimg.com/699146/9d4989b7b82c221e.png)  
decimal(m,d) m是数据的总位数，d是数据的小数位数  
相比于float和double，decimal更加精确不容易出现数据位数错误，是用于存储货币等金融数据。  
### 六.enum和set类型  
- enum
枚举类型只能取特定的值  
例如： alter table stu add sex enum("男","女")  //添加sex这个枚举类型  
- set  
set可取多个值(类似checkbox)，使用方法和enum相同  
**set查找**
假设字段flag可取值为a，b，c ，d  
(i)使用查找函数：
查找所有flag字段中包含a的记录:where find_in_set(a,flag)  
(ii)二进制按位与
所有可选值按照1,2,4,8...排列，查找包含a和c的记录：where flag&5  

##高效使用日期与时间   
###datetime类型
存储出生日期的数据类型：datetime  
格式化显示时间的函数  
date_format(datetime类型变量，'%y %m %d')  代表年月日  
time_format(datatime类型变量，'%h %i %s')  代表时分秒  
###timestamp类型  
时间戳类型只能从1970年到2038年  
current_timestamp //当前时间  
设置时间为on update current_timestamp  
无论更新该记录的哪一个字段都会同时更新时间戳  
例如：  
```
alter table stu add updatetime timestamp default current_timestamp on update current_timestamp;
```
