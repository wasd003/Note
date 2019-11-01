<font size="5" face="黑体"/>

<center><h2>5.6 try语句块和异常处理</h2></center>
											   
###一.常用异常处理套路  
**try->throw->catch**

示例：
```
try
{
	if(s1.isbn()!=s2.isbn())
	{
		throw runtime_error("isbn号必须相同");
	}
	cout<<"成功"<<endl;
}
catch(runtime_error err)
{
	cout<<err.what()<<endl;
}
```
>.what()是标准异常类的成员函数，返回的是一个c风格字符串（const char*），里面的内容是初始化该对象时使用的字符串（本例就是isbn号必须相同）

<center><h2>6.5特殊语言特性</h2></center>  

###一.默认参数函数  
注意：一旦某个形参被赋予了默认值，其右侧所有的形参也必须被赋予默认值
设计：调整形参的顺序，将经常使用默认值的参数放在后面

###二.内联函数和constexpr函数  
*内联函数*:在函数返回值之前加上inline即可  
*constexpr函数*:对于那些在编译期就可以确定返回值的函数加上constexpr关键字可以使编译器优化。  
注意：即便该函数并不返回字面值常量编译器也不会报错。

>多文件编写时内联函数和constexpr的定义通常写在.h文件中

###三.assert断言  
在程序执行到某处时，程序员相信此时一些值应该是多少，这时可以启用assert断言，如果这些值超出预期，就终止程序。assert(f),如果f是true，继续执行程序，如果f是false，终止程序，抛出异常  
>频繁的使用assert会造成很大的开销，可以在#include&lt;cassert&gt;之前#define NDEBUG禁止对assert的断言检测


###四.常量成员函数  
在函数的参数列表后加上const即可将普通成员函数变为常量成员函数  
常量成员函数的好处：常量对象或者其引用或者指向它的指针不能调用普通的成员函数，但可以调用常量成员函数。将函数声明为常量成员函数可以提高程序的灵活性  
**注意**：
**（1）常量成员函数不能修改类的数据成员**  
**（2）常量成员函数如果定义在类的外面，则参数列表后的const不可省略**
总结：如果成员函数不涉及修改类的数据成员的操作，则可以将其声明为常量成员函数


###五.默认拷贝  
两个对象的默认拷贝（赋值）就是把对象中的每一个数据成员都赋值给赋值给另一个对象。如果对象中不包含指针，使用默认的拷贝就可以了

<center><h2>7.2 访问控制与封装</h2></center>

###一.友元的声明  
友元的声明和普通意义上的声明是两回事，友元的声明只是为了取得访问权限，它不能代替普通意义上的函数或者类的声明。所以即使声明了友元函数，
为了使该函数在当前可见，仍需声明一遍
例如：
```
struct X
{
	friend void f();
	X(){f();}//错误，f还未声明
	void g();
	void h();
};
void X::g()
{
	f();//错误，f还未声明
}
void f();
void X::h()
{
	f();//正确，f已经声明
}
```
有的编译器并不需要再声明一遍，但是为了安全起见还是再声明一遍的好

<center><h2>7.3 类的其他特性</h2></center>  

###一.类中使用别名
在类中可以使用typedef来使用别名，这个typedef的作用域仅在类内。
注意：必须在使用别名之前声明typedef

###二.可变数据成员
将类中的数据成员设为可变的，则在const函数中也可以改变该变量的值
例如：mutable int a;

###三.类中不可以有该类类型的对象，但是可以有指向该类类型的指针，因为普通数据成员不允许是不完整的类型
例如：
```
class test
{
public:
	test* ax;//正确
	test bx;//错误，因为此时test还未定义完成，属于不完整的类型
};
```
关于这一点最简单的例子就是链表ListNode结构体  
```
class ListNode{
	int val;
	ListNode* next;
}
```


<center><h2>7.5          构造函数再探</h2></center>  

###一.常量&&引用只能用列表初始化  
类中的数据成员如果是const或者引用或者某种为提供默认构造函数的类型，则它必须使用初始化列表进行初始化，不能够在构造函数的函数体中进行赋值  
###二.初始化顺序  
初始化的顺序取决于数据成员在类中的定义顺序而不取决于它们在初始化列表中的顺序。在写构造函数的时候尽量按照定义顺序去写初始化列表	  				   
###三.委托构造函数  
在B构造函数的初始化列表调用A构造函数，则B构造函数称为委托构造函数
例如：
```
class test
{
public:
	test(int a,int b,int c):a(a),b(b),c(c){}
	test() :test(0,0,0){}
private:
	int a;
	int b;
	int c;
};
```
注意：这是c++11中的新特性，所以在vs2012中编译不通过
###四.隐式类型转换和explicit关键字
**一个函数如果需要类对象作为参数，并且这个类包含单一参数的构造函数（注意必须是单一参数），那么可以直接将这个参数作为函数的参数，编译器会自动调用类的单一参数构造函数临时创建一个类的对象。这个过程叫做隐式类型转换**  

例如：
```
class test
{
public:
	test(int a) :a(a), b(0), c(0),d("") {}//单一参数的构造函数
private:
	int a;
	int b;	
	int c;
	string d;
};
void f(const test&a)//需要类对象作为参数的函数
{
	cout << "调用成功" << endl;
}
int main()
{
	int a = 3;
	f(a);//将int隐式转换为test类
	return 0;
}
```
***如果要禁止这种类型转换，可以在单一参数构造函数前加上explicit关键字***
例如：
```
class test
{
public:
	explicit test(int a) :a(a), b(0), c(0),d("") {}
private:
	int a;
	int b;	
	int c;
	string d;
};
void f(const test&a)
{
	cout << "调用成功" << endl;
}
int main()
{
	int a = 3;
	f(a);//错误，无法进行隐式类型转换
	return 0;
}
```
###五.类的静态成员
注意：
**(1)静态成员函数如果在类外定义，不能加上static关键字**  
**(2)静态数据成员不能在类的内部进行初始化，除非他是const int的**  
**(3)静态数据成员可以作为默认实参也可以使用不完整类型**  

例如：
```
class test
{
public:
	static int a;
	void func(int x = a);//可以将static数据成员作为默认实参
	static test b;//正确，静态数据成员可以是不完整的类型
	test c;//错误，普通数据成员必须是完整的类型
};  
```
<center><h2>8.1  io类</h2></center>  

1. io对象没有拷贝和赋值，这意味着函数的返回值以及参数只能是istream&/ostream&，并且不能是const的
2. 输出的原理：程序需要输出若干句话，为了节省效率，不会输出若干次，而是会把这些话统一放在缓冲区然后一并输出。输出的过程，缓冲区会刷新。  
以下是导致缓冲区刷新的若干原因：  
（1）缓冲区满了  
（2）程序正常结束  
（3）使用endl:输出换行符然后刷新缓冲区；使用flush:刷新缓冲区；使用ends：输出空格然后刷新缓冲区  
（4）设置unitbuf：则每次输出后都会刷新缓冲区（设置的方式：os<<unitbuf,如果要取消可以：os<<nounitbuf）  
（5）一个输出流关联到另一个流，那么当读写另一个流的时候，输出流的缓冲区都会被刷新。例如：默认cin和cout是关联的，所以每当cin的时候cout的缓冲区都会被刷新  
3. 警告：如果程序崩溃，缓冲区不会被刷新，那么需要输出的数据可能就停留在缓冲区而没有打印。 
所以当调试一个已经崩溃的程序时，如果没有输出想要的数据，未必是代码没有执行也可能是已经执行了，但是程序崩溃后缓冲区没有被刷新，数据在缓冲区被挂起没有打印。

<center><h2> 8.2  文件输入输出</h2></center>  

1. 头文件：#include&lt;fstream&gt;：继承自iostream
fstream中特有的操作：
```
	（1）fstream file;
	（2）fstream file(s);
	（3）fstream file(s,mode);
	（4）file.open(s);
	（5）file.open(s,mode)//2和4，3和5作用相同。只不过一个是初始化一个是后期与文件绑定
	（5）file.close();
	（6）file.is_open();
```
示例代码：
```
int main()
{
    //首先定义一个流 input_stream
    fstream input_stream;
    //然后用流的open函数打开一个文件，最好用绝对路径，注意为了避免路径被解释为转义字符，必须用双斜杠。最后的 ios::in 参数表示读取。
    input_stream.open("D:\\temp.txt",ios::in);
    int a;
    //下面这句表示从流内读取一个整数到变量a，可以类比 cin 的使用方法
    input_stream >> a;
    cout << a << endl;
    return 0;
}
```
	这样也可以：
```
int main()
{
	fstream input_stream("D:\\test.txt", ios::in);
	int a;
	input_stream >> a;
	cout << a << endl;
	return 0;
}
```
2. 可以使用fstream类的对象作为iostream&的实参。即：一个接受istream&的函数可以用一个ifstream对象来调用  

### 插入
****  
重载运算符：  
1. 比较类运算符（==，!=，>,<等）返回的是bool值，参数是（const type&rhs）,const函数  
2. 运算类运算符(+,-,x,/等)返回的是拷贝，参数是（const type&rhs），非const函数  创建一个临时对象，返回的是这个临时对象  
3. 赋值类运算符（=，+=,-=,x=,/=）返回的是引用，参数是（const type&rhs）,非const函数  
4. IO类 返回的是istream&或者ostream&,参数是I/Ostream&和const type &rhs，非const函数，必须写成友元函数，即添加friend关键字
****	
模板类的编写方式  
1. .cpp文件中，每写一个函数都要声明一遍template .h在class开头也要声明一遍
2. 类的名称不再是name，而是name&lt;Type&gt;
3. **模板类的多文件编写**：如果像普通的类一样多文件编写会出现链接错误[原因](https://www.cnblogs.com/lovemee/p/10706061.html)  
**解决方法**：模板类尽量不要多文件编写，把声明和定义写在一起编成一个.hpp文件（.hpp文件是将.h文件和.cpp文件混合编写的文件）。在主函数中include"name.hpp"即可
****  
关于cin：  
cin字符串，遇见空格，TAB就结束了  
cin字符，cin会自动忽略不可见字符，如果想读取不可见字符应该使用cin.get()
****
数组作为参数传递：  
在C/C++中，当数组作为函数的参数进行传递时，数组就自动退化为同类型的指针。因为如果把数组拷贝一份传过去，开销太大。  
所以不论是(int *a),还是(int a[])，传递的实际上都是指针，即形参都会对实参产生影响。  
****  

<center><h2>9.2 容器库概览</h2></center>  

### 一.迭代器  
#### 常用操作  
begin() 指向第一个元素的迭代器  
end() 指向最后一个元素后一个位置的迭代器  
rbegin() 指向最后一个元素的迭代器  
rend() 指向第一个元素前面一个位置的迭代器  
上述四个迭代器还有对应的const_iterator版本 比如cbegin(),他返回的是const_iterator，不能修改容器内的元素，只能读。
> 注意：auto it=vec.rbegin()导致的it类型是reverse_iterator,它的迭代器是反着的，所以倒序输出的正确写法是：  
```
for (auto it = vec.rbegin(); it != vec.rend(); ++it)
```   
#### 使用注意※※  
1. **向容器插入/删除元素可能会导致原来指向容器的迭代器失效，所以在对容器执行操作后记得要更新迭代器**。(如果是使用insert/erase那么非常容易更新，这两个函数本身就返回更新的迭代器)  
2. 不要保存.end()尾迭代器，因为它是最容易失效的迭代器。  
3. 迭代器除了可以++,--还可以想普通指针一样+i
### 二.swap和assign  
#### swap  
swap的速度很快，除了array外可以在o(1)的时间内完成，这是因为元素本身并未交换，只是交换了他们俩的数据结构  
而array的swap是真正的交换两个容器中的数据，时间为O(max(m,n))    
所以如果需要交换两个容器中的元素，大胆使用swap吧，这并不会带来额外的时间开销
#### assign 
seq.assign(n,val)  将seq中的元素替换为n个值为val的元素  
seq.assign(it1,it2) 将seq中的元素替换为[it1,it2)范围的元素  

<center><h2>9.3 顺序容器操作</h2></center>  

### 一.insert和erase  
insert(it,val)  //在it所指位置之前插入元素val，所有容器的insert操作都是前插  
insert(it,n,val)  //在it所指位置之前插入n个val  
insert(it,tar1,tar2)  //在it所指位置之前插入[tar1,tar2)范围的元素  
> 可以发现STL中常常同时重载这两种参数的函数:(1)(n,val)  (2) (it1,it2) 
  
erase(it)  //删除it所指元素  
erase(it1,it2)  //删除[it1,it2)范围的元素
在C++11的新标准中，insert返回指向第一个新加入元素的迭代器  而erase返回被删除元素之后的元素的位置
### 二.emplace  
**emplace_back()与push_back()的区别**：正如emplace_back它的名字一样，它的插入操作是in place(原地的)  
push_back(构造函数(arg1，arg2,...))会先调用构造函数创建一个临时对象，再调用拷贝构造函数创建该对象的拷贝，调用了两次构造函数   
而emplace_back(arg1,arg2,...)会在原地调用构造函数创建出对象后直接push进容器内，只调用一次构造函数  
### 三.front和back  
**front()和back()返回的是容器中首尾元素的引用，这意味着修改vec.begin()/end()也会导致容器中的首尾元素值发生变化！！**  
### 四.随机访问  
有两种随机访问的方式  
下标访问 和 .at(index)访问  

<center><h2>9.5 额外的string操作</h2></center>

### 一.额外操作
这些额外操作的参数基本上都是(pos,n)从pos位置开始，长度为n
1. replace(pos,n,args)  //将pos开始长度为n的字符串替换为args
2. substr(pos,n)   //提取pos开始长度为n的字串  
3. erase(pos,n)   //删除从pos开始长度为n的字串  

### 二.匹配子串  
s.find(arg)  //返回匹配第一个位置的下标  查不到返回string::npos   
s.rfind(args) //返回匹配最后一个位置的下标
s.find_first_of(args)  //返回第一个s和args的交集字符的下标  
s.find_first_not_of(args)  //与上一个相反  
s.find_last_of(args)  //返回最后一个s和args的交集字符  
s.find_last_not_of(args)  //与上一个相反  

### 三.数值转换  
to_string  
stoi  //转换为int,下述类似  
stol
stoul
stoll
stoull
stof
stod
stold  

<center><h2>9.6 容器适配器</h2></center>  

适配器是一种机制，能够使一种事物使用起来好像是另一种事物。分为容器适配器，函数适配器，迭代器适配器  
**容器适配器有：stack,queue,priority_queue**    
一个容器适配器接受一个已有的底层容器，实现新的接口，使之使用起来好像是另一个容器。    
stack,queue都是基于deque实现的，priority_queue是基于vector实现的

<center><h2>10.3 定制操作</h2></center>  

stable_sort 稳定排序，维持相等元素之间的位置关系不变   
###问题提出：对于某些特殊的情形，算法对函数的参数个数有规定，可是规定个数的参数个数无法满足函数的要求，怎么办?  
###问题剖析：本质上就是如何改变一个函数的参数个数
### 一.lamda表达式    
**lamda表达式的解决方案：将多出来的参数放入捕获列表中** 
一般形式 **[捕获列表] (参数列表)->返回值 {函数体};**  
> 注意函数体最后有分号   

其中参数列表和返回值类型可以省略，捕获列表不可以  
调用通过lamda表达式定义的函数的方法与调用普通函数的方法相同
```
int main()
{
	int size = 0;
	string s="12";
	auto f = [size](const string&s)->bool
	{
		return size >= s.size();
	};
	cout<<f(s)<<endl;
}
```  
比如find_if()函数的第三个参数要求是一个一元谓词(单参函数),可是我们想写的是size>=s.size() ，有size和s两个变量，这时就可以使用lamda表达式，捕获size(就是上面的demo)  
- 值捕获和引用捕获  
上面的demo就是值捕获的例子，相当于传值  
引用捕获比如[&size]，相当于传引用  
- 隐式捕获  
可以不说明捕获了哪些变量而只说明通过那种方式捕获  
值捕获[=],引用捕获[&]  
- 在lamda中修改捕获变量的值  
如果只通过值捕获是无法修改捕获变量的值的  
```
int main()
{
	int arg = 0;
	auto f = [arg] ()
	{
		return ++arg;
	};
	cout << f()<<endl;
	cout << arg;
}
//错误
```  
**如果想在lamda中修改又不对原变量产生影响可以使用mutable关键字**  
```
int main()
{
	int arg = 0;
	auto f = [arg] () mutable
	{
		return ++arg;
	};
	cout << f()<<endl;
	cout << arg;
}
//输出 1 0
```  
**如果想在lamda中修改并且对原变量产生影响可以使用引用捕获**  
```
int main()
{
	int arg = 0;
	auto f = [&arg] ()
	{
		return ++arg;
	};
	cout << f()<<endl;
	cout << arg;
} 
//输出 1 1 
```  
### 二.bind函数  
**bind的解决方法：将多出来的参数绑定到函数上去**
bind函数是一个函数适配器，它接受一个可调用对象生成一个新的可调用对象  
基本语法：  
auto newFunc=bind(oldFunc,arg_list)  
还是上面的例子  
```
bool check_size(const string&s,int size)
{
	return size>=s.size();
}
```
这时一个双参函数，将其改变为单参函数的方法是  
auto new_check_size=bind(check_size,_1,sz)  
_1是一个占位符，占据const string&的位置，将sz传递给了size  
**直观理解**
![](http://i2.tiimg.com/699146/6135cc8193d40f26.png)  
>注意：使用bind函数需要引入头文件<functional>  
>使用_n占位符需要引入命名空间 using namespace std::placeholders  
- 使用bind重排参数顺序  
```  
bind(oldFund(_2,_1))  
```  
- 绑定引用  
默认绑定的参数使用拷贝的方式，如果想使用引用的方式可以使用ref,如果想使用const 引用可以使用cref  

<center><h2>10.4 再谈迭代器</h2></center>   
### 一.反向迭代器在排序中的应用  
sort(nums.rbegin(),rend())  //倒序排序  
### 二.反向迭代器在查找中的应用  
auto it=find(nums.rbegin(),nums.rend(),val);  
查找nums中最后一个val的位置  
>注意：返回的是一个it是一个reverse_iterator，++/--操作符是反的
<center><h2>10.5 泛型算法结构</h2></center>  

谓词函数：返回bool值的函数或者仿函数，几个参数就是几元谓词  
### 算法命名规范  
#### 使用谓词代替==/<  
比如sort(),可以重载<，也可以自定义cmp函数  
再如unique(),可以重载==，也可以自定义cmp函数  
#### _if版本  
传递一个谓词，对返回值为真的元素进行操作  
比如find_if(it1,it2,check),remove_if(it1,it2,check)  
#### _copy版本  
通常算法只在原先的容器上进行操作，如果想把数据输出到另一个容器，可以使用copy版本  
比如reverse_copy(it1,it2,dest)  
**dest为复制的起始位置**  

<center><h2>11.3 关联容器操作</h2></center>  

### 查找  
find(k)  返回第一个值为k的迭代器  
count(k)  返回值为k的元素个数  
lower_bound(k)  返回第一个大于等于k的元素的迭代器  
upper_bound(k)  返回第一个大于k的元素的迭代器  
equal_range(k)  返回一个迭代器pair，pair的first指向第一个值为k的元素，pair的second指向最后一个值为k的元素的后一位，如果k不存在，两个都是end()  
注意：**map是按照key来查找的，与value无关**  

<center><h2>11.4 无序容器</h2></center>   
注意：unordered_map的key以及unordered_set的值都不能是自定义类型，如果是自定义类型需要自己提供hash函数  
map的key和set的值也不能是自定义类型，如果是自定义类型需要重载<  

<center><h2>12.1 动态内存与智能指针</h2></center>  

###常用操作 
shared_ptr<Type> sp;//允许多个指针指向同一个对象   
unique_ptr<Type> up;//一次只能有一个指针指向一个对象  
p //如果p指向了一个对象返回true，如果p指向的是空对象返回false  
p.use_count()//shared_ptr独有的操作，返回同时与p共享同一个对象的指针个数  
p.unique() //return p.use_count()==1  
###make_shared  
最安全的使用动态内存的方式就是使用make_shared函数，此函数**为一个对象动态分配内存并返回指向该对象的share_ptr指针**      
使用方式：  
```
share_ptr<ListNode> ptr=make_shared<ListNode>(val);  
与  
auto ptr=new ListNode(val);
等价
```
>使用智能指针代替传统指针简单来说就是使用make_shared替代new，使用=nullptr替代delete  
>智能指针中有一个引用计数，如果某一块内存没有指针指向它，该块内存就会被释放  
get函数的使用情况  
get函数返回的是智能指针的内置指针(普通指针)，只在向某些不能使用智能指针，只能使用普通指针的函数传递参数时使用   
注意：**使用了get返回的指针的代码不应该delete这个指针，因为这个指针是智能指针的内置指针，它的销毁应该自动完成而不是手动delete**  
思考：**删除一个用智能指针写的单链表是不是只要把头节点置为nullptr，就删除了整条链表？**  
###unique_ptr  
unique_ptr的初始化：unique_ptr没有像make_shared一样的函数，只能使用new来初始化  
例如：
```
unique_ptr<int> sp(new int(42));  //正确  
unique_ptr<int> sp=new int(42);  //错误  
unique_ptr<int> sp1=sp;  //错误
```  
####release  
放弃unique_ptr对当前对象的控制权，并且返回该对象  
####reset  
unique_pre指向另一个对象，之前的对象由于无指针所指，被自动释放  
示例  
```
p2.reset(p1.release)  //将p1的控制权转移给p2
unique_ptr<int> p3(p2.release())  //将p2的控制权转移给刚出生的p1
```  
下面这段代码输出为几?  
```
shared_ptr<int> func()
{
	auto p = make_shared<int>(10);
	return p;
}
int main()
{
	auto s = func();
	cout << s.use_count() << endl;
	return 0;
}
```  
答案：1  
###  动态分配数组  
可以对动态分配数组进行值初始化，方法是在中括号后面加一对空括号，表示初始化为0  
```
int *ptr=new int[n]();
```
也可以使用初始值列表  
```
int *ptr=new int [10]{1,2,3,4};
```  
>上面代码最终的结果是：{1，2，3，4，5，0，0，0，0，0}  

注意：**动态分配一个空数组是合法的**  

### 动态分配数组与智能指针  
可以使用unique_ptr动态分配一个数组  
```
unique_ptr<int[]> sp(new int [42])  
```  
**该指针不支持点和箭头运算符，但是可以使用中括号访问数组中的元素**  
### allocator类  
普通的动态分配数组把内存分配和对象构造两个过程放在一起，使用allocator类可以把二者分开  
即：**先分配原始内存，等需要的时候再构造对象**  
API：  
分配/释放内存  
构造/析构对象
```
allocator<T> alt;  //定义一个分配内存的分配器  
auto vec=alt.allocate(n)  //vec指针指向一段长度为n的原始内存
alt.deallocate(vec,n)  //将vec指针指向的内存释放掉  
alt.construct(p,args)  //在p指针所指向的原始内存构造一个对象  
alt.destroy(p)  //摧毁p指针指向的对象
```  
拷贝与填充  
见p430  
### 补充内容
####size_type&&size_t
size_type类型：专门用来存放vector和string,size()返回值的变量类型  
size_t类型：使用sizeof关键字得到的就是size_t类型  
什么时候使用：**vector和string的下标变量应该使用size_type类型，普通数组的下标变量应该使用size_type类型**  
####istringstream&&ostringstream&&stringstream  
>istringstream  

将流中的内容放入字符串中
用途：**将字符串按照不可见字符分割**  
```
istringstream flow(s) //使用s初始化字符串流  
flow.str()//返回字符串流中储存的字符串
按照不可见字符将字符串分割的方法：
while(flow>>words)
{
	cout<<words<<endl;//每一个words是一小段字符串
}
```
**注意flow>>words不是将words读取到flow中，而是把flow截取一部分放入words中**

>ostringstream  

将普通字符串中的内容放入流中  
```
int main()
{
	ostringstream oss;
	istringstream iss;
	iss.str("hi iss");
	cout << iss.str();
	string str;
	while (iss >> str)
		oss << str << endl;

	istringstream iss2("hi iss2");
	while (iss2 >> str) {
		oss << str << endl;
	}
	cout << oss.str();
	return 0;
}
```
输出：
```
hi
iss
hi
iss2
```  
>stringstream  

既有“<<”操作符也有“>>”操作符
主要作用是**实现字符串和任意数据类型的转换**  
```
stringstream stream;
stream<<类型1；
stream>>类型2；
```