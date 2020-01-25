<font size="5" face="黑体">
### 创建.gitignore文件

*常用操作：ls vim cat touch mkdir*  
touch .gitignore//创建gitignore文件  
gitignore规则：
```
(1)*.txt  //忽略所有txt文件
(2)a.txt  //忽略a.txt文件
(3)*.txt	 //忽略所有txt文件，除了a.txt
   !a.txt
(4)/vendor  //忽略vendor文件夹
(5)/vendor/*.php //忽略vendor文件夹下的php文件（仅限vendor文件夹下一级）
(6)/vendor/**/*.php  //忽略vendor文件下的所有php文件
```

### 从版本库中删除资源 

```
git rm a.txt  //将仓库和本地的a.txt都删除
git rm --cached a.txt //只将仓库中的a.txt删除，本地保留。即使文件脱离git管理
```
### 给文件改名

```
git mv a b //将a的名字改成b
```

### git log的使用  

```
(1)git log -p   //显示变动信息
(2)git log -x   //显示最近的x次提交
(3)git log --oneline   //精简显示
(4)git log --name-only  //查看哪些文件发生了变化
(5)git log --name-status  //查看哪些文件发生了什么变化
(6)git log --graph  //图形化显示

A: 增加的文件.

C: 文件的一个新拷贝.

D: 删除的一个文件.

M: 文件的内容或者mode被修改了.

R: 文件名被修改了。

T: 文件的类型被修改了。

U: 文件没有被合并(你需要完成合并才能进行提交)

X: 未知状态 (很可能是遇到git的bug了，你可以向git提交bug report)
```

### 修改最近一次提交的commit

```
git commit --amend  //输入该命令后会打开vim编辑commit
```
### 撤销add操作

>git reset HEAD 文件名   //将最近一次提交到暂存区的文件从暂存区中移除（但是本地的文件不变）
注意：如果已经commit了该命令无效

>git checkout -- 文件名  //使用暂存区的内容替换本地（工作区的内容） 

>这里注意reset head 和 rm --cached 的区别：reset只是撤销最近的一次add，rm则是直接把文件从暂存区删除了，即该文件已经脱离了git的版本控制


### git reset

```
git reset commit id   回退到某一个版本 
三个参数

--soft:只把仓库中的文件还原成目标版本
--mixed:把仓库中和暂存区中的文件还原成目标版本
--hard:将仓库，暂存区，本地（工作区）的文件都还原成目标版本（慎用）
git reset head^x 表示回退x个版本  
暂存区又被称为index
```
> 注意：如果回退到目标commit后，目标之后的commit就都没了，慎重使用，尤其是hard模式的reset。如果想要撤销此次reset（非hard模式）可以通过再次添加add和commit来撤销

### 分支 

> git branch //查看当前所有分支  
> git branch 分支名 //创建一个新分支  
> git checkout //切换分支  
> git merge 分支名 //将该分支合并到当前分支  
> git branch -d 分支名 //删除分支  

### 标签

注意：只有稳定运行的版本可以打标签  
>git tag  //查看标签  
>git tag v1.0 //打标签  


### rebase

git rebase master
>(1)如果从master的a点分出一条分支，等merge的时候master的commit还停留在a点，那么其实不会发生merge的操作。  
>(2)如果master的commit已经到了b点，采用git rebase master的命令，将分支的分离点从a点换为b点，这样也不会产生merge操作  
>(3)这样做的好处：merge的冲突处理工作不需要maste的负责人来做，而是交给了分支的作者

### SSH
[添加SSH密钥](https://www.bilibili.com/video/av56582999/?p=28)（如果连不上把unknown_hosts中的文件删掉）  
### Origin
添加远程主机  
```
git remote add origin 远程仓库地址
git remote rm origin 删除origin
```
>为本地仓库添加关联的远程仓库地址
### Clone
将origin的内容拷贝到本地  
```
git clone 仓库地址 本机地址 
```  
>把远程仓库clone到本机的指定路径  
### Push
```
git push origin 分支名
git push origin --delete
```
>将本地仓库的某个分支推送到远程,如果加上--delete，将远程主机的该分支删除
### Fetch
取回远程主机其他人对分支做出的更新
```
git fetch origin
```
>取回远程主机所有的更新  
```
git fetch origin 分支名
```
>取回某一分支的更新  
取回分支x的更新后，本地会出现origin/x这一分支，如果想合并git merge orgin/x即可
### Pull
```
git pull origin 远程分支名：本地分支名  
```
>取回远程主机某个分支的更新，再与本地的指定分支合并
pull==fetch+pull

### diff  
读懂diff显示的内容  
[blog](http://www.ruanyifeng.com/blog/2012/08/how_to_read_diff.html)  
会显示变动一行的前三行和后三行，共七行。  
变动行号为起始行号+3  
