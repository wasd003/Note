# 第1章 Git基础  
## 01 认识暂存区与工作区  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200203210552.png)  
三种add操作  
1. git add .  
提交新文件和被修改的文件，不包括被删除的文件  
2. git add -u  
提交被删除的文件和被修改的文件，不包括新文件。可以理解为add所有已经被git管理的文件。  
3. git add -A  
提交新文件，被修改的文件，被删除的文件。所有文件都会被提交。  
## 02 给文件重命名  
git mv a b 将a更名为b  
## 03 查看版本演变历史  
注意：默认git log查看的是当前所在分支的版本历史  
简洁查看版本历史 git log --oneline  
查看最近的x次  git log -nx  
查看所有分支的历史 git log --all  
图形化显示 git log --graph  
## 04 利用图形界面工具查看版本演变历史  
输入gitk调出图形界面，默认只能查看当前分支的历史，使用--all参数可以查看所有分支的参数    
左上角为版本演变历史树，上侧为作者名称，右上侧为版本提交时间，右下角patch为本次commit变更的文件，左下角为右下角所选中的文件的具体变更。  


小技巧：右键点击某次commit，可以为它打tag  
## 05 探秘.git目录  
### git对象  
git中的对象：commit，tree(文件夹对象)，blob(文件对象)  
commit对象包含author，committer，tree对象(根目录文件夹所对应的tree)  
tree对象对应文件夹，内部包含若干blob对象和tree对象  
blob对象对应一个文件，其内容就是其对应的文件夹的内容。  
比如现在有一个doc文件夹，其内部有一个readme文件。其对应的层次结构为：  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200205200830.png)  
第一个tree对应根目录文件夹，所以内含doc文件夹以及与之对应的tree对象，第二个tree对象对应doc文件夹，所以内含readme文件以及与之对应的blob对象。  
### .git文件夹  
- config文件夹下是配置文件  
- refs文件夹下包含tags和heads  
    - 其中heads保存了该仓库所有的分支，每一个分支文件存储的是该分支最新的commit的哈希值。  
    - 其中tags保存了每一个tag对应的commit的哈希值。  
- objects  存放对象 .git/objects/ 文件夹中的子文件夹都是以哈希值的前两位字符命名 每个object由40位字符组成，前两位字符用来当文件夹，后38位做文件。
- HEAD中是一个引用，指向当前所在的分支。  

git cat-file -t 对象哈希值 显示版本库对象的类型  
git cat-file -s 对象哈希值 显示版本库对象的大小  
git cat-file -p 对象哈希值 显示版本库对象的内容  
注意-file紧挨着cat  
## 06 进一步理解HEAD和branch  
05中已经说过每一个分支文件(比如master)存储的是该分支最新的commit ID，HEAD会指向某一个分支，也就是指向了该分支最新的一次commit ID，可以使用HEAD来代替这个commit。  
parent符号：~x HEAD~x表示HEAD往前的第x个祖先。  
例如
```
git diff HEAD HEAD~1 
```
表示比较当前HEAD所指分支最新一次提交和上一次提交的区别。  
# 第2章 独自使用git时的常见场景  
## 01 删除不想要的分支  
git branch -d 分支名  
如果报错not fully merged，可以使用git branch -D删除分支  
报错的原因：在日常开发中，一个分支完成后需要合并，Git判断本分支没和任何别的分支合并，意味这删除存在风险。它也提供我们-D的方式，如果确定无风险就用-D 。  
简而言之:合并过的分支删除用-d即可，未合并过的用-D。-d之后只是把那个分支的指针删除了，但是该分支的所有commit都还保留在历史中。但是-D之后该分支的所有commit就都删除了。  
## 02 修改最新的commit的message  
git commit --amend 对最新一次提交做 commit 修改  
## 03 修改老旧的commit的message  
git rebase -i 要修改节点的父节点的commitID  
将pick改成reword，退出，然后即可进入commit message编辑模式  
如果要修改第一次commit，可以使用git rebase -i --root  
## 04 将多个commit合成一个  
如果想把第x~y个commit合并，git rebase -i 第x-1个commitID ，将第x~y-1个commit都改成squash。  
