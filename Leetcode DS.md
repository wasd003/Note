<font size="5" face="黑体"/>

[1.数据流中位数](https://leetcode-cn.com/problems/find-median-from-data-stream/)
- **关键思路**：先插入再调整
  大根堆和小根堆容量一样-->插入大根堆-->调整
  大根堆比小根堆容量多-->插入小根堆-->调整  
  **注意：大根堆在上**
- **调整函数**
```
void exchange(priority_queue<int,vector<int>,greater<int> > &S, priority_queue<int> &B)
{
	if(B.top()>S.top())
	{
		auto x=B.top();
		auto y=S.top();
		B.pop();
		S.pop();
		S.push(x);
		B.push(y);
	}
}
```
****
[2.合并k个排序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists/)

- **关键思路**：把所有链表中的数据插入到优先队列中，从而实现了边插入边排序
****


[3.天际线问题（难题）](https://leetcode-cn.com/problems/the-skyline-problem/)

使用扫描线算法（应用于柱状图）
**算法内容：**
>记录矩形每一条边的横坐标以及高，保存到到一个容器里，遍历容器
- 使用注意：注意重合的边扫描顺序（元素在容器内排列的排序）
- 关键思路：last记录上一个关键点，更新的条件是：当前最大高度不等于上一个关键点的高度

****
[4.接雨水Ⅱ](https://leetcode-cn.com/problems/trapping-rain-water-ii/)

使用优先队列来BFS

- **核心思路**：从外围开始向内部搜索，如果当前点比要搜索的点高，增加答案（可以接雨水），并且把转移的点的高度变为当前点的高度（装水以后该点高度增加）

- **注意**：即使当前点没有要搜索的点高，没有更新答案，也算是搜过这个点了，仍然需要改变vis数组，并把该点push到队列中

- **使用优先队列的原因**：如果不是按照从小到大的顺序来搜，那么如果先搜高的点就会把转移点的高度强行提到和高的点一样高，但是实际转移点可能达不到那么高（水会从其他方向流出去）

****
[5.接雨水Ⅰ](https://leetcode-cn.com/problems/trapping-rain-water/)

核心思路：与Ⅱ相同，注意抛去左右两边的雨水
****

6.[柱形图中的最大矩形（84）](https://leetcode-cn.com/problems/largest-rectangle-in-histogram/)&&[最大矩形（85）](https://leetcode-cn.com/problems/maximal-rectangle/)

>都应用了单调栈：查找一个数组中一个数字往左/右比该数大/小的第一个数字/数字的位置

模板题：[496 下一个更大的元素I](https://leetcode-cn.com/problems/next-greater-element-i/)

- 84题核心思路：尝试以每一个柱形条的高为矩形的高度，向左右拓展，拓展的长度的求法使用单调栈

- 85题核心思路：基于84题。先预处理出dp数组，然后做法同84.详见leetcode官方题解方法Ⅱ：动态规划 - 使用柱状图的优化暴力方法
****
[7.基本计算器](https://leetcode-cn.com/problems/basic-calculator/)

>考察中缀表达式转化成后缀表达式以及计算后缀表达式的方法

****

[8.恢复二叉搜索树](https://leetcode-cn.com/problems/recover-binary-search-tree/)
- 层序创建一棵二叉树
```
TreeNode* create()
{
	char x;
	cin >> x;
	TreeNode* root = new TreeNode(x - '0');
	queue<TreeNode*>q;
	q.push(root);
	while (q.size())
	{
		auto s = q.front();
		q.pop();
		cin >> x;
		if (x != 'n'&&x!='\n')
		{
			TreeNode* l = new TreeNode(x - '0');
			s->left = l;
			q.push(l);
		}
		cin >> x;
		if (x != 'n'&&x!='\n')
		{
			TreeNode* r = new TreeNode(x - '0');
			s->right = r;
			q.push(r);
		}
	}
	return root;
}
```
- 二叉查找树的性质
它的中序遍历的结果是一个有序序列，利用这个性质可以判断是否是二叉查找树，也可以恢复二叉查找树


****

[9.二叉树中的最大路径和](https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/)&&[二叉树的直径](https://leetcode-cn.com/problems/diameter-of-binary-tree/submissions/)

**核心思路**：这两道题在实现的时候会用到一个共同的技巧：
dfs函数同时做两件事：
(1)计算从root开始向左**或者**向右的最大路径和或者最长路径长度
(2)更新以root为根节点的最大路径和或者最长路径长度

- >二叉树的题目debug方法：输出以root为根的情况，递归尽量避免单步跟踪调试
- >最大路径和的一个代码trick：涉及最大路径和的问题，计算左/右子树的最大路径和时，常和0取max。即：left=max(dfs(root->left),0);相当于不选取左/右路径

《最大路径和》核心代码
```
int dfs(TreeNode* root)
    {
        if(!root) return 0;
        int l=max(0,dfs(root->left));//trick
        int r=max(0,dfs(root->right));
        ans=max(ans,l+r+root->val);//更新以root为根节点的答案
        return max(l,r)+root->val;//返回向左走或者向右走的最大路径和
    }
```
《树的直径》核心代码：
```
int dep(TreeNode* root)
    {
        if(!root) return -1;
        if(!root->left&&!root->right) return 0;
        int l=dep(root->left);
        int r=dep(root->right);
        ans=max(ans,l+r+2);//更新以root为根节点的答案
        return max(l,r)+1;//返回向左走或者向右走的最长路经长度
    }
```
****
[10.树中距离之和](https://leetcode-cn.com/problems/sum-of-distances-in-tree/comments/)

>还不会qaq

****
[11.从先序遍历还原二叉树](https://leetcode-cn.com/problems/recover-a-tree-from-preorder-traversal/) 
**核心思路**:先取出字符串中第一个数字作为根节点，然后把剩余字符串的每一个横线部分减一，并且将其分为左右两部分，递归生成左右子树
****

[12.最长连续序列](https://leetcode-cn.com/problems/longest-consecutive-sequence/submissions/)
**核心思路**：维护两个哈希表unordered_map<int,int> left,right.其中left[i]记录以i为序列左端点的最长长度，right同理。当我们遍历到一个新的数 x 时，先查找 x 左右两边分别存在多长的连续序列，两个值分别是right[x-1]和left[x+1]，分别记为left和right，此时我们可以将左右两部分和 x 拼起来，形成一个更长的连续整数序列，然后更新新序列的左右两端的值：

- 新序列的左端点是 x-left，更新哈希表：tr_left[x - left] = max(tr_left[x - left], left + 1 + right);
- 新序列的右端点是 x+right，更新哈希表：tr_right[x + right] = max(tr_right[x + right], left + 1 + right);
- 同时不要忘记更新ans
- ****
[13.k个一组反转链表](https://leetcode-cn.com/problems/reverse-nodes-in-k-group/)
没什么好总结的，就是边界条件比较墨迹。多调试调试就A了
****
[14.从二叉树到更大和树](https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/submissions/)
很简单
****
[15.在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

二分在排序数组中查找数字的模板
>两个模板的check都有等于
```
	while(l<r)
        {
            int mid=l+r>>1;
            if(nums[mid]>=k)//大于等于找到的是比tar大一点点的数（如果tar不存在）或者tar出现的第一个位置
            {
                r=mid;
            }
            else l=mid+1;
        }
```

```
 while(l<r)
        {
            int mid=l+r+1>>1;
            if(nums[mid]<=k)//小于等于找到的是比tar小一点点的数（如果tar不存在）或者tar出现的最后一个位置
            {
                l=mid;
            }
            else r=mid-1;
        }
```
****
[16.移除元素](https://leetcode-cn.com/problems/remove-element/submissions/)
**数组问题考虑全面：**
>(1)考虑数组为空的情况
>(2)考虑数组中只有一个元素的情况
>(3)考虑数组中只有两个元素的情况
>(4)考虑数组的极端情况，比如全是“...”或者没有"..."（...是题目的具体特性，如本题数组中所有元素都是val，再比如旋转数组根本没有旋转：nums[0]<nums[n]）

****
[17.寻找重复数](https://leetcode-cn.com/problems/find-the-duplicate-number/submissions/)
**核心思路：**二分的不是区间而是答案，所以从[1,n]开始二分，如果在[x,y]区间内的数字个数超过y-x+1那么在[x,y]内存在答案
****
[18.被围绕的区域](https://leetcode-cn.com/problems/surrounded-regions/)
**核心思路：**先把四周的零及其联通块变成#，然后遍历棋盘，#->O,O->X
****
[19.等式方程的可满足性](https://leetcode-cn.com/problems/satisfiability-of-equality-equations/submissions/)
- **并查集：**
> (1)并查集的本质  
> (2)ufs[x]的意义：如果ufs[x]>0，那么表示的是x的同伴的编号，如果ufs[x]<0，那么表明x是根，abs(ufs[x])表示该集合中点的个数

**code：**
```
int ufs[maxn];
int Find(int x)
{
	if (ufs[x] < 0) return x;
	ufs[x]=Find(ufs[x]);//路径压缩，减少树的深度，把沿途搜索的点都直接指向根节点
	return ufs[x];
}
void Union(int x, int y)
{
	x = Find(x),y = Find(y);
	if (x == y) return;
	ufs[x] += ufs[y];//把y集合点的数目加到x集合上
	ufs[y] = x;
}
int Count(int x)
{
	x = Find(x);
	return -ufs[x];
}
```  
****
[20.用斜杠划分区域](https://leetcode-cn.com/problems/regions-cut-by-slashes/submissions/)
[题解](https://blog.csdn.net/qq_17550379/article/details/85262219)

*这道题思路比较奇特，把一个1x1的小块分成上下左右四个区域，先根据符号合并这个小块，再合并1x1的小块上边的小块和左边的小块*
****
[21.冗余连接](https://leetcode-cn.com/problems/redundant-connection/submissions/)
**核心思路：**
对于同一棵树的所有节点来说，都拥有共同的祖先节点。因此，判断冗余连接的条件即为，判断新加入的边，两个节点是否有共同的祖先。
（1）如果有共同的祖先，则说明这条边是冗余的边；
（2）如果没有共同的祖先，则说明这两条边并未加入树中，因此进行合并操作。
****
# 插入：无向图中搜环的算法
```
void dfs(int u, int p)
{
	if (vis[u] == 2)
	{
		int tar = path.back();
		for (int i = path.size() - 2; ~i; i--)
		{
			cir.push_back(path[i]);
			if (path[i] == tar) break;
		}
		is_ok = true;
		return;
	}
	if (is_ok) return;//如果已经搜到答案了，直接返回
	for (auto next : g[u])
	{
		if (next != p)
		{
			path.push_back(next);
			vis[next]++;
			dfs(next, u);
			path.pop_back();
			vis[next]--;
		}
	}
}
```
**代码关键点**：
1. dfs的参数是(u,p)u表示当前搜索的点，p表示其父节点，next不可以是父节点
2. 找到答案的条件是vis[u]==2，即一个点找到了两次（这里vis表示的意思是遇到了几次）
3. 使用is_ok，搜到答案后直接return，不要继续搜索
4. 调用的方法：vis[1]=1,path.push_back(1),dfs(1,-1);
**记忆点：**(u,p),vis,is_ok
****
[22.分割数组以得到最大和](https://leetcode-cn.com/problems/partition-array-for-maximum-sum/submissions/)
**核心思路：**以f(i)表示前i个元素分割得到的最大值，枚举最后一个区间的长度j从1到k
****
[23.最小高度树](https://leetcode-cn.com/problems/minimum-height-trees/submissions/)（经典）
**核心思路：**贪心删点，每一轮删除叶子节点，直至只剩下一个或者两个节点就是答案。（因为越外侧的点，度数越少的点越不可能是答案）
**代码实现关键点：**BFS的时候每次进行一轮
**正确code：**
```
		while(cnt!=n-2&&cnt!=n-1)
        {
            int size=q.size();
            for(int i=1;i<=size;i++)//每次必须把这一轮的叶子节点删干净，才能判断是否只剩一个或者两个节点
            {
                auto s=q.front();
                q.pop();
                cnt++;
                for(auto next:g[s])
                {
                    if(--inx[next]==1)
                    {
                        q.push(next);
                    }
                }
            }
		}
```
**错误code：**
```
		while(cnt!=n-2&&cnt!=n-1)
        {
            
            auto s=q.front();
            q.pop();
            cnt++;
            for(auto next:g[s])
            {
                if(--inx[next]==1)
                {
                    q.push(next);
                }
            }
        
		}
```
****
[24.网络延迟时间](https://leetcode-cn.com/problems/network-delay-time/)
考察SPFA,FLOYD,BELLMAN-FORD算法模板，但是感觉样例有点问题
****
[25.找到最终的安全状态](https://leetcode-cn.com/problems/find-eventual-safe-states/submissions/)
**核心思路：**本题就是相当于在有向图中把环剔除出去，先把图反向存储再拓扑排序即可

<p style="color:red">问题：为什么需要先反向存储再拓扑排序？？以题目中的样例为例，如果不反向存储那么就无法完成拓扑排序，删掉4和6后没有入度为0的点</p>

![](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/17/picture1.png)
****
<a href="https://leetcode-cn.com/problems/maximum-frequency-stack/submissions/">26.最大频率栈</a>
**核心思路：**一个map存储元素每一个元素出现的频率（freq），一个map存储某一频率对应的所有元素(element):
```map<int,stack<int> >```
<hr/>
<a href="https://leetcode-cn.com/problems/palindrome-pairs/submissions/">27.回文串</a>
<a href="https://www.acwing.com/solution/LeetCode/content/363/">题解</a>
**启示：判断两个字符串能否组成回文串的方法：枚举分割点：分成左相等，右回文和左回文，右相等两种情况**
<hr/>

<a href="https://leetcode-cn.com/problems/odd-even-jump/submissions/">28.奇偶跳</a>
>(1)查找数组中第i个元素右侧比他大的元素中最小的那一个（或者比他小的元素中最大的那一个）的位置的方法：倒序枚举，用堆来自动排序后进行二分查找：O（NlogN）  
>(2)set/multiset中upper/lower_bound的使用：
>与一般的泛型算法中的upper/lower_bound不同的是：set中的二分查找不需要传容器的迭代器，只需要传查找的元素
>lower_bound:返回的是等于或者比tar大一点点的元素的迭代器
>upper_bound:返回的是比tar大一点点的元素的迭代器
<p style="color:red;">这里的大一点点指的是大于的元素中最小的那一个</p>  

****

[29.去除重复字母](https://leetcode-cn.com/problems/remove-duplicate-letters/submissions/)
[题解](https://www.acwing.com/solution/LeetCode/content/93/)
**原来string有pop_back()这个操作吼吼**
****
[30.雇佣k名工人的最低成本](https://leetcode-cn.com/problems/minimum-cost-to-hire-k-workers/submissions/)
<p style="color:red;">重要题目：拓展贪心思路</p>  

1. 双指标贪心的做法:如果贪心有两个指标（比如a,b），通常是按照a×b排序，或者a/b排序。可以使用交换法证明。但是稍微复杂的题目不可能这么简单就过。需要排完序后扫描一遍排序数组，每次考虑取第i个或者前i个，结合其他变量/条件更新出最优答案。  

2. 本题核心思路：先按照：wage/quality排序，得到单位工作量的价格，这样总的费用就是单位工作量价格×总工作量。每次考虑以第i个人为单位价格的最大值，只需要让总工作量最小：所以需要一个大根堆，每当其容量超过K时，弹出堆顶元素。
****
[31.水位上升的泳池游泳](https://leetcode-cn.com/problems/swim-in-rising-water/submissions/)
<p style="color:red;">重要题目 拓展搜索思路</p>  

1. 使用优先队列BFS：通常情况下的搜索是盲目的枚举，但是如果使用优先队列优化，将更接近答案的元素赋予更大的优先级，这样每次取出队头，相当于搜索具有了指向性。
2. 本题核心思路：本题中grid[i][j]越小越好，所以可以使用小根堆优化BFS
****
[32.超级丑数](https://leetcode-cn.com/problems/super-ugly-number/submissions/)
<p style="color:red;">经典题目</p>

每一个质数对应一个指向已生成丑数序列的指针，如果该质数使丑数序列增长，指针后移一位
****
[33.二叉树的最近公共祖先](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/)
这是一组题：  
（1）如果树是二叉搜索树：根据两个tar与root的大小关系递归查找  
（2）如果不是二叉搜索树但是有指向父节点的指针：等价于寻找两个链表的第一个相交节点  
（3）如果不是二叉搜索树也没有指向父节点的指针：先从root开始查找到两个tar的路径，然后转化为寻找两个链表的第一个相交节点
****
[34.树的中序遍历](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)
两个要点：  
>(1)把一个元素插入栈中，那么就要把他左面的一条链都插入栈中  
>(2)取出栈顶元素并输出后，要把他右边的元素插入栈中  
```
 vector<int> inorderTraversal(TreeNode* root) {
        stack<TreeNode*>s;
        vector<int>res;
        if(!root) return res;
        auto p=root;
        while(p||s.size())
        {
            while(p)
            {
                s.push(p);
                p=p->left;
            }
            p=s.top();
            s.pop();
            res.push_back(p->val);
            p=p->right;
        }
        return res;
    }
```

二四筛素数模板
```
void SelectPrime(int n, vector<int>&prime)    //二四筛法
{
	vector<int>vis(n + 10);//多加一点，防止vis[4]=1这一步数组索引超限
	prime.push_back(2);
	vis[4] = 1;
	for (int i = 3; i < n; i += 2)//注意：+=2
	{
		if (!vis[i])    prime.push_back(i);
		for (int j = 0; (j < prime.size() && i*prime[j] < n); j++)
		{
			vis[i*prime[j]] = 1;
			if (i%prime[j] == 0)    break;//记忆
		}
	}
}
```
****
[35.移除最多的同行或同列石头](https://leetcode-cn.com/problems/most-stones-removed-with-same-row-or-column/submissions/)  
1. 本质：联通块题目，只不过不是上下左右相连而是同行同列相连  
2. 并查集的使用：不是点与点之间组成并查集，而是行与列之间。因为最多10000行，所以可以用c+10000表示列
****
[36.最短的桥](https://leetcode-cn.com/problems/shortest-bridge/submissions/)  
从若干个点到若干个点的最短路:先把若干个点添加进队列，BFS，当遇到另一部分的若干个点时说明找到了答案。
****
<center><h1 style="color:brown;">最短路算法</h1></center>

*对于无权图：最短路用BFS求就可以了，不用上算法*

>(1)多源最短路
**Floyd**
先枚举中转点
```
for (int k = 1; k <= n; k++)
{
	for (int i = 1; i <= n; i++)
	{
		for (int j = 1; j <= n; j++)
		{
			G[i][j] = min(G[i][j], G[i][k] + G[k][j]);
		}
	}
}
```
<br/><br/>

>(2)单源最短路(两点最短路与单源最短路复杂度相同)
假设：N个点M条边 &nbsp;&nbsp;(u,v,w)表示从u到v有一条权值为w的边


>带负权：**Bellman - Ford**
**核心**：N个点松弛N-1次，每次考虑一条边
```
d[0] = 0;
for (int i = 1; i < N; i++) d[i] = 0x3f3f3f3f;
while ((N - 1)--)//松弛N-1次
{
	for (int i = 0; i < M; i++)//考虑每条边
	{
		int x = u[i], y = v[i];
		d[y] = min(d[y], d[x] + w[i]);
	}
}
```
<br/>
>不带负权:**Dijkstra**

><a href="https://www.luogu.org/problem/P4779">模板题</a>
```
	cin >> N >> M >> S;
	for (int i = 1, u, v, w; i <= M; i++)
	{
		scanf("%d %d %d", &u, &v, &w);
		g[u].push_back(Edge(v, w));//带权图的存图方式
	}
	memset(dis, 0x3f3f3f3f, sizeof dis);
	dis[S] = 0;
	for (int i = 1; i <= N; i++)
	{
		if (i != S)
		{
			q.push(Node(i, 0x3f3f3f3f));
		}
		else {
			q.push(Node(i, 0));
		}
	}
	while (q.size())
	{
		Node f = q.top();
		q.pop();
		if (vis[f.u]) continue;
		vis[f.u] = 1;
		for (auto next : g[f.u])
		{
			if (f.d + next.dist < dis[next.to])
			{
				dis[next.to] = f.d + next.dist;
				q.push(Node(next.to, dis[next.to]));
			}
		}
	}
	for (int i = 1; i <= N; i++)
	{
		printf("%d ", dis[i]);
	}
```
****

[37.最长重复字串](https://leetcode-cn.com/problems/longest-duplicate-substring/solution/zui-chang-zhong-fu-zi-chuan-by-leetcode/)
字符串编码
<ul><li>优点：将字符串比较从O(L)降至O(1)</li>
<li>编码方式：将字符串看作一个26进制数，然后将其转化为十进制</li>
<li>应用场景：字符串匹配问题</li>
<li>使用方法：设置一个长度为k的滑动窗口，依次计算窗口内字符串的编码值，但是注意每次不要重复算，要利用上一次算的结果</li>
</ul>  

****
[38.字母异位词分组](https://leetcode-cn.com/problems/group-anagrams/submissions/)  
1. map的查询除了使用下标还可以用find函数，如果返回的是end()说明key没有对应的value  
2. 字母异位词的判断：排序后相同表示是字母异位词
****
[39.表现良好的最长时间段](https://leetcode-cn.com/problems/longest-well-performing-interval/submissions/)  
本质上是求一个最长上坡。求法：维护两个数组：minl[i]表示i向左最小的数，maxr[i]表示i向右最大的数。然后使用双指针扫描一遍
****
[40.实现trie](https://leetcode-cn.com/problems/implement-trie-prefix-tree/submissions/)
****
[41.索引处的解码字符串](https://leetcode-cn.com/problems/decoded-string-at-index/solution/suo-yin-chu-de-jie-ma-zi-fu-chuan-by-leetcode/)
<div style="color:red;">没看懂题解qwq</div>  

****
[42.子数组的最小值之和](https://leetcode-cn.com/problems/sum-of-subarray-minimums/submissions/)  
1. 大致思路：考虑每一个元素右边第一个比他小的元素的位置和第一个左边比他小的元素的位置，在这两个位置之间当前元素最小，用组合出的子集数量×该元素的值得到该元素对答案的贡献。全部累加得到最终的答案
2. 细节：  
- 组合出的元素数目：假设该元素左边有x个元素比他大，右边有y个元素比它大，那么可以凑成的子集数量是：**x+y+xy+1**
- 大于还是大于等于：如果求左&&右第一个小于等于当前元素的位置，那么对于含有重复元素的数据比如[3，4，5，3]那么【3，3】这个区间就没算。如果是求左&&右第一个严格小于当前元素的位置，那么【3，3】这个区间就算了两次。所以**解决方案**是左右两个区间一个是第一个严格小于当前元素的元素位置，一个是第一个小于等于当前元素的元素位置。这样就可以保证对于上面说的这种情况只算了一次。
****
[43.132模式](https://leetcode-cn.com/problems/132-pattern/submissions/)  

**算法的正确性**:因为stk中保存的数都是已经遍历过的，所以stk中的数字一定在当前数字的右边。即：stk的数字具有成为“3”的潜质（位置正确),当nums[i]>stk.top()时，可以更新three（因为满足2>3）
****
[44.移掉k位数字](https://leetcode-cn.com/problems/remove-k-digits/submissions/)  
**思路**:维护一个非递减栈，最终栈中剩下的就是答案字符串
****
[45.三数之和的多种可能](https://leetcode-cn.com/problems/3sum-with-multiplicity/submissions/)  
**收获**:
1. 对于数组长度比较长，但是数组中数据的大小比较小的时候，可以枚举数而不是枚举下标
2. 答案数比较大，需要返回取模的答案时，不要每次res+=x,再res%=mod,应该int delta=x%mod,再res=(res+delta)%mod
****
[46.划分字母区间](https://leetcode-cn.com/problems/partition-labels/submissions/)  
如果题目中说明字符串中只包含a~z的小写字母，那么通常都需要定一个count[26],记录每个字母出现的次数
****
[47.匹配子序列的单词数](https://leetcode-cn.com/problems/number-of-matching-subsequences/submissions/)  
**判断一个字符串是否是另一个字符串的子序列**:先预处理出母串中每一个字母出现的所有位置，然后对子串中的每一个字母贪心的匹配
>code:

```
bool Is_SubSequence(string S, string s)//S是母串，s是子串 
{
	vector<int>hash[26];
	int n = S.size();
	for (int i = 0; i < n; ++i)
	{
		hash[S[i] - 'a'].push_back(i);
	}
	int m = s.size();
	int pre = -1;//前一个字母匹配的位置
	for (int i = 0; i < m; ++i)
	{
		auto index = lower_bound(hash[s[i] - 'a'].begin(), hash[s[i] - 'a'].end(), pre + 1);
		if (index == hash[s[i] - 'a'].end())
		{
			return false;
		}
		pre = *index;
	}
	return true;
}
```
****
[48.连续数组](https://leetcode-cn.com/problems/contiguous-array/submissions/)  
- 三目运算符参与运算的时候记得加上括号 比如：pre[i] = pre[i - 1] + (nums[i - 1] == 1?  1 : -1);
- 把0变成-1，则原题目转换为求一个最长的区间和为0的子数组。而区间和为0可以转换为前缀和相等。
- **数组中的题目可以把数组中的元素进行改变，从而将原题目转化为区间和的问题**（类似的题目还有[39.表现良好的最长时间段](https://leetcode-cn.com/problems/longest-well-performing-interval/))
****
[49.最低加油次数](https://leetcode-cn.com/problems/minimum-number-of-refueling-stops/submissions/)
[算法二](https://www.acwing.com/solution/LeetCode/content/591/?time=1565407380077)  
vector任意位置插入：v.insert(it,num) //在it迭代器前插入元素num。如果要在头部插入it=v.begin()
****
[50.寻找重复的子树](https://leetcode-cn.com/problems/find-duplicate-subtrees/submissions/)  
**思路**:将树编码为字符串，用哈希表存储，如果第二次遇见就输出答案到res中。
编码方式：
```
string verify(TreeNode* root)
    {
        if(!root) return "#";
        string cur=to_string(root->val)+",";
        cur+=verify(root->left)+",";
        cur+=verify(root->right);
        hash[cur]++;
        if(hash[cur]==2) res.push_back(root);
        return cur;
    }
```
编码结果：树的前序遍历，空节点用#表示，每个节点之间用逗号隔开，字符串最后没有逗号
比如[1,2,3,NULL,NULL,NULL,NULL]的编码为
1，2，#，#，3，#，#
****
[51.树中距离之和](https://leetcode-cn.com/problems/sum-of-distances-in-tree/submissions/)  
**思路**:
1. 将无根树看作以0为根的有根树，dfs更新出sum【u】(以u为结点的子树路径之和)和num【u】(以u为结点的子树节点数量，包括u自身)
2. 从0号结点开始bfs，逐渐扩展到子节点，每次根据公式求出当前结点的距离之和。公式：设u为当前结点，p为父节点，则sum【u】=sum【p】+N-2*num【u】。

****
[52.全排列Ⅱ](https://leetcode-cn.com/problems/permutations-ii/)  
**思路**：每一轮选择的时候不能选择重复的元素，例如这一轮已经选过10了，那么在之后的循环过程中如果又遇见10就不用再选了。
****
[53.子集Ⅱ](https://leetcode-cn.com/problems/subsets-ii/submissions/)  
**思路**：用一个哈希表记录nums中每一个数字num出现的次数tot，每一轮考虑放进数组中i(0<=i<=tot)个num  
**map的遍历**：  
- 使用迭代器：it->first是key，it->second是value。  
- auto自动遍历：(auto k:hash) k.first是key，k.second是value  
- 可以使用.size()查看当前键值对的个数  
****
[54.火柴拼正方形](https://leetcode-cn.com/problems/matchsticks-to-square/submissions/)  
就是《木棒》  
**剪枝**：  
- nums数字倒序排序，决策少的元素放在决策树的上面  
- 如果第一根木棒就拼接失败，直接返回false，样例：【 5,5,5,5,16,4,4,4,4,4,3,3,3,3,4】  
- 如果当前木棒拼接失败，跳过与当前木棒长度相同的所有木棒  
- 拼接正方形每一条边的时候规定木棒的长度从大到小：因为拼5，4和拼4，5其实是一样的，避免重复枚举  
****  
[55.二叉树着色游戏](https://leetcode-cn.com/problems/binary-tree-coloring-game/submissions/)  
- **核心思路**：蓝方每次的第一次选择要选红方第一次选择的父节点或者左右儿子，这三种情况中必有一种最优策略。    
- **思路**：先BFS找到红方第一次选择的点，然后分别求出**以该点为根节点的子树的节点个数**（选择该点父节点的情况），**以该点的左/右儿子为根节点的子树的节点数量**（选择该点左右儿子的情况）。   
****  
[56.最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses/submissions/)  
**有效括号序列的性质**：  把'('看作1,')'看作-1  
1. 【i,j】区间合法的充要条件是，任意的【i，k】{i<k<j} 区间和>0,并且【i，j】区间和==0
2. 如果【i，j】区间和<0，那么任意k{i<k<j},【k，j】不存在合法括号序列  
**注意**：本题需要正着做一遍，翻转后做一遍。因为对于((())这种情况，只是做一遍无法得到答案，需要翻转为(()))再做一遍。  
****
[57.滑动窗口最大值](https://leetcode-cn.com/problems/sliding-window-maximum/submissions/)  
**单调队列应用**：查找滑动窗口的最值  
**原理**：在左侧并且小的数一定不能成为答案，所以要维护单调递减的队列  
**实现细节**：
1. 单调队列中存储的是每一个数字的下标
2. 如果队头小于i-k+1,pop_front
3. 如果不是单调递减的，pop_back(类似单调栈)  
****
[58.环形子数组的最大和](https://leetcode-cn.com/problems/maximum-sum-circular-subarray/submissions/)
**思路**：把数组存环，求前缀和，每次找i前面长度为n的滑动窗口的最小值，前缀和相减得到区间和的最大值  
****
[59.和为k的子数组](https://leetcode-cn.com/problems/subarray-sum-equals-k/submissions/)  
**思路**：用hash记录每个前缀和出现的次数，对于当前前缀和pre，他对答案的贡献是hash[pre-k],即pre-k的前缀和出现的次数。注意维护hash即可。  
****
[60.将数据流变为多个不相交的区间](https://leetcode-cn.com/problems/data-stream-as-disjoint-intervals/submissions/)  
**思路**：L以每个区间的右端点为key，其对应的左端点为val，R相反。  
[题解:120min左右](https://www.bilibili.com/video/av65364193?from=search&seid=17562432300971643538)
**Map的STL用法**：无论是查找还是删除都是以key为标准。  
****