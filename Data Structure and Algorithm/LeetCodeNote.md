[toc]
# top-K问题  
[合并k个排序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists/)  
**解法**：把所有链表中的数据插入到优先队列中，从而实现了边插入边排序  
[查找和最小的k对数字](https://leetcode-cn.com/problems/find-k-pairs-with-smallest-sums/)  
和寻找多个排序链表的前k小数字等价    
**解法**：先把所有链表头的数字放入堆中，每次取出top后，把top的后继节点放入堆中   

# BFS专题  
**堆优化**  

[接雨水Ⅱ](https://leetcode-cn.com/problems/trapping-rain-water-ii/)  
- **核心思路**：从外围开始向内部搜索，如果当前点比要搜索的点高，增加答案（可以接雨水），并且把转移的点的高度变为当前点的高度（装水以后该点高度增加）

- **注意**：即使当前点没有要搜索的点高，没有更新答案，也算是搜过这个点了，仍然需要改变vis数组，并把该点push到队列中

- **使用优先队列的原因**：如果不是按照从小到大的顺序来搜，那么如果先搜高的点就会把转移点的高度强行提到和高的点一样高，但是实际转移点可能达不到那么高（水会从其他方向流出去）  

[接雨水Ⅰ](https://leetcode-cn.com/problems/trapping-rain-water/)  
[水位上升的泳池游泳](https://leetcode-cn.com/problems/swim-in-rising-water/submissions/)  
- 使用优先队列BFS：通常情况下的搜索是盲目的枚举，但是如果使用优先队列优化，将更接近答案的元素赋予更大的优先级，这样每次取出队头，相当于搜索具有了指向性。
- 本题核心思路：本题中grid[i][j]越小越好，所以可以使用小根堆优化BFS  
# DFS专题  
[全排列Ⅱ](https://leetcode-cn.com/problems/permutations-ii/)  
**思路**：每一轮选择的时候不能选择重复的元素，例如这一轮已经选过10了，那么在之后的循环过程中如果又遇见10就不用再选了。  
**优化**：sort后预处理出next数组，如果i元素已经选过了，直接跳到next[i]。  
[子集Ⅱ](https://leetcode-cn.com/problems/subsets-ii/submissions/)  
**思路**：用一个哈希表记录nums中每一个数字num出现的次数tot，每一轮考虑放进数组中i(0<=i<=tot)个num  
**代码优化**：不用每次放进k个，再pop k个回溯，枚举完之后统一回溯就可以，要思考递归的具体过程。  
代码详见：[code](https://leetcode-cn.com/submissions/detail/43955768/) 

[火柴拼正方形](https://leetcode-cn.com/problems/matchsticks-to-square/submissions/)  
**剪枝**：  
- nums数字倒序排序，决策少的元素放在决策树的上面  
- 如果第一根木棒就拼接失败，直接返回false。 因为第i根木棒拼接失败，可以回溯，还有成功的机会，但是第一根木棒，失败就是失败了，没有机会。
- 如果当前木棒拼接失败，跳过与当前木棒长度相同的所有木棒  
- 拼接正方形每一条边的时候规定木棒的长度从大到小：因为拼5，4和拼4，5其实是一样的，避免重复枚举  

[路经总和Ⅱ](https://leetcode-cn.com/problems/path-sum-ii/)  
在当前节点不知道能不能搜到答案，可以先把当前节点装入path，如果最终确认是答案在放入res中   
# 贪心专题  
[雇佣k名工人的最低成本](https://leetcode-cn.com/problems/minimum-cost-to-hire-k-workers/submissions/)


- 双指标贪心的做法:如果贪心有两个指标（比如a,b），通常是按照a×b排序，或者a/b排序。可以使用交换法证明。但是稍微复杂的题目不可能这么简单就过。需要排完序后扫描一遍排序数组，每次考虑取第i个或者前i个，结合其他变量/条件更新出最优答案。  

- 解法：先按照：wage/quality排序，得到单位工作量的价格，这样总的费用就是单位工作量价格×总工作量。每次考虑以第i个人为单位价格的最大值，只需要让总工作量最小：所以需要一个大根堆，每当其容量超过K时，弹出堆顶元素。  

[最低加油次数](https://leetcode-cn.com/problems/minimum-number-of-refueling-stops/submissions/)  

## 最少线段覆盖问题  
最短线段覆盖问题的关键在于两个指针：**rightPos**和**maxRightPos**。它们之间的关系是：**maxRightPos是当前可达到的右端点的最大值，rightPos是实际达到的右端点，可以把maxRightPos理解为潜力。rightPos可以通过支付一次res从而达到maxRightPos**  
当然别忘了事先需要先按照左端点排序  
例题：[视频拼接](https://leetcode-cn.com/problems/video-stitching/) 

 

# 字符串专题  
> 字符串问题的技巧：  
>- 如果题目中声明字符串只包含a~z的小写字母，通常都需要使用cnt[26]数组计数。  
>- 字符串哈希  

[去除重复字母](https://leetcode-cn.com/problems/remove-duplicate-letters/submissions/)  
[题解](https://www.acwing.com/solution/LeetCode/content/93/)  
**贪心思路**：尽量维护一个单调递增的序列，除非要pop的字母已经没有了(cnt[x-'a']<=0)。  

**注意**：如果当前字母已经出现在res串中，cnt--后直接continue，跳过对该字母的处理。
因为res是递增的，当前字母如果已经出现在res串中，要么是在res串中间，要么在末尾，如果在末尾：处理和不处理结果一样，如果在串中间：处理后当前字母会变成串的末尾，情况只能变得更差。  

[划分字母区间](https://leetcode-cn.com/problems/partition-labels/submissions/) 

[最长重复字串](https://leetcode-cn.com/problems/longest-duplicate-substring/solution/zui-chang-zhong-fu-zi-chuan-by-leetcode/)  

## 字符串匹配问题  

[匹配子序列的单词数](https://leetcode-cn.com/problems/number-of-matching-subsequences/submissions/)  
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
## 回文串问题  
[回文串]("https://leetcode-cn.com/problems/palindrome-pairs/submissions/")  
[题解]("https://www.acwing.com/solution/LeetCode/content/363/")

判断两个字符串能否组成回文串的方法：枚举分割点：分成**左相等，右回文和左回文，右相等两种情况**  
**注意要分成两种情况，因为可能是ab这样拼也可能是ba这样拼**  
**代码细节**：由于枚举分界点的范围是0-n-1,所以如果words中一个回文串a和空字符串b，那么只会统计到{a,b}这种情况，但是会忽略{b,a}这种情况。所以需要事先遍历一遍，特判{b,a}这种情况。  
# 单调栈专题  
## 单调栈应用——定位下一个元素  
[柱形图中的最大矩形](https://leetcode-cn.com/problems/largest-rectangle-in-histogram/)  
- **单调栈的普通应用**：通过一次遍历找到一个元素左/右边第一个比它大/小的元素  
- **单调栈的进阶应用**：通过一次遍历找到一个元素左&&右边第一个比它大/小的元素  
进阶应用的缺陷：为了保证每个元素都能出栈，如果是找比该元素小的元素需要在数组末尾插入一个非常小的数；如果是找比该元素大的需要在数组末尾插入一个非常大的数。  
- **关于取等的问题**：  
进阶应用：弹栈是答案，所以如果找小/大于等于，就在while循环处加等号。
普通应用：弹栈不是答案，所以如果是找小/大与等于，while循环出不能加等号

[最大矩形](https://leetcode-cn.com/problems/maximal-rectangle/)  

**模板题**：[下一个更大的元素I](https://leetcode-cn.com/problems/next-greater-element-i/)

使用普通应用解：
```
vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        unordered_map<int,int>right;
        vector<int>res;
        stack<int> stk;
        const int n=nums2.size();
        for(int i=n-1;~i;--i)
        {
            while(stk.size()&&nums2[i]>nums2[stk.top()])
            {
                stk.pop();
            }
            right[nums2[i]]=stk.empty()?-1:nums2[stk.top()];
            stk.push(i);
        }
        for(auto x:nums1)
        {
            res.push_back(right[x]);
        }
        return res;
    }
```
使用进阶应用解：
```
vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        const int n=nums2.size();
        const int inf=0x3f3f3f3f;
        vector<int>res;
        stack<int> stk;
        nums2.push_back(inf);//为了保证每一个元素都能够出栈，需要在数组最后插入一个足够大的元素
        unordered_map<int,int> right;
        unordered_map<int,int> left;
        for(int i=0;i<=n;++i)
        {
            while(stk.size()&&nums2[i]>nums2[stk.top()])
            {
                int cur=stk.top();
                stk.pop();
                right[nums2[cur]]=nums2[i]==inf?-1:nums2[i];//cur右边第一个比它大的元素就是i
                left[nums2[cur]]=stk.empty()?-1:nums2[stk.top()];//cur左边第一个比它大的元素就是栈顶元素
            }
            stk.push(i);
        }
        for(auto x:nums1)
        {
            res.push_back(right[x]);
        }
        return res;
    }
```
[奇偶跳]("https://leetcode-cn.com/problems/odd-even-jump/submissions/")    
- **查找数组中第i个元素右侧比他大的元素中最小的那一个（或者比他小的元素中最大的那一个）的位置的方法**：argsort后找右边第一个index大于当前元素index的就是右侧比他大的元素中最小的那一个，左边第一个index大于当前元素的就是右侧比他小的元素中最大的那一个。  
- 代码细节：因为偶数跳的时候多个相同的值需要跳到最小的位置上去，所以需要分情况讨论：奇数情况值相同，index递增排序，偶数情况值相同index递减排序。
迭代器
 
## 单调栈应用——中缀表达式转化为后缀表达式  
首先定义栈内优先级和栈外优先级
||#|(|+-|*/|)|  
|----|----|----|----|----|----|  
|栈内优先级|0|1|3|5|6|  
|栈外优先级|0|6|2|4|1|  
如果当前元素优先级>栈顶元素，直接压栈，如果小于持续弹栈并输出，如果等于就弹栈不输出然后转到下一字符。  
[基本计算器](https://leetcode-cn.com/problems/basic-calculator/)

## 单调栈应用——在线处理数组问题  
[132模式](https://leetcode-cn.com/problems/132-pattern/submissions/)  
**算法的正确性**:因为stk中保存的数都是已经遍历过的，所以stk中的数字一定在当前数字的右边。即：stk的数字具有成为“3”的潜质（位置正确),当nums[i]>stk.top()时，可以更新three（因为满足2>3）

[移掉k位数字](https://leetcode-cn.com/problems/remove-k-digits/submissions/)  
**思路**:维护一个非递减栈，最终栈中剩下的就是答案字符串  
# 二叉树专题  
**二叉树的题目debug方法**：  
- 输出以root为根的情况，递归尽量避免单步跟踪调试  
- 把树画出来，画出来的方法是：层序遍历，空结点输出#。  

**二叉树题目常用的解法**：递归  
递归的关键点在于**设计递归函数的功能**。使用功能并维护功能
**二叉树题目的代码Trick**：将left和right整合成ch[2]  
[二叉树着色游戏](https://leetcode-cn.com/problems/binary-tree-coloring-game/submissions/)  
- **核心思路**：蓝方每次的第一次选择要选红方第一次选择的父节点或者左右儿子，这三种情况中必有一种最优策略。    
- **思路**：先BFS找到红方第一次选择的点，然后分别求出**以该点为根节点的子树的节点个数**（选择该点父节点的情况），**以该点的左/右儿子为根节点的子树的节点数量**（选择该点左右儿子的情况）。  

[二叉树的最近公共祖先](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/)  
这是一组题：  
（1）如果树是二叉搜索树：根据两个tar与root的大小关系递归查找  
（2）如果不是二叉搜索树但是有指向父节点的指针：等价于寻找两个链表的第一个相交节点  
（3）如果不是二叉搜索树也没有指向父节点的指针：先从root开始查找到两个tar的路径，然后转化为寻找两个链表的第一个相交节点  
[树中距离之和](https://leetcode-cn.com/problems/sum-of-distances-in-tree/comments/)  
**思路**:
- 将无根树看作以0为根的有根树，dfs更新出sum【u】(以u为结点的子树路径之和)和num【u】(以u为结点的子树节点数量，包括u自身)
- 从0号结点开始bfs，逐渐扩展到子节点，每次根据公式求出当前结点的距离之和。公式：设u为当前结点，p为父节点，则sum【u】=sum【p】+N-2*num【u】。  

[实现trie](https://leetcode-cn.com/problems/implement-trie-prefix-tree/submissions/)  
对trie的理解：**一个带有dummy头节点的多叉链表**   
## 两点问题  
即：从二叉树的任意一点到任意一点的题目  
**问题解法**：设计递归函数的功能为返回从root开始向左**或者**向右的值。在递归的过程中，更新答案。  
[二叉树中的最大路径和](https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/)  
[二叉树的直径](https://leetcode-cn.com/problems/diameter-of-binary-tree/submissions/)

## BST问题  
BST的定义：左子树的值都小于根节点，右子树的值都大于根节点，左右子树都是BST  
BST的性质：中序遍历单调递增  
[从二叉树到更大和树](https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/submissions/)  
因为二叉搜索树的中序遍历是一个递增的序列，所以如果按照右-根-左的顺序dfs，就是一个递减的序列。在遍历这个递减序列的过程中维护当前累加和sum即可。  
[恢复二叉搜索树](https://leetcode-cn.com/problems/recover-binary-search-tree/)  
[删除二叉搜索树的结点](https://leetcode-cn.com/problems/delete-node-in-a-bst/submissions/)  
[插入二叉搜索树的结点](https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/submissions/)  
[不同的二叉搜索树Ⅱ](https://leetcode-cn.com/problems/unique-binary-search-trees-ii/)    
## 树的序列化问题  

[从先序遍历还原二叉树](https://leetcode-cn.com/problems/recover-a-tree-from-preorder-traversal/)   
**思路**:先取出字符串中第一个数字作为根节点，然后把剩余字符串的每一个横线部分减一，并且将其分为左右两部分，递归生成左右子树  
[寻找重复的子树](https://leetcode-cn.com/problems/find-duplicate-subtrees/submissions/)  
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
比如[1,2,3,NULL,NULL,NULL,NULL]的编码为1，2，#，#，3，#，#  

[二叉树的序列化与反序列化](https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/submissions/)  
**比较特殊的树中递归写法**：从先序遍历序列字符串还原得到树的方法：每次把根节点处理出来，在递归处理左右子树，注意需要用index记录当前处理到字符串的哪一个位置。  

## 树的遍历问题  
使用非递归算法输出树的前中后序遍历序列  
[树的中序遍历](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)

# 并查集专题  
[等式方程的可满足性](https://leetcode-cn.com/problems/satisfiability-of-equality-equations/submissions/)  
[用斜杠划分区域](https://leetcode-cn.com/problems/regions-cut-by-slashes/submissions/)
[题解](https://blog.csdn.net/qq_17550379/article/details/85262219)

**做法**：把一个1x1的小块分成上下左右四个区域，**并且按照顺序给这些小块依次编号**。先根据符号合并这个小块，再合并1x1的小块上边的小块和左边的小块   
**思考**：**在二维棋盘中使用并查集的方法**：给每一个格子编号，即把二维矩阵顺序展开成为一维。  
[冗余连接](https://leetcode-cn.com/problems/redundant-connection/submissions/)  
[移除最多的同行或同列石头](https://leetcode-cn.com/problems/most-stones-removed-with-same-row-or-column/submissions/)  
- 本质：联通块题目，只不过不是上下左右相连而是同行同列相连  
- 并查集的使用：不是点与点之间组成并查集，而是行与列之间。因为最多10000行，所以可以用c+10000表示列  
# 数组专题  
  
[乘最多水的容器](https://leetcode-cn.com/problems/container-with-most-water/)  
双指针，木桶效应。如果height[i]< height[j],说明i制约答案，i++  
[旋转图像](https://leetcode-cn.com/problems/rotate-image/)  
旋转问题转化为若干次的对称  
先按主对角线对称一次，再以y轴对称一次  
[任务调度器](https://leetcode-cn.com/problems/task-scheduler/submissions/)  
本题思路比较巧妙。将一组设定为n+1个元素。这样做的好处是自然就满足了一个元素与它自身相隔至少n。  
于是用一个堆存储所有字母的出现次数，每次取出最大的前n+1个，将他们的次数减一再放回堆中。如果堆不为空，本轮对答案的贡献就是n+1，否则就是本轮取出的元素个数。   
[买卖股票的最佳时机含手续费](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/)  
- **数组下标从0开始的dp问题的coding trick**： f[i]不表示前i个或者以i结尾，而表示前i-1个或者以i-1结尾。这样做的好处是下标的范围从[0,n-1]变为了[1,n]。  
- 本题的思路：f(i)表示第i天仍然不持有股票的最大收益，g(i)表示第i天持有股票的最大收益  
- 初始化：g(0)=-∞,因为第-1天持有股票这个状态没有意义，要避免从它转移。   

  
[最长连续序列](https://leetcode-cn.com/problems/longest-consecutive-sequence/submissions/)  
[三数之和的多种可能](https://leetcode-cn.com/problems/3sum-with-multiplicity/submissions/)  
**收获**:
1. 对于数组长度比较长，但是数组中数据的大小比较小的时候，可以枚举数而不是枚举下标
2. 答案数比较大，需要返回取模的答案时，不要每次res+=x,再res%=mod,应该int delta=x%mod,再res=(res+delta)%mod
## 经典问题  
[超级丑数](https://leetcode-cn.com/problems/super-ugly-number/submissions/)  
[滑动窗口最大值](https://leetcode-cn.com/problems/sliding-window-maximum/submissions/)  
**原理**：在左侧并且小的数一定不能成为答案，所以要维护单调递减的队列  
**代码实现方法**：两部分  
(1)合法性维护：因为必须保证队列中的数字属于当前窗口，所以需要对i-q.front()的值进行判断  
(2)正确性维护：维护一个单调递减的序列  
```
vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        deque<int> q;
        vector<int> res;
        for(int i=0;i<nums.size();++i)
        {
             while(q.size()&&i-q.front()>=k)//合法性维护
                q.pop_front();
            while(q.size()&&nums[i]>=nums[q.back()])//正确性维护
            {
                q.pop_back();
            }
            q.push_back(i);
            if(i>=k-1)
            {
                res.push_back(nums[q.front()]);
            }
           
        }
        return res;
    }
```    
[环形子数组的最大和](https://leetcode-cn.com/problems/maximum-sum-circular-subarray/submissions/)  
**思路**：把数组存环，求前缀和，每次找i前面长度为n的滑动窗口的最小值，前缀和相减得到区间和的最大值  
[寻找重复数](https://leetcode-cn.com/problems/find-the-duplicate-number/submissions/)  
**思路**：二分的不是区间而是答案，所以从[1,n]开始二分，如果在[x,y]区间内的数字个数超过y-x+1那么在[x,y]内存在答案  
[在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)  
二分模板题   
[k个一组反转链表](https://leetcode-cn.com/problems/reverse-nodes-in-k-group/)
  
[颜色分类](https://leetcode-cn.com/problems/sort-colors/submissions/)  
经典的荷兰国旗问题，index1标志0的最后一个位置的下一个位置，index2标志2的第一个位置的前一个位置  
需要注意的是，如果当前位置是2(nums[i]==2)，在执行swap(nums[i],nums[index2])后只能index2--，而i不能++。因为i之后的位置是“不安全”的，交换后nums[i]可能是0，1，2中的任何一种，如果直接i++，就会会导致本来是1的区域混入未知元素。  
[数据流中位数](https://leetcode-cn.com/problems/find-median-from-data-stream/)
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
## n-sum问题  
**这类问题都是使用排序+双指针来做，本质上都是two-sum的升级版。只不过每一次指针的扫描区间不同。**  
类型题目：  
[三数之和](https://leetcode-cn.com/problems/3sum/)  
[四数之和](https://leetcode-cn.com/problemset/all/?topicSlugs=array&difficulty=%E4%B8%AD%E7%AD%89)     
[最接近的三数之和](https://leetcode-cn.com/problems/3sum-closest/)  

## 旋转数组问题  
>一.直观理解  

![](https://i.loli.net/2019/11/09/eZuVrpLlOzb3iGM.png)
>二.二分性质  

由图像可以看到，虚线左侧的所有元素都>=nums[0],虚线右侧的所有元素都< nums[0] (除了包含重复元素的情况中最右侧的一小段)  
>三.需要考虑的特殊情况  
nums[0]< nums.back() 即根本没有旋转的情况

类型题目  
[旋转数组的最小数字](https://www.acwing.com/problem/content/20/)  
[搜索旋转数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/description/)  
[搜索旋转数组Ⅱ](https://leetcode-cn.com/problems/search-in-rotated-sorted-array-ii/)  

## 萝卜填坑问题  
这类题目的基本原理就是把每一个数尽量放在其对应下标的位置上，最后从头到尾遍历一遍得到答案。  
算法：**如果当前位置的数字合法并且不应该放在当前位置，就把它调到它该去的位置上，如果它该去的位置上已经有合适的人选那就算了**  
>合法的含义：因为要把数字和下标对应起来，所以[0,n-1]的数组每个数字应该是[1,n]或者[0,n-1]的。

问：如果当前位置的数字不合法怎么办?  
答：因为他没有可去的地方，所以不用管，它的存在只是为了给有可去位置的数字腾地方。
核心代码：
```
for(int i=0;i<n;i++)
{
            
    while(nums[i]>=1&&nums[i]<=n&&nums[i]-1!=i)//如果数字合法并且不应该放在当前位置就尝试调换
    {
        if(nums[nums[i]-1]==nums[i])//如果已经有萝卜占坑就算了
        {
            break;
        }
        else swap(nums[nums[i]-1],nums[i]);//调换
        }
 }
```
类型题目有：  
[数组中重复的数据](https://leetcode-cn.com/problems/find-all-duplicates-in-an-array/)  
[找出数组中重复的数字](https://www.acwing.com/problem/content/description/14/)  
[缺失的第一个整数](https://leetcode-cn.com/problems/first-missing-positive/submissions/)  

## 数组跳跃问题  

每一组互相之间可达的数字构成一个等价类，可以使用并查集表示这种关系  

类型题目：  
[数组嵌套](https://leetcode-cn.com/problems/array-nesting/)  
[环形数组循环](https://leetcode-cn.com/problems/circular-array-loop/)  

## 子数组问题  
子数组问题常见解法：  
>(1)前缀和+哈希表  
>(2)双指针  
>(3)dp

一种特殊问题：  
>子数组区间最值问题  

### 前缀和例题  
[和为k的子数组](https://leetcode-cn.com/problems/subarray-sum-equals-k/submissions/)  
**思路**：用hash记录每个前缀和出现的次数，对于当前前缀和pre，他对答案的贡献是hash[pre-k],即pre-k的前缀和出现的次数。注意维护hash即可。   
[连续的子数组和](https://leetcode-cn.com/problems/continuous-subarray-sum/)  
**思路**：该题利用到的性质：两个前缀和相减为n倍的k等价于两个前缀和模k同余。  
[k次串联后最大子数字之和](https://leetcode-cn.com/problems/k-concatenation-maximum-sum/)    
本题的关键在于：**划分最终答案的可能情况**  
- 只使用一个数组  
- 使用1数组的最大后缀和+2数组的最大前缀和  
- 1数组的最大后缀和+(k-2)段完整数组+2数组的最大前缀和  

### 双指针例题  
[乘积小于k的子数组](https://leetcode-cn.com/problems/subarray-product-less-than-k/submissions/)   
### dp例题  
[分割数组以得到最大和](https://leetcode-cn.com/problems/partition-array-for-maximum-sum/submissions/)  
**思路**：以f(i)表示前i个元素分割得到的最大值，枚举最后一个区间的长度j从1到k
[最长湍流子数组](https://leetcode-cn.com/problems/longest-turbulent-subarray/submissions/)  
**思路**：首先预处理令A[i]=A[i]-A[i+1]。f(i)表示以i结尾的最长湍流子数组的长度  
### 区间最值问题
依次考虑数组中的每一个元素为区间最值，计算他对答案的贡献。这个过程中需要使用单调栈快速得出cur左/右第一个大于/小于cur的元素位置  
[子数组的最小值之和](https://leetcode-cn.com/problems/sum-of-subarray-minimums/submissions/)  
1. 大致思路：考虑每一个元素右边第一个比他小的元素的位置和第一个左边比他小的元素的位置，在这两个位置之间当前元素最小，用组合出的子集数量×该元素的值得到该元素对答案的贡献。全部累加得到最终的答案
2. 细节：  
    - 组合出的元素数目：假设该元素左边有x个元素比他大，右边有y个元素比它大，那么可以凑成的子集数量是：**x+y+xy+1**
    - 大于还是大于等于：如果求左&&右第一个小于等于当前元素的位置，那么对于含有重复元素的数据比如[3，4，5，3]那么【3，3】这个区间就没算。如果是求左&&右第一个严格小于当前元素的位置，那么【3，3】这个区间就算了两次。所以**解决方案**是左右两个区间一个是第一个严格小于当前元素的元素位置，一个是第一个小于等于当前元素的元素位置。这样就可以保证对于上面说的这种情况只算了一次。  

[区间子数组个数](https://leetcode-cn.com/problems/number-of-subarrays-with-bounded-maximum/submissions/)  
**思路**：依次考虑每一个点作为最大值的情况，找到当前点左侧第一个大于等于它的数和右侧第一个大于他的数。(之所以不是两边都大于或者两边都大于等于原因和上题相同)  
## 最长上坡问题  
[表现良好的最长时间段](https://leetcode-cn.com/problems/longest-well-performing-interval/submissions/)  
本质上是求一个最长上坡。求法：维护两个数组：minl[i]表示i向左最小的数，maxr[i]表示i向右最大的数。然后使用双指针扫描一遍  
## 改变数组中元素的解法  
>数组中的题目可以把数组中的元素进行改变，从而将原题目转化为区间和的问题

[连续数组](https://leetcode-cn.com/problems/contiguous-array/submissions/)  
**解法**：把0变成-1，则原题目转换为求一个最长的区间和为0的子数组。而区间和为0可以转换为前缀和相等。
[表现良好的最长时间段](https://leetcode-cn.com/problems/longest-well-performing-interval/)  

# 图专题  
[找到最终的安全状态](https://leetcode-cn.com/problems/find-eventual-safe-states/submissions/)  
**核心思路**：本题本质上是找出度为0的点。删掉当前出度为0的点然后再删新一轮出度为0的点。  
但是由于从终点找不到起点，所以采用该算法的等价实现：将图反向存以后拓扑排序。


![](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/17/picture1.png)  
[最小高度树](https://leetcode-cn.com/problems/minimum-height-trees/submissions/)  
**思路**：贪心删点，每一轮删除叶子节点，直至只剩下一个或者两个节点就是答案。（因为越外侧的点，度数越少的点越不可能是答案）  
**代码实现**：BFS的时候每次进行一轮  
## 搜环  
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
## 最短路算法  
从若干点到若干点的最短路  :[最短的桥](https://leetcode-cn.com/problems/shortest-bridge/submissions/)  
单源非负权最短路: dijkstra  
单源负权最短路: bellman-ford  
多源最短路: floyd  

# DP专题  
## 子序列问题  
#### 状态设计：结尾类型，范围类型  
结尾类型状态设计：f[i]表示以i为结尾的最值  
结尾类型状态转移：从i前面的元素转移过来，转移的过程中考虑使用数据结构优化查找前i个的速度  
范围类型状态设计：f(i)表示前i个元素中的最值//f(i,j)表示(i,j)范围内的最值  
范围类型状态转移：考虑f(i-1,j),f(i,j-1),f(i-1,j-1)  
[最长上升子序列](https://leetcode-cn.com/problems/longest-increasing-subsequence/submissions/)  
结尾类型模板题  
(N^2)做法：f[i]表示以i结尾的最长上升子序列的长度，已经很熟悉了，不再赘述  
**(NlogN)做法**：f[i]表示长度为i的上升子序列末尾最小的数，用cnt表示当前已经计算出的最长子序列长度，每次遇到当前的nums[i]，如果比nums[i]>f[cnt],说明nums[i]可以更新最长子序列的长度，f[++cnt]=nums[i],否则虽然nums[i]不能更新长度但是可以优化前面的f数组，二分查找第一个大于nums[i]的位置，f[r]=nums[i]  
[最长公共子序列](https://leetcode-cn.com/problems/longest-common-subsequence/submissions/)  
范围类型模板题  
状态设计：f(i,j)表示字符串1的前i个字符与字符串2的前j个字符的最长子序列长度  
状态转移：考虑f(i-1,j),f(i,j-1),f(i-1,j-1)  
[最长定差子序列](https://leetcode-cn.com/problems/longest-arithmetic-subsequence-of-given-difference/submissions/)  
结尾类型变形题  
使用哈希表优化到O(N)   
[最长递增子序列的个数](https://leetcode-cn.com/problems/number-of-longest-increasing-subsequence/)  
结尾类型变形题  
使用f[i]表示以i为结尾的最长子序列的长度，g[i]表示以i为结尾的，长度为f[i]的子序列的个数   
[最长回文子序列](https://leetcode-cn.com/problems/longest-palindromic-subsequence/submissions/)  
范围类型变形题  
f(i,j)表示【i,j】区间内最长回文子序列的长度,每次考虑f(i+1,j-1),f(i+1,j),f(i,j-1)  
**区间DP的枚举顺序**：先枚举区间长度，再枚举左端点  
[不同的子序列](https://leetcode-cn.com/problems/distinct-subsequences/submissions/)  
范围类型变形题  
**如果只用一维状态做不出来，考虑设计二维状态**  
f(i,j) 表示s串前i个字符中含有t串前j个字符组成的子序列的种类数  
[74.不同的子序列Ⅱ](https://leetcode-cn.com/problems/distinct-subsequences-ii/submissions/)  
范围类型变形题  
**状态设计**f(i)表示前i个字符的不同子序列个数  
**状态转移**  
如果不含重复字母，那么f(i)=f(i-1)*2(选或不选第i位)  
如果包含重复字母，需要减去f(last[S[i]-'a']-1),即上一次出现S[i]的位置的前一个位置的方案数  
因为比如[...,a,b,...,b],a之前(包括a)的所有子序列可以接在第一个b上，也可以接在第二个b上，所以需要减去f(a)   
本题的代码难点在于对于mod1e9+7的处理   
[最长等差数列](https://leetcode-cn.com/problems/longest-arithmetic-sequence/submissions/)  
结尾类型变形题   
对于二维dp，如果涉及到负数，为了避免数组越界，可以使用  
```
vector<unoredered_map<int,int>> f(n)  
```
来代替  
对该数据结构的理解：一个vector，里面存了许多k-v对，f[i]就是一个hash  
[等差数列划分 Ⅱ](https://leetcode-cn.com/problems/arithmetic-slices-ii-subsequence/)  
结尾类型变形题   
f(i,d)表示以A【i】为结尾的公差为d的方案数  
[题解](https://leetcode-cn.com/problems/arithmetic-slices-ii-subsequence/solution/deng-chai-shu-lie-hua-fen-ii-zi-xu-lie-by-leetcode/)  
[最长字符串链](https://leetcode-cn.com/problems/longest-string-chain/submissions/)    
结尾类型变形题     
注意：**string的排序是按照字典序的，不是按照长度的，并且sort的cmp函数需要为static类型**  
[78.编辑距离](https://leetcode-cn.com/problems/edit-distance/submissions/)  
插入对应f(i,j-1),删除对应f(i-1,j),替换对应f(i-1,j-1)  
**DP在code过程中的注意事项，如果数组在0处会超界，应该把0位置空出来，整体后移而不是直接加判断**  
>错误
```
int minDistance(string word1, string word2) {
        const int n=word1.size();
        const int m=word2.size();
        if(!n||!m) return max(m,n);
        const int inf =0x3f;
        vector<vector<int>>f(n,vector<int>(m,inf));
        f[0][0]=word1[0]!=word2[0];
        for(int i=0;i<n;++i)
        {
            for(int j=0;j<m;++j)
            {
                if(i>=1)f[i][j]=min(f[i-1][j]+1,f[i][j]);
                if(j>=1)f[i][j]=min(f[i][j-1]+1,f[i][j]);
                if(i>=1&&j>=1)f[i][j]=min(f[i][j],f[i-1][j-1]+(word1[i]!=word2[j]));
                //printf("f[%d][%d]=%d",i,j,f[i][j]);
            }
        }
        return f[n-1][m-1];
    }
```
>正确
```
int minDistance(string word1, string word2) {
        const int n=word1.size();
        const int m=word2.size();
        if(!n||!m) return max(m,n);
        const int inf =0x3f;
        vector<vector<int>>f(n+1,vector<int>(m+1,inf));
        for(int i=0;i<=n;++i)
            f[i][0]=i;
        for(int j=0;j<=m;++j)
            f[0][j]=j;
        for(int i=1;i<=n;++i)
        {
            for(int j=1;j<=m;++j)
            {
                f[i][j]=min(f[i-1][j]+1,f[i][j]);
                f[i][j]=min(f[i][j-1]+1,f[i][j]);
                f[i][j]=min(f[i][j],f[i-1][j-1]+(word1[i]!=word2[j]));
                //printf("f[%d][%d]=%d",i,j,f[i][j]);
            }
        }
        return f[n-1][m-1];
    }
```    
## 最小覆盖问题  
[最小的必要团队](https://leetcode-cn.com/problems/smallest-sufficient-team/submissions/)  
#### (一)
**求最小覆盖问题的解法**：状压DP  
**思路**：每一种技能标号为i，j表示一个技能列表。f[j]表示覆盖这个技能列表所需要的最小人数。每次考虑用第i个人去优化当前所有的状态  
#### (二)  
**记录DP最优方案的方法**：通常情况下dp数组保存的都是max/min/cnt，不会记录具体的方案，所以需要另外一个辅助数组。  
g[k]=pair(i,j) 表示从j状态通过i转移到k，这样从答案的下标出发一直迭代就可以找出最优答案  
```
for(int j=(1<<m)-1;j>0;j=g[j].second)
{
    res.push_back(g[j].first);
}  
```  
****
[最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses/submissions/)  
虽然说通常括号匹配的题目使用栈来做，但是本题使用DP更加简单，设f[i]是以i结尾的最长合法序列长度  
先处理嵌套的问题：
```
if(i-f[i-1]-1>=0&&s[i-f[i-1]-1]=='(')
    f[i]=f[i-1]+2;
```
再处理并列的问题
```
if(i-f[i]>=0&&s[i-f[i]]==')')
    f[i]+=f[i-f[i]];
```  
[石子游戏Ⅱ](https://leetcode-cn.com/problems/stone-game-ii/submissions/)  
min-max问题的状态设计:**f(i,j)状态下先手能取得的最大值**   
min-max问题的状态转移:**己方能取得的最大值=总分数-对手能取得的最大值(因为双方都足够聪明)**  