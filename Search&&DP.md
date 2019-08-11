<font size="5" face="黑体">

[1.可达性统计](https://www.acwing.com/problem/content/166/)

-  核心思路

拓扑排序后倒序递推  
f(i)表示i能够到达所有点的集合，那么f(i,j)表示能否从i到j

- 拓扑排序  
作用：
将一张DAG转化为一个序列，该序列的每一个点都只能指向它后面的点  
流程：找入度为0的点-->输出并删边-->重复  
模板：
``` 
inline vector<int> topsort()//拓扑排序的模板
{
	queue<int> q;
	vector<int>res;
	for (int i = 1; i <= N; i++)
	{
		if (!R[i])
		{
			q.push(i);
		}
	}
	while (q.size())
	{
		auto s = q.front();
		q.pop();
		res.push_back(s);
		for (auto next : g[s])
		{
			if (--R[next] == 0)
			{
				q.push(next);
			}
		}
	}
	return res;
}
```
- bitset
作用：表示一个集合，通过压位，将一个集合转化为一个bitset
优点：省空间
常用操作：.count():表示该集合中有多少个1

****
[2.小猫爬山](https://www.acwing.com/problem/content/167/)
- >**dfs的debug技巧：**在dfs函数体最前面输出搜索到当前层时的各个参数
>例如：
```
void dfs(int a,int b)
{
	cout<<"	a:"<<a<<" b:"<<b<<endl; 
	...
	...//dfs内容
}
```
- n个人分成m组的搜索问题第一种写法：
>  先确定n个人的排列顺序，然后按照顺序依次考虑每个人放进某一个组中（以人为核心）即：不管怎样一定要先将这个人放到某一个组里
- 本题的优化：应该优先考虑决策少的元素，本题重量越大的猫，决策越少（可以放进的组越少），所以应该先将猫按照重量从大到小排序，然后从1到n考虑每只猫放进哪一个组。
-****
[3.木棒](https://www.acwing.com/problem/content/169/)
- n个人选m组的dfs另一种写法：
>依次考虑将若干个人放进一组（以组为核心）即：不管怎样一定要先把该组的人数填满
- 本题的优化：同上题，应该尽量把决策少的元素放在决策树的上面
- ****
[4.生日蛋糕](https://www.acwing.com/problem/content/170/)
- **双变量DFS：**本题每一层蛋糕的r和h都是不确定的，所以与一般的dfs问题不同，需要先确定r和h的范围然后双重for循环枚举再dfs。确定范围的方法:先找到不等式，放缩得到第一个变量的范围，然后根据第一个变量的范围确定第二个变量的范围:
![](https://i.loli.net/2019/07/17/5d2e7780b45fe86201.png)
- **搜索问题常用的优化三板斧：**
>（1）搜索顺序（先考虑决策少的元素）
>（2）最优性剪枝
>（3）可行性剪枝（因题而异，简单来说就是在当前层找到一种方法判断已经不可能搜出答案了）
****
[5.送礼物](https://www.acwing.com/problem/content/173/)
**核心思路：**先搜索前一半能够凑出的不超过m的数量集合，并排序，去重，在搜索后一半与前一半相加。这样的好处是：因为搜索时指数增长的时间复杂度，2^N>>2^(N/2)*2

> *unique泛型算法：*
> unique(v.begin(),v.end())（vector）
> unique(nums+1,nums+1+N)(array)
> 作用：去除相邻的重复元素，所以使用前需要先排序。注意unique函数并不是把重复的元素删除了，只是放在了数组的末尾.该函数返回去重后新数组的末尾迭代器，如果想删除重复元素可以：
> auto it = unique(v.begin(), v.end());
> weights.erase(it, v.end());
****

[6.矩阵距离](https://www.acwing.com/problem/content/175/)
**思考过程**：这道题一开始就想到了宽搜，但是一开始想的是以每一个1为起点向外进行扩展，这样的话每一个点都搜一遍时间复杂度暴大，正解应该是一次性把所有1都加入队列中，然后统一进行宽搜。
**可转移的条件：**搜索四个方向时：
>(1)如果mapp[nr][nc]是1，continue（1没有必要搜索）
>(2)(nr,nc)的ns应该小于ans[nr][nc]

****
[7.装满的油箱](https://www.acwing.com/problem/content/178/)
**拆点：**把每个城市拆为C个，每一个点(i,j) i:城市编号 j:汽车到达该城市时的剩余油量
**dijkstra：**拆点后可以使用dijkstra，每次转移，要么就到达一个下一个城市（前提油够并且是最短“路”），要么就加1升油（前提油箱不满并且是最短“路”）
****