### IDEA调试技巧  
- step over 一行一行执行  
- step into 进入自定义方法  
- force step into 不仅会进入自定义方法，还会进入库函数  
- run to cursor 执行到光标的位置  
- drop frame 回退到上一栈帧  
- resume programe 如果有多个断点会进行到下一断点，否则程序直接结束  
- rerun 重新开始debug  

边修改程序边执行：run->reload changed classes  
在debug的过程中修改变量的值：右键点击变量，set value  
**字段断点**：如果想要每当某一变量的值发生变化时中断，可以在该变量定义的位置打上断点(字段断点)。此后每执行一次**resume programe**就跳到该变量下一次值发生变化的位置。  

# 第三章 Java的基本程序设计结构  
## 3.1 一个简单的Java应用程序  
分析下面这段程序：  
```
public class FirstSample{
    public static void main(String[] args){
        System.out.println("hello java");
    } 
}
```  
习惯：类的命名使用Pascal命名法，方法(在java中不叫成员函数而称之为method)的命名使用camel命名法。  
println输出之后带有换行符，print输出后没有换行符  
## 3.2 数据类型  
### 3.2.1 整型  
|int|short|long|byte|  
|----|----|----|----|  
|4字节|2字节|8字节|1字节|  
### 3.2.2 浮点型  
|float|double|  
|---|---|  
|4字节|8字节|  
三个特殊的浮点数：  
- 正无穷大  
- 负无穷大  
- NaN(Not a Number)  

判断一个数是不是NaN的方法: Double.isNaN(x)  
### 3.2.3 char型  
**码点**[codePoint]：编码表中某个字符对应的代码值，在Unicode标准中，码点采用十六进制书写，并加上前缀U+，例如U+0041就是拉丁字母A的码点  
**代码单元**[codeUnit]:每个字符用16位表示，通常被称为一个代码单元。  
一个码点可能需要一个或者两个代码单元来进行存储。在Java中，char类型描述了UTF-16编码中的一个代码单元。  
> 不建议在程序中使用char类型，因为它太底层了。  
## 3.3 常量  
在Java中，利用关键字final指示常量，习惯上常量名使用全大写。  
**类常量**：在Java中，经常希望某个常量可以在一个类中的多个方法中使用，通常将这些常量称之为类常量。可以使用static final 设置一个类常量。  
## 3.4 运算符  
### 3.4.1 数学函数
取模运算：如果使用%，结果可能会是负数。Math类中提供了floorMod这一method，它返回的是一个[0,n-1]的答案(模n)。  
### 3.4.2 强制类型转换  
通常如果浮点数转换为整数都是直接截断，使用Math.round()函数可以将其摄入为一个距离该数较近的整数。注意该函数返回的是long型  
### 3.4.3 位运算符  
1. & | ^ ~   
**按位**运算  
>当应用于boolean值时&&和&的区别
&&具有短路的效果而&会把两个操作数都计算一遍  
2. 移位  
<<和>>都是算术移位(>>用符号位填充高位)，>>>是逻辑移位(用0填充高位)  
### 3.4.4 枚举类型  
示例：  
```  
enum Size{SMALL,MIDIUM,LARGE};
Size s=Size.SMALL;  //注意是Size中的SMALL，这点与C++有区别
```  
## 3.5 字符串  
明确：String不属于基本数据类型  
### 3.5.1 子串  
String类中的substring方法可以提取子串，注意它的第二个参数是最后一个想要提取的位置的后一个位置，而不是长度(与substr区分)  
因此substring(a,b)子串的长度为b-a  
### 3.5.2 拼接  
当将一个字符串与一个非字符串进行拼接的时候，后者会被转换成字符串。例如：  
```
int age=13;
String rating="PG"+age;
```  
当需要把多个字符串放在一起，使用分隔符隔开的时候可使用join方法  
```
String all=String.join("/","A","B","C");
```  
分隔符是第一个参数，其余是要拼接的字符串  
### 3.5.3 不可变字符串  
Java中不能修改字符串中的单个字符  
解决办法：提取+拼接  
例如将"Hello"改成"Help!"  
```
String greeting="Hello";
greeting=greeting.substring(0,3)+"p!";
```  
### 3.5.4 检查字符串是否相等  
注意：**不能使用==直接判断两个字符串是否相等**  
```
s.equals(t);//判断s与t是否相等  
s.equalsIgnoreCase(t);//忽略大小写的前提下判断两个字符串是否相等
```  
### 3.5.5 null串  
要检查一个字符串是否是null串，可以直接使用==判断  
### 3.5.6 码点与代码单元  
1. 串的长度：  
```
.length()//返回的是字符串中代码单元的个数  
.codePointCount(0,s.length())//返回的是字符串中实际码点的数量  
```  
2. 得到第i个位置的字符  
```
.charAt(i)//得到第i个位置的代码单元   

int index=greeting.offsetByCodePoints(0,i);//得到从0开始第i个码点的index(按照code unit来数)
int cp=greeting.codePointAt(index);//得到第i个码点
```  
### 3.5.7 StringAPI  
```
char charAt(int index) //返回index位置的代码单元  
int codePointAt(int index)  //返回index位置开始的码点  
int offsetbyCodePoints(int startIndex,int count) //返回从第startIndex码点开始，偏移count个码点后的码点索引(按照code unit偏移)  
boolean equals(Object other)  
boolean equalsIgnoreCase(String other)  
boolean startsWith(String prefix)//如果以prefix开头返回true
boolean endsWith(String suffix) //如果以suffix结尾返回true  
int indexOf(String str/int cp) //返回第一个与字符串str/码点cp匹配的位置，位置从0开始算  
int lastIndexOf(String str/int cp) //返回最后一个与字符串str/码点cp匹配的位置，位置从原始串尾端开始算  
int length()  
int codePointCount()  
String replace(String oldString,String newString) //将原始串中所有oldString替换为newString  
String substring(int beginIndex,int endIndex)  
String toLowerCase()//全部转换为小写  
String toUpperCase()//全部转换为大写  
String trim()//返回一个新字符串，这个字符串删除原始字符串头部和尾部的空格  
String join(String delimiter,String...elements)
```  
### 3.5.8 构建字符串  
有时候需要由较短的字符串构建字符串，采用字符串连接的方式效率较低。使用StringBuilder类可以避免这个问题的发生    
API:
```
StringBuilder() //构建一个空的字符串构建器  
int length() //返回构建器中的代码单元数的数量  
StringBuilder append(String str/char ch/int cp) //向构建器中添加字符串/字符/码点  
void setCharAt(int i,char ch) //将第i个代码单元改为ch  
StringBuilder insert(int index,String str/char ch) //在第i个位置之前插入字符串/代码单元  
StringBuilder delete(int startIndex,int endIndex) //将[startIndex,endIndex-1]的代码单元删除  
String toString() //返回一个与构建器内容相同的字符串
```
## 3.7 输入输出  
### 3.7.1 输入  
首先需要构造一个输入Scanner对象与标准输入流关联  
```
Scanner in=new Scanner(System.in);
in.next();//读取单词(遇到不可见字符停止)
in.nextLine();//读取整行
in.nextInt();
in.nextDouble();
in.hasNext()//检测输入中是否还有其他单词
in.hasNextInt()
in.hasNextDouble()
```  
### 3.7.2 输出  
java中也有printf方法，与C中的printf用法相同  
String中的format方法：使用类printf的语法，将内容转换为字符串  
例如：  
```
String message=String.format("Hello,%s.Next year,you will be %d",name,age);
```
### 3.7.3 文件IO  
输入需要使用Paths.get()，输出直接写路经就可以了。  
输入仍然使用Scanner对象，输出需要使用PrintWriter对象  
示例：  
```
Scanner in=new scanner(Paths.get("inFile.txt"),"UTF-8");
PrintWriter out=new PrintWriter("outFile.txt","UTF-8");
如果文件名包含反斜杠符号，需要额外再打一个反斜杠：c:\\...\\..  
```  
查看程序启动路径的方法：  
```
String dir=Systems.getProperty("user.dir");
```
## 3.8 控制流程  
### 3.8.1 块作用域  
与C++不同的是，C++中，可以在嵌套的块中重定义一个变量。内层变量会覆盖在外层的定义。这样有可能会导致程序设计的错误，因此在Java中不允许这样做。  
### 3.8.2 switch  
switch中case的标签可以是：byte,short,int,char，字符串字面量  
例如：
```
switch(s){
    case "hello":{

        break;
    }
    case "world":{

        break;
    }
}
```
### 3.8.3 中断控制流程语句  
Java支持带有标签的break，以跳出深层的循环，在想要跳出的最外层循环之前加上标签(标签由标签名和冒号组成),在break后加上标签名。  
例如：
```
tag:
for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
        for(int k=0;k<n;k++){
            ...
            break tag;
        }
    }
}
```  
## 3.9 大数值  
java.math中BigInteger(大整数)和BigDecimal(大实数)两个类  
由于**java中不支持运算符重载**，所以有一些方法支持运算  
API  
```
add
substract
multiply
divide
mod  //Biginteger独有
compareTo(BigInteger other/BigDecimal Other)//此数<other则返回负数，等于返回0，大于返回正数
valueOf(long x) //将long型数转换为对应的BigInterger/BigDecimal
```  
## 3.10 数组  
数组定义  
```
int []a=new int [N];
或
int a[]=new int [N];
```  
数组中包含一个属性（**注意不是方法**）：length  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200116133143.png)  
### 3.10.1  for each循环  
for(类型 变量名:容器名)  
例如：  
```
for(int num:a)  
```  
**范围for得到的是拷贝，即修改num的值并不会影响数组a中的元素**  
### 3.10.2 数组初始化以及匿名数组  
和C++中相同  
```
int arr[]={1,2,3};
或
int[] arr={1,2,3};
```  
### 3.10.3 数组拷贝  
Arrays中的提供copyOf方法，指定拷贝数组的名称和拷贝的长度  
```
int []b=Arrays.copyOf(a,a.length); //将数组a中的内容拷贝给b  
```  
该函数常用来倍增数组  
```
arr=Arrays.copyOf(a,a.length*2); //将数组长度变为原来的2倍
```  
### 3.10.4 命令行参数  
每一个main方法都带有一个Sring arg[]参数，这个参数表明main方法接受一个字符串数组，也就是命令行参数  
### 3.10.5 数组排序
Arrays中有给数组排序的方法  
```
Arrays.sort(a);
```   
### 3.10.6 多维数组  
声明二维数组的方法：  
```
int [][]nums=new int [r][c];  
int [][]nums={{1,2,3},{4,5,6},{7,8,9}};  //直接初始化
```  
### 3.10.7 不规则数组  
可以在可以定义数组的时候不指定每一行的列数，生成不规则数组  
```
int [][]nums=new int [r][];
for(int i=0;i<r;i++){
    nums[i]=new int [x];  //x由自己指定
}
```  

# 第四章 对象与类  
## 4.1 面向对象程序设计概述  
### 4.1.1 类之间的关系  
在类之间最常见的关系有：  
- 依赖(uses-a)  
- 聚合(has-a)  
- 继承(is-a)  

**依赖**：如果一个类的方法操纵另一个类的对象，我们就说一个类依赖于另一个类  
**聚合**：聚合关系意味着类A的对象包含着类B的对象  

## 4.2 使用预定义类  
### 4.2.1 对象与对象变量  
构造器：一种特殊的方法，用来构造并初始化对象。构造器的名字应该与类名相同。要想构造一个对象需要在构造器前面加上new操作符  

>区分对象与对象变量：对象变量储存(或者说引用)对象。一个对象变量如果没有引用任何对象是不能够调用任何方法的。  
可以显式的将对象变量置为null，表明这个变量没有引用任何对象。  

以Date类为例：  
```
Date deadline; //这是一个对象变量  
new Date();;  //这是一个对象
```  
### 4.2.2 更改器方法和访问器方法  
实例域：对象中存放数据的区域(建议将实例域标记位private)  
更改器方法：会修改实例域中的数据   
修改器方法：只访问对象，不修改实例域中的数据  

### 4.3 用户自定义类  
1. 结构：一个src目录下可以有多个.java文件。每一个.java文件的名字与该文件中public类的名字匹配。在一个.java文件中只能有一个公有类，可以有多个非共有类。  
2. 注意：所有的java对象都是在堆中构造的。  
3. 隐式参数与显式参数：所谓隐式参数指的就是出现在方法名前的对象，使用关键字this标识隐式参数，所谓显示参数就是方法的参数。  
4. 与C++的区别：C++中通常在类的外面定义方法，如果在内部定义通常将这个方法自动的看作inline函数，在Java中，所有的方法都必须在类内部定义。  
5. **final实例域**：如果final修饰的是基本数据类型或者不可变类的对象，那么final表示不能改变其值。  
如果final修饰的是可变类的对象，那么final表示不能更改对象变量的引用，但是对象本身的实例域是可以改变的。  
### 4.4 静态域与静态方法  
#### 4.4.1 静态域  
类中的数据域可以分为实例域和静态域，实例域如前文所述就是每个对象所拥有的数据成员，而静态域指的是类中的static数据(所有对象共有)。  
#### 4.4.2 静态常量  
静态变量比较少用，常用的是静态常量，例如：  
```
public static final double PI=3.1415926;
```  
#### 4.4.3 静态方法  
**静态方法不能访问类的实例域，只能访问静态域。**  
静态方法的调用方式：可以通过类名调用也可以通过对象调用，但是推荐使用类名调用。例如：  
```
int num=Math.pow(2,6);
```  
### 4.5 方法参数  
回顾：参数的传递有两种方式：call by value 和 call by reference  
Java中总是采用call by value的方式。  
具体而言：  
- 对于基本数据类型直接使用call by value的方式传递参数，即实参的值是不会被方法修改的。  
- 对于对象参数：传递的是引用的拷贝，所以方法是可以改变对象参数的数据内容的，但是不能使对象参数引用一个新的对象(不能swap)  
图示：![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200120212516.png)  
总结Java中方法参数的使用情况:  
1. 一个方法不能修改一个基本数据类型的参数  
2. 一个方法可以修改一个对象参数的状态  
3. 一个方法不能让对象参数引用一个新的对象  
### 4.6 对象构造  
#### 4.6.1 重载  
与C++中重载的含义相同  
#### 4.6.2 默认初始化  
如果在构造器中没有显式地给域赋予初值，那么就会被自动地赋为默认值：数值为0、布尔值为false、对象引用为null。  
### 4.6.3 显式初始化  
可以在类中直接将一个值赋给任何域(实例域+静态域)。例如：  
```
class Employ{
    private String name="...";//直接初始化
}
```  
在执行构造器之前，先执行赋值操作  
### 4.6.4 调用另一个构造器  
可以通过this(...)的形式调用其他构造器，类似C++中的委托构造函数，例如：  
```
public Employee(String s){
    this(17,s);  //调用Employee(int,String)
}
```  
### 4.6.5 初始化块  
在一个类中可以用一对{}圈住一些代码作为代码块，他们会在构造器执行之前被执行。  
例如：  
```
{
    id=nextId;
    nextId++;
}
```
总结：Java中共有三种初始化的方式：  
- 构造器  
- 显式初始化  
- 初始化块  
初始化块通常是在初始化比较复杂，显式初始化比较困难的时候使用。  
### 4.6.6 随机数  
```
Random() //构造一个新的随机数生成器  
int nextInt(int n)  //返回一个[0,n-1]的随机数
```  
例如：  
```
Random aRand= new Random();
int x=aRand.nextInt(1001);
```  
### 4.6.7 对象析构与finalize方法  
Java由于有GC，不支持析构器。可以为一个类添加finalize方法。finalize方法将在GC清除对象之前调用。  
## 4.7 包  
Java中允许使用package将class组织起来  
### 4.7.1 导入类  
一个类可以使用**所属包**的所有类以及其他包中的共有类。  
有两种方法询问另一个包中的共有类  
1. 在每个类名之前添加完整的包名,例如：   
```
java.time.LocalData today=java.time.LocalDate.now();
```  
2. import  
例如可以使用下面这条语句导入java.util包中所有的类  
```
import java.util.*;
```  
也可以导入包中的一个特定的类，例如  
```
import java.time.LocalTime;
```  
**当发生类名冲突的时候就只能采用第一种方法了**。比如：java.util和java.sql中都有类Date  
那么就只能通过java.util.Date和java.sql.Date来区分了。  
### 4.7.2 静态导入  
import语句不仅可以导入类，也可以导入静态方法和静态域，只要在import后添加static就可以  
比如：  
```
import static java.lang.System.*
```  
然后就可以使用下面这种方式输出了：  
```
out.println();
```  
### 4.7.3 将类放入包中  
要想将一个类放入包中，就必须将包的名字放在源文件的开头。例如：  
```
package com.horstman.corejava  
```  
每一个·代表文件系统中向下一级。  
### 4.7.4 包作用域  
标记为public的部分：可以被任意的类使用  
标记为private的部分：只能被定义它的类使用  
既没有标记public，也没有标记private：可以被同一个包中的所有方法使用  
## 4.8 类设计技巧  
1. 一定要保证数据私有  
这是最重要的：绝对不要破坏封装性。  
2. 一定要对数据初始化  
3. 将职责过多的类进行分解  
# 第五章 继承  
先复习一下C++中的继承  
区分：**访问权限和继承方式**  
- 访问权限：涉及到类的设计者，类的用户还有派生类  
    1. public：类的设计者，类的用户，派生类均可以访问  
    2. protected：只有类的设计者和派生类可以访问  
    3. private:只有类的设计者可以访问  
- 继承方式：**继承方式与派生类能不能访问无关**，它控制的是派生类的用户还有派生类的派生类的访问权限  

继承方式说明符|public|protected|private
-|-|-|-  
从派生类的用户或者派生类的派生类的角度来看派生类的基类数据|访问权限不变，原先public还是public，原先protected还是protected|全部都变成protected|全部都变成private  
## 5.1 类、超类和子类  
### 5.1.1 定义子类  
Java中使用extends表示继承  
```
public class Manager extends Employee{

}
```  
>Java中所有继承都是公有继承  
超类就是基类/父类  
### 5.1.2 覆盖方法  
可以在子类中覆盖超类中的方法，如果还想调用超类中的公有方法和保护方法可以使用super关键字  
例如：  
```
 public int getSalary(){
    int salary=super.getSalary();//指明调用超类版本的方法
    return salary+bonus;
  }
```  
### 5.1.3 子类构造器  
使用super关键字调用超类的构造器  
```
Manager(int salary,int bonus){
    super(salary);
    bonus=bonus;
  }
```  
### 5.1.4 多态与动态绑定  
超类的对象变量可以引用子类对象，这种现象被称为多态。  
在运行时能够自动的选择调用哪个方法的现象被称为动态绑定  
### 5.1.5 阻止继承  
有时候可能希望阻止人们利用某个类定义子类，不允许扩展的类被称为final类。  
```
public final class className{

}
```  
也可以将类中的特定方法声明为final，这样子类就不能够覆盖这个方法了。  
>如果将一个类声明为final，其中的方法自动成为final的，但是域不会成为final  

### 5.1.6 强制类型转换  
进行类型转换的唯一原因：在暂时忽略对象的实际类型之后，想要使用对象的全部功能。  
超类对象变量确实可以引用子类对象，但是这样做无法调用子类特有的额外方法，这时需要将超类对象变量强制转换为子类对象变量。  
小结：
- 子类对象变量可以强制转换成超类的类型
- 如果有多态现象也可以将超类对象变量转换为子类的类型
- 如果没有多态现象，只是单纯的超类对象变量引用超类对象，那么在转换为子类类型的时候会运行错误。  
一个好的习惯是**在进行类型转换之前先使用instanceof查看一下是否能够成功转换**  
```
if(baseObject instanceof Derived){
      Derived derivedObject=(Derived)baseObject;
    }
```  
### 5.1.7 抽象类  
包含一个或多个抽象方法的类必须被声明为抽象类  
```
public abstract class Person{ //抽象类
    ...
    public abstract String getDescription(); //抽象方法
}
```
抽象类不能被实例化，也就是说，如果将一个类声明为abstract，就不能创建这个类的对象。但是可以定义抽象类的对象变量，让它引用非抽象子类的对象。  
### 5.1.8 受保护访问  
Java中用于控制可见性的四个访问修饰符  
- private：仅对本类可见  
- public：对所有类可见  
- protected：对子类和本包可见  
- 不写修饰符：对本包可见  
## 5.2 Object：所有类的超类  
Object类是Java中所有类的始祖，在Java中每个类都是由它扩展而来的。  
因此可以使用Object类型的变量引用任何类型的对象。  
Objects只是包含一些操作Object实例的工具方法，类似的一些用复数命名的class来存放一些工具方法命名方式在JDK中很常见。  
### 5.2.1 equals方法  
Java中的==  
- 基本数据类型：比较的就是值是否相同  
- 对象：比较的就是地址值是否相同  
显然比较地址是否相同并不是我们想要的，因此需要为自定义类创建equals方法来比较两个对象的值是否相同。  
>Objects.equals(obj a,obj b)  
如果两个参数都为null，Objects.equals(a,b)将返回true；如果其中一个参数为null，将返回false；否则如果两个参数都不为null，会调用a.equals(b)。使用这种方式判断两个变量相等比a.equals(b)更加安全，因为考虑了a是null的情况。  

编写equals的方法：  
1. 显式参数的类型应为Objects，不妨将其命名为otherObject  
2. 检测this与otherObject**地址是否相同**  
3. 检测otherObject是否为**null**，如果是null返回false(因为this一定不是null)  
4.  - 如果不同类的对象可能相等，那么就用**instanceof**检测  
    - 如果不同类的对象不可能相等，那么就用**getClass**检测  
5. 将otherObject转换为相应类型的变量，并**逐条数据比较**，使用==比较基本类型域，使用Object.equals()比较对象域  
>简而言之：同，空，类，逐项比较

```
public boolean equals(Object otherObject){
    if(this==otherObject) return true;//同
    if(otherObject==null) return false;//空
    if(getClass()!=otherObject.getClass()) return false;//类
    if(!(otherObject instanceof Employee)) return false;//类
    Employee other=(Employee) otherObject;
    return Objects.equals(this.name,other.name)&&salary==salary;//逐项比较
  }
```
如果在子类中重新定义equals，先super比较超类中的数据，然后逐项比较额外数据  
```
public boolean equals(Object otherObject){
    if(!super.equals(otherObject)) return false;
    Manager other=(Manager) otherObject;
    return bonus==other.bonus;
  }
```  
### 5.2.2 hashCode方法  
因为相同值的对象必须有相同的hashCode，因此如果重新定义equals，就必须重新定义hashCode方法。  
生成hashCode的简单方法:  
```
return Objects.hash(name,salary,hireDay);//参数部分填上该类中所有影响equals判断的数据
```  
### 5.2.3 toString方法  
在Object类中还有一个重要的方法，就是toString方法，它用于返回表示对象值的字符串。  
**格式**：字符串的格式例如：java.awt.Point[x=10,y=20]  
绝大多数的toString方法都遵循这个格式：类的名字[域]  
随处可见toString方法的原因是，只要对象与一个字符串通过+连接起来，编译器就会自动地调用toString方法，以便获得这个对象的字符串描述。  
如果x是任意一个对象，并调用System.out.println，就会自动调用x.toString()。  
> 数组如果想要采用字符串的方法输出不能使用Object类中的方法，修正的方式是调用Arrays.toString.如果是多维数组调用Arrays.deepToString  

## 5.3 泛型数组列表  
本节介绍ArrayList  
声明一个长度为n的数组：ArrayList<Type> nums=new ArrayList<Type>(n);  
> Type必须是对象类型而不能是基本数据类型，所以如果想要将数组的类型设置为int，应该使用其对应的对象类型：Integer  
API  
```
add(Type x)    //添加元素  
add(int index,int val)  //在index位置前插入值val 
ensureCapacity(int n)  //事先为数组分配大小为n的内存空间，避免数组的动态增长。   
trimToSize()  //将存储区域的大小调整为当前元素数量所需的存储空间数目，多余的空间由GC回收  
set(int index,int val)  //将index位置的元素修改为value  
get(int index)  //获取数组index位置的元素值  
toArray(Type[] arr)  //将ArrayList中的元素拷贝到数组中去  
remove(int index)  //删除index位置的元素  
```  
## 5.4 对象包装器和自动装箱  
有时需要将int这样的基本类型转换为对象。这样的基本类型都有一个与之对应的类。这些类称为包装器  
**自动装箱和自动拆箱**：多数情况下编译器会自动地在需要对象类型的位置将基本数据类型装箱为包装器，也会在需要基本数据类型的位置将包装器拆箱。甚至在算术表达式中也能够自动的装箱和拆箱。例如，可以将自增操作符应用于一个包装器引用:Integer n=3; n++;  
**包装器和基本数据类型使用上的区别**：基本数据类型使用==判断相等，包装器使用equals方法判断相等。  
**int<->String**：  
```
String->int:Integer.parseInt(String s,int radix)  
int->String:Integer.toString(int num,int int radix)  //radix可选
```  
> 如果想要修改基本数据类型参数，使用其包装器并不能达到想要的效果。因为包装器对象是不可变的，包含在包装其中的内容不会改变。真正的做法应该是使用org.omg.CORBA中定义的holder类型，包括IntHolder，BooleanHolder等。  
```
public static void triple(IntHolder x){
    x.value=3*x.value;
}
```  
[引入org.omg.ORGBA的方法](https://stackoverflow.com/questions/53846490/the-import-org-omg-cannot-be-resolved)  
## 5.5 参数数量可变的方法  
使用Type...args作为形参，对于类的设计者来说就是一个Type类型的数组。事实上编译器会将用户传入的多个实参打包成为一个数组。  
## 5.6 枚举类  
API  
```
static Enum valueOf(Class enumClass,String name)  //根据枚举名称返回枚举对象  
String toString()  //返回枚举名称
```  
比较两个枚举类型的值的时候不要调用equals，而应该直接使用“==”。  
示例：  
```
public enum Size{
    small,
    mid,
    large
  }
public static void main(String[] args){
    Size l=Size.large;
    System.out.println(l.toString());
    Size s=Size.valueOf("small");
    System.out.println(s.toString());
  }
输出：
large
small
```    
## 5.7 反射  
反射的作用：  
- 在运行时分析类  
- 在运行时查看对象  
- 实现通用的数组操作代码  
- 利用Method对象，这个对象很像C++中的函数指针  
### 5.7.1 Class类  
Java运行时系统始终为所有对象维护一个被称为运行时的标识，这个标识跟踪着每个对象所属的类。保存这些信息类称为Class。Object类中的getClass方法就会返回一个Class类型的实例  
获得类的三种方法  
1. getClass()  
2. forName(String name)  
根据类的名字返回一个名字对应的Class对象  
> 名字应该是完整的，如java.util.Random  
注意因为forName可能抛出checked exception，所以应该必须它编写异常处理代码。  
3.  Type.class  
例如：Random.class  

>和枚举相同，比较Class对象并不需要equals，直接==即可。因为虚拟机为每个类型管理一个Class对象    

Class类还有一个很有用的方法：newInstance，用来创建一个类的实例，该方法会调用该类的默认构造器  
```
e.getClass().newInstance();
```  
### 5.7.2 捕获异常  
异常有两种：已检查异常和未检查异常  
对于已检查异常，必须提供处理器(异常处理)，否则无法通过编译。  
例如上文介绍的forName方法。如果name不存在就会抛出一个已检查异常，所以想要调用这个方法必须提供处理器。  
```
try{
      Class cl=Class.forName("java.util.Random");
    }
    catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
```  
### 5.7.3 利用反射分析类的能力  
动态语言：在程序运行的过程中改变程序结构或变量类型。借助于反射，Java有一定的动态性。  

