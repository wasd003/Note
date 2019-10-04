{"objectClass":"NSDictionary","root":{"objectClass":"MindNode","ID":"D81Y0","rootPoint":{"objectClass":"CGPoint","x":314.8,"y":2150.6875},"lineColorHex":"#BBBBBB","children":{"0":{"objectClass":"MindNode","ID":"2TGVM","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"28L7X","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"U28RB","lineColorHex":"#DC306C","text":"push"},"1":{"objectClass":"MindNode","ID":"CJU6X","lineColorHex":"#DC306C","text":"top"},"2":{"objectClass":"MindNode","ID":"RH5X3","lineColorHex":"#DC306C","text":"pop"},"objectClass":"NSArray"},"text":"//降序队列\npriority_queue <int,vector<int>,greater<int> > q;（一定要有空格）"},"1":{"objectClass":"MindNode","ID":"U49C0","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"9D3J5","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"81511","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"553QP","lineColorHex":"#DC306C","text":"删除所有值为val的元素"},"objectClass":"NSArray"},"text":"erase(val)"},"1":{"objectClass":"MindNode","ID":"414RE","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"246NX","lineColorHex":"#DC306C","text":"删除一个值为val的元素"},"objectClass":"NSArray"},"text":"erase(find(val))"},"2":{"objectClass":"MindNode","ID":"IVNBF","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"NY833","lineColorHex":"#DC306C","text":"s.erase(s.find(*s.rbegin()));"},"objectClass":"NSArray"},"text":"删除末尾元素（等效于pop）"},"objectClass":"NSArray"},"text":"删除"},"1":{"objectClass":"MindNode","ID":"ZBLFR","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"1M3WN","lineColorHex":"#DC306C","text":"*s.rbegin()"},"objectClass":"NSArray"},"text":"取末尾元素（等效于top）"},"2":{"objectClass":"MindNode","ID":"XUU40","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"M55WV","lineColorHex":"#DC306C","text":"迭代器"},"1":{"objectClass":"MindNode","ID":"21Y76","lineColorHex":"#DC306C","text":"auto自动遍历"},"objectClass":"NSArray"},"text":"遍历"},"objectClass":"NSArray"},"text":"multiset<int>"},"2":{"objectClass":"MindNode","ID":"DC3MG","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"P8J8K","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"U2D37","lineColorHex":"#DC306C","text":" struct node\n    {\n      int r;\n      int c;\n      int h;\n      node(int r,int c,int h):r(r),c(c),h(h){}\n        \n    };\n    struct cmp//优先队列重写仿函数\n    {\n      bool operator()(const node&a,const node&b)\n      {\n          return a.h>b.h;\n      }\n    };\npriority_queue<node,vector<node>,cmp>Q;"},"objectClass":"NSArray"},"text":"重写仿函数"},"objectClass":"NSArray"},"text":"自定义比较"},"objectClass":"NSArray"},"text":"优先队列（本质是自动排序的数据结构）"},"1":{"objectClass":"MindNode","ID":"4LBT6","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"IP0W3","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"833D9","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"F481L","lineColorHex":"#26BBFF","text":"遍历一遍：查找一个数组中一个数字往左/右比该数大/小的第一个数字/数字的位置"},"objectClass":"NSArray"},"text":"基本应用"},"1":{"objectClass":"MindNode","ID":"T3825","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"ID18E","lineColorHex":"#26BBFF","text":"遍历一遍：查找一个数组中一个数字往左&&右比该数大/小的第一个数字/数字的位置"},"objectClass":"NSArray"},"text":"进阶应用"},"2":{"objectClass":"MindNode","ID":"XE6K7","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"JHGGV","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"Y5LRE","lineColorHex":"#26BBFF","text":"argsort后等效于基本应用"},"objectClass":"NSArray"},"text":"查找数组中第i个元素左/右侧比他大的元素中最小的那一个（或者比他小的元素中最大的那一个）的位置"},"objectClass":"NSArray"},"text":"变形应用"},"objectClass":"NSArray"},"text":"作用"},"1":{"objectClass":"MindNode","ID":"4C008","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"2C3S8","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"06QNJ","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"56AW9","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"51ZJ6","lineColorHex":"#26BBFF","text":"维护方法：如果当前数比栈顶元素大（或者等于），那么就一直出栈，直到比栈顶元素小"},"objectClass":"NSArray"},"text":"所以：倒序遍历数组，保证栈是严格单调递减的（等于也不行）"},"objectClass":"NSArray"},"text":"分析：如果a在b的右边并且a比b小，那么a一定不是答案"},"objectClass":"NSArray"},"text":"以查找数组中某一个数向右比该数大的第一个数字为例"},"objectClass":"NSArray"},"text":"原理"},"2":{"objectClass":"MindNode","ID":"515U2","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"5K64W","lineColorHex":"#26BBFF","text":"leetcode496，下一个元素I"},"objectClass":"NSArray"},"text":"模板题"},"3":{"objectClass":"MindNode","ID":"ZNY6L","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"GY4WB","lineColorHex":"#26BBFF","text":"如果是查找小于等于/大于等于while处加等号，否则不加"},"objectClass":"NSArray"},"text":"取等问题"},"objectClass":"NSArray"},"text":"单调栈"},"2":{"objectClass":"MindNode","ID":"6BTXW","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"LB7G3","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"4NW02","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"17877","lineColorHex":"#37C45A","text":"直接输出"},"objectClass":"NSArray"},"text":"遇到数字"},"1":{"objectClass":"MindNode","ID":"476W5","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"4T93G","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"R1RW9","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"9W762","lineColorHex":"#37C45A","text":"直接入栈"},"objectClass":"NSArray"},"text":"优先级递增（栈顶元素优先级小于当前元素优先级）并且当前元素不是右括号"},"1":{"objectClass":"MindNode","ID":"61L91","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"K61OC","lineColorHex":"#37C45A","text":"栈顶元素出栈并输出"},"objectClass":"NSArray"},"text":"优先级递减"},"2":{"objectClass":"MindNode","ID":"85243","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"R1637","lineColorHex":"#37C45A","text":"栈顶元素出栈并且不输出，如果栈顶元素是'('，跳出循环"},"objectClass":"NSArray"},"text":"优先级不变"},"objectClass":"NSArray"},"text":"赋予每个元素优先级：'('栈内优先级：1，栈外优先级6，')'相反。'+','-'栈内优先级是3，栈外优先级是2。'*','/'栈内优先级是5，栈内优先级是4。'#'的栈内栈外优先级都是0"},"objectClass":"NSArray"},"text":"遇到符号"},"2":{"objectClass":"MindNode","ID":"FWTH2","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"WXS0T","lineColorHex":"#37C45A","text":"栈中先加入'#',字符串最后也要添加'#'"},"objectClass":"NSArray"},"text":"预处理"},"objectClass":"NSArray"},"text":"将中缀表达式转换成后缀表达式"},"1":{"objectClass":"MindNode","ID":"73FHH","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"U126V","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"638WQ","lineColorHex":"#37C45A","text":"直接压栈"},"objectClass":"NSArray"},"text":"遇到数字"},"1":{"objectClass":"MindNode","ID":"6LWO6","lineColorHex":"#37C45A","children":{"0":{"objectClass":"MindNode","ID":"566BL","lineColorHex":"#37C45A","text":"第一个弹出的数是x，第二个弹出的数是y，压入(y operator x)"},"objectClass":"NSArray"},"text":"遇到操作符"},"objectClass":"NSArray"},"text":"计算后缀表达式"},"objectClass":"NSArray"},"text":"栈的应用","linkPaths":{"0":{"objectClass":"NodeLinkPath","ID":"4LBT6","ctrlPoint":{"objectClass":"CGPoint","x":0,"y":0}},"objectClass":"NSArray"}},"3":{"objectClass":"MindNode","ID":"7866R","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"G0D2A","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"732K3","lineColorHex":"#FFC700","text":"中序遍历是一个有序序列"},"objectClass":"NSArray"},"text":"搜索二叉树"},"1":{"objectClass":"MindNode","ID":"63AQG","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"38540","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"WU64Q","lineColorHex":"#FFC700","text":"判断两棵树互为镜像的方法：根节点值相同且a树的左子树与b树的右子树互为镜像，a树的右子树与b树的左子树互为镜像"},"objectClass":"NSArray"},"text":"递归：判断两颗子树是否互为镜像"},"1":{"objectClass":"MindNode","ID":"88RH1","lineColorHex":"#FFC700","text":"迭代：类BFS，注意插入点的顺序"},"objectClass":"NSArray"},"text":"镜像二叉树的判断"},"2":{"objectClass":"MindNode","ID":"F4416","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"O62G1","lineColorHex":"#FFC700","text":"模板题：LeetCode DS 9. 《二叉树中的最大路径和》&&《二叉树的直径》"},"objectClass":"NSArray"},"text":"从二叉树的任意节点到任意节点的路径问题"},"3":{"objectClass":"MindNode","ID":"66R55","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"J52PI","lineColorHex":"#FFC700","children":{"0":{"objectClass":"MindNode","ID":"OJ7N0","lineColorHex":"#FFC700","text":"模板题：50.寻找重复的子树"},"objectClass":"NSArray"},"text":"编码：将树转化为字符串"},"objectClass":"NSArray"},"text":"判断两颗二叉树是否相等的方法"},"objectClass":"NSArray"},"text":"二叉树"},"4":{"objectClass":"MindNode","ID":"N1444","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"TRCJL","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"67PSV","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"K283C","lineColorHex":"#DC306C","text":"考虑的方法：题目是否涉及对于头节点的处理"},"objectClass":"NSArray"},"text":"是否需要使用dummy节点"},"objectClass":"NSArray"},"text":"拿到链表的题目第一时间考虑"},"1":{"objectClass":"MindNode","ID":"N432E","lineColorHex":"#DC306C","text":"可以使用诸如:one,two,three,four把所有涉及到的结点都保存下来"},"2":{"objectClass":"MindNode","ID":"CKHU4","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"3ZE58","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"83783","lineColorHex":"#DC306C","text":"用路程的观点处理"},"objectClass":"NSArray"},"text":"相交链表"},"1":{"objectClass":"MindNode","ID":"HR2C6","lineColorHex":"#DC306C","children":{"0":{"objectClass":"MindNode","ID":"JUEOY","lineColorHex":"#DC306C","text":"（1）是否有环；快指针一次走两步，慢指针一次走一步，如果快慢指针相遇则说明有环，如果在相遇之前发现fast已经走到链表尽头，说明无环"},"1":{"objectClass":"MindNode","ID":"9258N","lineColorHex":"#DC306C","text":"（2）查找环的出口，当fast与slow相遇后，把其中一个指针移到head处，接下来两个指针同步走，一次一步，相遇处即为环的出口\n证明：设起点为a，环的入口为b，第一次相遇点为c。"},"objectClass":"NSArray"},"text":"快慢指针法判断链表中是否有环以及查找环的入口"},"objectClass":"NSArray"},"text":"经典题目"},"objectClass":"NSArray"},"text":"链表"},"5":{"objectClass":"MindNode","ID":"W174D","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"QX672","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"L568S","lineColorHex":"#26BBFF","text":"lower_bound:返回的是等于或者比tar大一点点的元素的迭代器"},"1":{"objectClass":"MindNode","ID":"P4IV5","lineColorHex":"#26BBFF","text":"upper_bound:返回的是比tar大一点点的元素的迭代器"},"2":{"objectClass":"MindNode","ID":"XNPN6","lineColorHex":"#26BBFF","text":"与一般的泛型算法中的upper/lower_bound不同的是：set中的二分查找不需要传容器的迭代器，只需要传查找的元素"},"objectClass":"NSArray"},"text":"set和multiset中的二分查找"},"1":{"objectClass":"MindNode","ID":"5RB84","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"684IC","lineColorHex":"#26BBFF","text":"unique(v.begin(),v.end())（vector）"},"1":{"objectClass":"MindNode","ID":"XN836","lineColorHex":"#26BBFF","text":"unique(nums+1,nums+1+N)(array)"},"2":{"objectClass":"MindNode","ID":"Q5RE8","lineColorHex":"#26BBFF","text":"作用：去除相邻的重复元素，所以使用前需要先排序。注意unique函数并不是把重复的元素删除了，只是放在了数组的末尾.该函数返回去重后新数组的末尾迭代器。"},"objectClass":"NSArray"},"text":"去重函数：unique"},"2":{"objectClass":"MindNode","ID":"2UM75","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"APNJX","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"9SE76","lineColorHex":"#26BBFF","text":"在it迭代器前插入元素num。如果要在头部插入it=v.begin()"},"objectClass":"NSArray"},"text":"vector任意位置插入：v.insert(it,num) "},"1":{"objectClass":"MindNode","ID":"03R13","lineColorHex":"#26BBFF","text":"使用迭代器倒序访问vector：因为v.end()指向的是最后一个元素后面的位置，所以应该是it=v.end()-1，而不是v.end()"},"objectClass":"NSArray"},"text":"vector插入"},"3":{"objectClass":"MindNode","ID":"458N4","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"Q8K68","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"H3Z82","lineColorHex":"#26BBFF","text":"it->first是key，it->second是value"},"objectClass":"NSArray"},"text":"迭代器"},"1":{"objectClass":"MindNode","ID":"45W5Y","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"5J64A","lineColorHex":"#26BBFF","text":"x.first是key，x.second是value"},"objectClass":"NSArray"},"text":"自动遍历（for auto x:hash）"},"2":{"objectClass":"MindNode","ID":"VF9A1","lineColorHex":"#26BBFF","text":"可以使用.size()查看当前容器内键值对的个数"},"3":{"objectClass":"MindNode","ID":"UJS9J","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"178H6","lineColorHex":"#26BBFF","text":"返回key大于等于val的第一个键值对的迭代器"},"objectClass":"NSArray"},"text":"lower_bound(int val)"},"4":{"objectClass":"MindNode","ID":"4S0S6","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"TQD56","lineColorHex":"#26BBFF","text":"如果有以val为key的键值对返回1，否则返回0"},"objectClass":"NSArray"},"text":"count(int val)"},"5":{"objectClass":"MindNode","ID":"VS83M","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"33FD5","lineColorHex":"#26BBFF","text":"删除以val为key的键值对"},"objectClass":"NSArray"},"text":"erase(int val)"},"objectClass":"NSArray"},"text":"map遍历"},"objectClass":"NSArray"},"text":"STL使用"},"6":{"objectClass":"MindNode","ID":"3B5WK","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"3NS1S","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"94835","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"93SE2","lineColorHex":"#BF58F5","text":"左相等，右回文"},"1":{"objectClass":"MindNode","ID":"Y22CV","lineColorHex":"#BF58F5","text":"左回文，右相等"},"objectClass":"NSArray"},"text":"枚举分割点"},"objectClass":"NSArray"},"text":"判断两个字符串能否拼成一个回文串的方法"},"1":{"objectClass":"MindNode","ID":"KOQWO","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"26E59","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"9E0LF","lineColorHex":"#BF58F5","text":"模板题：最长重复字串"},"objectClass":"NSArray"},"text":"字符串编码"},"objectClass":"NSArray"},"text":"判断两个字符串是否相等"},"2":{"objectClass":"MindNode","ID":"LCK7J","lineColorHex":"#BF58F5","text":"判断一个字符串是否是另一个字符串的子序列"},"3":{"objectClass":"MindNode","ID":"3KL19","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"9L422","lineColorHex":"#BF58F5","text":"一般需要count[26]，记录每个字母出现的次数"},"objectClass":"NSArray"},"text":"如果题目中说明字符串中只包含'a'~'z'"},"objectClass":"NSArray"},"text":"字符串"},"7":{"objectClass":"MindNode","ID":"22FW1","lineColorHex":"#BF58F5","children":{"0":{"objectClass":"MindNode","ID":"PD73W","lineColorHex":"#BF58F5","text":"实现：leetcode_DS 40题"},"objectClass":"NSArray"},"text":"trie"},"8":{"objectClass":"MindNode","ID":"RHJBW","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"K25EF","lineColorHex":"#26BBFF","children":{"0":{"objectClass":"MindNode","ID":"DYFYH","lineColorHex":"#26BBFF","text":"例题一","url":"https://leetcode-cn.com/problems/subarray-sum-equals-k/submissions/"},"1":{"objectClass":"MindNode","ID":"Z00IW","lineColorHex":"#26BBFF","text":"例题二","url":"https://leetcode-cn.com/problems/continuous-subarray-sum/"},"objectClass":"NSArray"},"text":"连续的子数组之和问题(与哈希表配合使用)"},"objectClass":"NSArray"},"text":"前缀和"},"objectClass":"NSArray"},"text":"常用数据结构"}}