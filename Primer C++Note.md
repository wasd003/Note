<font size="5" face="黑体"/>

<center style="color:blue;">5.6            try语句块和异常处理</center>
											   
**1.							常用异常处理套路：try->throw->catch**

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

<center style="color:blue;">6.5特殊语言特性</center>  

**1.默认参数函数**  
注意：一旦某个形参被赋予了默认值，其右侧所有的形参也必须被赋予默认值
设计：调整形参的顺序，将经常使用默认值的参数放在后面

**2.内联函数和constexpr函数**  
*内联函数*:在函数返回值之前加上inline即可  
*constexpr函数*:在函数返回值之前加上constexpr，它可以声明编译期的函数。  
注意：constexpr函数不一定返回常量表达式，如果实参是字面值常量（如5，10）则返回常量表达式，但如果实参不是字面值常量（如 int i=5,func(i)）则返回的并不是常量表达式

>注意：多文件编写时内联函数和constexpr的定义通常写在.h文件中

**3.assert断言**  
在程序执行到某处时，程序员相信此时一些值应该是多少，这时可以启用assert断言，如果这些值超出预期，就终止程序。assert(f),如果f是true，继续执行程序，如果f是false，终止程序，抛出异常  
>频繁的使用assert会造成很大的开销，可以在#include<cassert>之前#define NDEBUG禁止对assert的断言检测


**4.常量成员函数**  
在函数的参数列表后加上const即可将普通成员函数变为常量成员函数  
常量成员函数的好处：常量对象或者其引用或者指向它的指针不能调用普通的成员函数，但可以调用常量成员函数。将函数声明为常量成员函数可以提高程序的灵活性  
<p style="color:red;">注意：<br/> 
（1）常量成员函数不能修改类的数据成员<br/>
（2）常量成员函数如果定义在类的外面，则参数列表后的const不可省略</p>
总结：如果成员函数不涉及修改类的数据成员的操作，则可以将其声明为常量成员函数


**5.默认拷贝**  
两个对象的默认拷贝（赋值）就是把对象中的每一个数据成员都赋值给赋值给另一个对象。如果对象中不包含指针，使用默认的拷贝就可以了

<center style="color:blue;">7.2 访问控制与封装</center>

**1.友元的声明**  
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

<center style="color:blue;">7.3          类的其他特性</center>  

**1.类中使用别名**
在类中可以使用typedef来使用别名，这个typedef的作用域仅在类内。
注意：必须在使用别名之前声明typedef

**2.可变数据成员**
将类中的数据成员设为可变的，则在const函数中也可以改变该变量的值
例如：mutable int a;

**3.类中不可以有该类类型的对象，但是可以有指向该类类型的指针，因为普通数据成员不允许是不完整的类型**
例如：
```
class test
{
public:
	test* ax;//正确
	test bx;//错误，因为此时test还未定义完成，属于不完整的类型
};
```



<center style="color:blue;">7.5          构造函数再探</center>  

**1.常量&&引用只能用列表初始化**  
类中的数据成员如果是const或者引用或者某种为提供默认构造函数的类型，则它必须使用初始化列表进行初始化，不能够在构造函数的函数体中进行赋值  
**2.初始化顺序**  
初始化的顺序取决于数据成员在类中的定义顺序而不取决于它们在初始化列表中的顺序。在写构造函数的时候尽量按照定义顺序去写初始化列表	  				   
**3.委托构造函数**  
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
**4.隐式类型转换和explicit关键字**
<p style="color:red;">一个函数如果需要类对象作为参数，并且这个类包含单一参数的构造函数（注意必须是单一参数），那么可以直接将这个参数作为函数的参数，编译器会自动调用类的单一参数构造函数临时创建一个类的对象。这个过程叫做隐式类型转换</p>  

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
**5.类的静态成员**
注意：
<p style="color:red;">
（1）静态成员函数如果在类外定义，不能加上static关键字<br/>
（2）静态数据成员不能在类的内部进行初始化，除非他是const int的<br/>
（3）静态数据成员可以作为默认实参也可以使用不完整类型</p>  

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
<center style="color:blue;">8.1  io类</center>  

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

<center style="color:blue"> 8.2  文件输入输出</center>  

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

		



