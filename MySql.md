## 一.基本操作  
1. 连接服务器：在命令行中输入mysql -uroot -p;
2. 创建一个数据库： create database 数据库名;  
3. 进入该数据库： use 数据库名;  
4. 删除数据库：drop database if exists 数据库名；  
5. 显示所有数据库: show databases;  
6. 创建表：create table class(id int primary key auto_increment,classname varchar(30),description varchar(100)) charset utf8;  
> 这里class是表名  
7. 查看表：desc 表名  
8. 插入表操作:  
- 插入一个：insert into class set classname='PHP',description='学习PHP';  
- 插入多个：insert into class (classname,description) values('linux','服务器'),('c++','学习c++');  
9. 复制表操作  
- 创建一个和已有表格式一样的表  
create teble 新表名 like 旧表名;   
- 将旧表中的数据导入到新表  
```
insert into 新表名 select* from 旧表名; 
``` 
10. 查询表操作  
- 从一个表中查询某一字段的数据：select 字段 from 表名  
如果想查询全部字段，使用通配符即可  
```
select * from 表名
```
