<font size="5" face="黑体">
<p style="color:red;">1.创建.gitignore文件</p>
常用操作：ls vim cat touch mkdir
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
>ls:查看当前目录下所有的文件
<p style="color:red;">2.从版本库中删除资源 </p>
```
git rm a.txt  //将仓库和本地的a.txt都删除
git rm --cached a.txt //只将仓库中的a.txt删除，本地保留
```
<p style="color:red;">3.给文件改名</p>
```
git mv a b //将a的名字改成b
```

<p style="color:red;">4.git log的使用</p>
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

<div style="color:red;">5.修改最近一次提交的commit
</div>
```
git commit --amend  //输入该命令后会打开vim编辑commit
```
<div style="color:red">6.撤销add操作</div>

>git reset HEAD 文件名   //将最近一次提交到暂存区的文件从暂存区中移除（但是本地的文件不变）
注意：如果已经commit了该命令无效

>git checkout -- 文件名  //使用暂存区的内容替换本地（工作区的内容） 

>这里注意reset head 和 rm --cached 的区别：reset只是撤销最近的一次add，rm则是直接把文件从暂存区删除了，即该文件已经脱离了git的版本控制


<div style="color:red;">7.git reset </div>

```
git reset commit id   回退到某一个版本 
三个参数

--soft:只把仓库中的文件还原成目标版本
--mixed:把仓库中和暂存区中的文件还原成目标版本
--hard:将仓库，暂存区，本地（工作区）的文件都还原成目标版本（慎用）

```
<div style="color:blue;">注意：如果回退到目标commit后，目标之后的commit就都没了，慎重使用，尤其是hard模式的reset。如果想要撤销此次reset（非hard模式）可以通过再次添加add和commit来撤销</div>

<div style="color:red;">8.分支 </div>
> git branch //查看当前所有分支
> git branch 分支名 //创建一个新分支
> git checkout //切换分支
> git merge 分支名 //将该分支合并到当前分支
> git branch -d 分支名 //删除分支

<p style="color:red;">9.标签</p>
注意：只有稳定运行的版本可以打标签
>git tag  //查看标签
>git tag v1.0 //打标签


<p style="color:red;">10.rebase</p>
git rebase master
>(1)如果从master的a点分出一条分支，等merge的时候master的commit还停留在a点，那么其实不会发生merge的操作。
>(2)如果master的commit已经到了b点，采用git rebase master的命令，将分支的分离点从a点换为b点，这样也不会产生merge操作
>(3)这样做的好处：merge的冲突处理工作不需要maste的负责人来做，而是交给了分支的作者

<p style="color:red;">11.github</p>
<ul>
<li> [添加SSH密钥](https://www.bilibili.com/video/av56582999/?p=28)（如果连不上把unknown_hosts中的文件删掉）</li>
<li>git clone 仓库地址 本机地址 <span style="color:purple;">把远程仓库clone到本机的指定路径</span>
</li>
<li> **origin：**远程主机名，即与本地仓库关联的远程仓库
git remote add origin 远程仓库地址  <span style="color:purple;">为本地仓库添加关联的远程仓库地址</span>
git push origin 分支名 &nbsp;&nbsp;<span style="color:purple;">将本地仓库的某个分支推送到远程</span>
git push origin --delete 分支名&nbsp;&nbsp;<span style="color:purple;">将远程主机的某个分支删除</span>
</li>
<li> git fetch origin &nbsp;&nbsp;<span style="color:purple;">取回远程主机所有更新</span>
git fetch origin 分支名 &nbsp;&nbsp;<span style="color:purple;">取回远程主机某个分支的更新</san>
</li>
<li> git pull origin 远程分支名：本地分支名  <span style="color:purple;">取回远程主机某个分支的更新，再与本地的指定分支合并</span>&nbsp;&nbsp;&nbsp;&nbsp;
<div style="color:rgb(120,120,255);">pull==fetch+merge</div>
</ul>

