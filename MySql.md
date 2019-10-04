## 一.基本操作  
1. 连接服务器：在命令行中输入mysql -uroot -p;
2. 创建一个数据库： create database 数据库名;  
3. 进入该数据库： use 数据库名;  
4. 删除数据库：drop database if exists 数据库名；  
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
####9. 查询表操作  
- 从一个表中查询某一字段的数据：**select 字段 from 表名**  
如果想查询全部字段，使用通配符即可  
```
select * from 表名
```  
- 按条件筛选  
使用where语句  
select 字段 from 表名 where 条件一 and 条件二  
- 将多个字段合并  
select concat(字段一，字段二) as 新的字段名 fron 表名；
- 对null的查询不能使用=，应该使用is
```
select * from 表名 where 字段1=null; 错误  
select * from 表名 where 字段1 is null; 正确
```  
- 排序  
在筛选语句后加上order by关键字  
例如 ：  
select 字段一 from 表名 order by 字段二 asc，字段三 asc  表示按照字段二“从小到大的顺序优先，字段三从小到大的顺序其次”筛选出所有记录的字段一  
asc：从小到大  desc：从大到小  
- 区间筛选  
limit k 表示取前k个  
limit k，m表示从第k个开始取m个  
> 注意这个第k个是从0开始的  
####10. 修改表记录  
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
## 数据表管理  
### 操作数据表  
1. 修改数据表名称(alter -- 修改)  
alter table 旧表名 rename 新表名  
2. 清空表  
truncate 表名    
###  操作字段  
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
