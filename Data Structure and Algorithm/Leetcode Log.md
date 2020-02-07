# 寒假DP专练  
[1.正则表达式匹配](https://leetcode-cn.com/problems/regular-expression-matching/submissions/)  
- 很多时候数组/字符串下标是从0开始的，但是dp的状态需要从1开始(让出0号位置)。这个时候最简单粗暴的办法就是把数组/字符串整体后移一位。  
- 判断0号位置的状态需不需要计算的方法：看有没有可能计算出来的结果与默认值不相同。  

**思路**：如果是\*那么f(i,j)的状态可以从f(i,j-2)转移(\*把之前的字符删掉)，也可以从f(i-1,j)转移(\*生成一个p[j-1]对应s[i]，剩余部分对应s[i-1],所以是f[i-1][j])  
**本题的两层循环**：  
```
for(int i=0;i<=N;i++){
            for(int j=1;j<=M;j++){
```  
之所以i从0开始取，是因为f(0,j)有可能是true(与默认值不同)，因为\*可以把之前的字符消掉，从而产生一个空字符串。  
[2.最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses/submissions/)  
本题的题解在leetcodeNote里，下面谈一些比较普适的东西。  
- 思考DP的误区：不要陷入："猜状态->状态转移->想不出来->换一个状态继续猜"的死循环。  
拿到问题首先应该分析问题本身，先不要刻意的去想状态设计与转移。  
- 如何思考状态转移：画树状图  

[3.通配符匹配](https://leetcode-cn.com/problems/wildcard-matching/submissions/)    
**字符串匹配问题可以作为DP的一种典型问题，[1和3联动]**  
和正则表达式匹配一题基本相同，?的匹配方式不变，\*可以匹配任意字符串，所以如果p[j]==\*,只要f[0][j-1]...f[i][j-1]中有一个是true，f[i][j]就是true。接下来需要考虑的就是如何快速得到f[0][j]...f[i][j]是否出现过true  
使用g[j]表示f[i][j]中出现过true的所有状态里最小的i。这样只要f[i][j]=i>=g[j-1]就可以了  
[4.编辑距离](https://leetcode-cn.com/problems/edit-distance/)  
**[1，3，4联动]**  
注意预处理：f[0][j]和f[i][0]。  
[5.扰乱字符串](https://leetcode-cn.com/problems/scramble-string/submissions/)  
本题提供了“两个字符串”设计状态的新思路，以前的认知是：f(i,j)表示第一个字符串前i个字符，第二个字符串前j个字符。  
本题提供的思路是f(len,i,j) 表示第一个字符串从i开始，第二个字符串从j开始，取长度均为len的子串，使用一个游标k从[i,i+len-1]中枚举  
至于本题具体是如何转移的，可以看下面两张图：  
第 1 种情况，参考下图： 假设左半部分长度是 q，dp [ len ][ i ] [ j ] = dp [ q ][ i ] [ j ] && dp [ len - q ][ i + q ] [ j + q ] 。
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200120100843.png)  
第 2 种情况，参考下图： 假设左半部分长度是 q，那么 dp [ len ][ i ] [ j ] = dp [ q ][ i ] [ j + len - q ] && dp [ len - q ][ i + q ] [ j ] 。
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200120100935.png)  
[6.交错字符串](https://leetcode-cn.com/problems/interleaving-string/submissions/)  
本题的状态设计与[5]中说的旧思路类似：f(i,j,k)表示s1前i个字符和s2前j个字符能否拼出s3前k个字符。  
## 股票问题  
f(i,j,k) 表示第i天，最多交易j次，持有股票(k=1)/不持有股票(k=0)的最大利润  
状态转移：
f(i,j,0)=max(f(i-1,j,0),f(i-1,j,1)+prices[i])  
f(i,j,1)=max(f(i-1,j,1),f(i-1,j-1,0)-prices[i])  
对于无穷交易次数，因为j-1=j,所以可省略j这一维。   

BaseCase的处理：特判处理：  
```
if(!i){
        if(j){
            f[i][j][1]=-prices[0];//第0天，买第0天的股票
        }
        else{
            f[i][j][1]=-INF;//第0天，交易次数是0，持有股票，不可能状态
        }
        continue;
    }
    if(!j){
        f[i][j][1]=-INF;//交易次数是0，持有股票，不可能状态
        continue;
    }
```  
[买卖股票的最佳时机Ⅱ](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/)  
[买卖股票的最佳时机Ⅲ](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iii/)  
[买卖股票的最佳时机Ⅳ](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iv/submissions/)  
[买卖股票的最佳时机含冷冻期](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/submissions/)  
[买卖股票的最佳时机含手续费](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/)  

由本题对DP的思考：  
- DP的状态转移之所以难写是因为状态设计的不好，具体而言，状态设计的约束不够强，使得可转移的选择太多，因此如果写不出转移方程，可以通过**添加状态**(**增加dp数组的维数**)，来写出转移方程。得到转移方程后再化简。  
- 对于BaseCase的处理三种方法：  
    - 错位(最优雅的方式)：假设原数组的下标从[0,n-1]变为了[1,n]，状态转移方程照常写，只不过nums[i]改为了nums[i-1]（对f数组下标的访问不必改变）。  
    - 特判：if(i==0){...continue;},适用于边界情况比较复杂的情形
    - 在数组首位置添加一个元素，物理错位。
 

[7.地下城游戏](https://leetcode-cn.com/problems/dungeon-game/)  
- 方格取数类问题设计状态,明确(i,j)表示取数之前。  
- code技巧：如果有多个转移来源，且多个转移来源都可能出界，一次更新一个来源。  
```
for(int i=N-1;~i;i--){
    for(int j=M-1;~j;j--){
        if(i+1<N){ 
            f[i][j]=min(f[i][j],f[i+1][j]-g[i][j]); //一次更新一个来源
        }
        if(j+1<M){
            f[i][j]=min(f[i][j],f[i][j+1]-g[i][j]); //一次更新一个来源
        }
        if(f[i][j]<=0) f[i][j]=1;
    }
}
```  
- 反向DP  
给定起点和终点的DP问题，设计状态除了从起点入手还可以从终点入手。  
本题设f(i,j)表示从(i,j)走到终点所需的最小健康值。  
[8.戳气球](https://leetcode-cn.com/problems/burst-balloons/)  
区间dp一定不要忘了枚举游标k  
设k是(i,j)最后一个被戳爆的气球  
[9.拼接最大数](https://leetcode-cn.com/problems/create-maximum-number/)  
f(i,j,t) 表示nums1前i个数字和nums2前j个数字拼成长度为t的最大的数字。  
状态转移：  
```
    if(i>0)
        f[i][j][t]=f[i][j][t].max(f[i-1][j][t].max((f[i-1][j][t-1].multiply(BigInteger.valueOf(10))).add(BigInteger.valueOf(nums1[i-1]))));
    if(j>0)
        f[i][j][t]=f[i][j][t].max(f[i][j-1][t].max((f[i][j-1][t-1].multiply(BigInteger.valueOf(10))).add(BigInteger.valueOf(nums2[j-1]))));
        
```  
[10.青蛙过河](https://leetcode-cn.com/problems/frog-jump/)  
注意区分石子编号和距离两个概念。  
f(i,j)表示从起点开始，最后一次跳跃的距离为j，能否到达第i号石子。  
本题有趣的地方在于其计算状态的方式。和一般的递推不同，本题采用宽搜的方式搜索有效的状态。如果搜索到了，就是合法的状态，如果没搜索到就说明该状态不合法。  
启示：一般的DP问题是计算min/max/种类数，遇到这种**是否**的DP问题，可以考虑使用宽搜搜索合法状态。
