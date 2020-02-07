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
一个类被加载后，JVM会创建一个对应该类的Class对象，类的整个结构信息会被放到对应的Class对象中。这个Class对象就像一面镜子，通过这面镜子可以看到对应类的全部信息。所以叫做反射。  
类对应的Class对象是唯一的。  
反射的几个核心类：  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200130210603.png)
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
### 5.7.3 反射的应用  
- 获取类的名字  
```
getName 获得类名+包名  
getSimpleName 获得类名  
```  
- 获取Field  
    1. get("字段名") vs get...s  
    获取某一指定的Field vs 所有Filed  
    2. Declared  
    如果不加Declared只能获得public的Field，加上Declared可以获得所有Field。  
```
Field getField(String name)
Field getDeclaredField(String name)
Field[] getFields()
Field[] getDeclaredFields()
```
- 获取Method  
大体上和Field相同，但是注意如果要获取某一个具体的方法除了要指明方法的名字还需要指定它的参数类型，因为可能会出现方法重载的情况。  
例如：  
```
Method m=clazz.getMethod("setName",String.class); //表示获取 setName(String) 方法
```  
- 获取Constructor  
和获取Field相同  


- 构造对象  
Class类和Constructor类中都有一个方法：newInstance，用来创建一个类的实例，该方法会调用该类的默认构造器  
```
Type t=(Type)e.getClass().newInstance();  //注意需要强制类型转换
```  
如果想要调用有参构造需要借助Constructor类  
```
Constructor aCons=clazz.getConstructor(int.class,String.class);
user us=aCons.newInstance(2,"liHua");
```
- 通过反射调用方法  
使用invoke(Object obj,...) obj表示方法作用的对象，...表示方法的参数  
```
User us=(user)clazz.newInstance();//创建一个User类对象
Method method=clazz.getDeclaredMethod("setName",String.class);//通过反射获得User类的setName方法
method.invoke(us,"liHua");
```  
- 通过反射操作Field  
set用来写Field，get用来读Field,参数的形式同样为(Object obj,...)  
```
User us=(user)clazz.newInstance();//创建一个User类对象
Field f=clazz.getDeclaredField("uName");
f.set(us,"liHua");
```  
如果该field是private的可以将setAccessible置为true，取消安全检查，这样既可以提升反射的速度，也可以访问私有Field  
```
User us=(user)clazz.newInstance();//创建一个User类对象
Field f=clazz.getDeclaredField("uName");
f.setAccessible(true);
f.set(us,"liHua");
```   
# 第六章 接口、lamda表达式与内部类  
## 6.1 接口  
### 6.1.1 接口概念  
接口（Interface），在JAVA编程语言中是一个抽象类型，是**抽象方法的集合**。  
接口中的方法自动属于public的，因此在接口中声明方法时不必提供关键字public。接口绝对不能含有实例域，但是可以含有常量。常量的类型自动为public static final  
接口中只能声明方法但是不能给出实现，想要实现除非是静态方法，或者时默认方法(6.1.3和6.1.4)  

使类实现接口需要使用implements关键字  
有两种实现接口的方法：  
- Object类  
- 泛型  
例如实现Comparable接口  
使用Object方法实现需要注意强制类型转换的问题
```
public class demo implements Comparable<demo>{
  public static void main(String[]args){

  }
  private int id;

  @Override
  public int compareTo(demo otherObject) {
    demo other=(demo)otherObjec;
    return Integer.compare(this.id,other.id);
  }
}

```  
```
public class demo implements Comparable{
  public static void main(String[]args){

  }
  private int id;

  @Override
  public int compareTo(Object o) {
    demo otherObject=(demo)o;
    return Integer.compare(this.id,otherObject.id);
  }
}

```  

compareTo方法与继承  
当compareTo方法涉及到继承的时候就要做好子类和超类比较的思想准备。  
- 如果子类的比较不一样，那么就属于不同类的非法比较。每个compareTo方法都应该在开始时进行下列检测：  
```
if(getClass()!=other.getClas()) throw new ClassCastException;
```  
- 如果存在一种通用算法，它能够对两个不同的子类对象进行比较，则应该在超类中提供一个compareTo方法，并将这个方法声明为final  
### 6.1.2 接口的特性  
1. 不能构造接口的实例，但是可以声明接口变量并引用实现了接口的类的实例  
```
x=new Compareable();//错误  
Compareable x=new Employee(...);//如果Employee类实现了Comparable接口，那么这样写正确
```  
2. 可以使用instanceof检测一个对象是否实现了某个接口  
```
if(anObject instanceof Comparable){
    ...
}
```  
3. 接口可以多继承  
```
public interface a extends b,c,d{

}
```  
4. 一个类可以实现多个接口  
类希望获得什么能力，就是实现什么接口。比如希望获得sort能力就实现comparable接口。  
### 6.1.3 静态方法  
在Java SE8中，允许在接口中实现静态方法。此前，通常的做法是将静态方法放在伴随类中。即：**接口**和**实用工具类**比如Collection和Collections或Path和Paths。  
在Java SE8中，可以为Path接口增加以下方法：  
```
public interface Path{
    public static Path get(String first,String ...more){
        return FileSystem.getDefault().getPath(first,more);
    }
}
```  
### 6.1.4 默认方法  
可以为接口方法提供默认实现。必须用default修饰符标记这样一个方法  
```
public interface testIn{
    default void testFunc(){
      System.out.println("ef");
    }
  }
```
默认方法的一个重要好处是**适应接口演化**  
如果一个类实现一个接口已经很多年，突然有一天为这个接口增加了一个方法。那么这个类因为没有实现该接口的所有方法将会无法编译。但是如果增加的方法是默认方法，有其默认实现，那么就不会影响这个已经存在好几年的类。  
### 6.1.5 默认方法冲突  
1. 两个接口冲突  
    类同时实现A和B两个接口，A、B中如果有同名方法，且只要有一个接口中的方法有默认实现就会产生冲突  
    - 如果A，B中均有默认实现  
    那么需要选择两个冲突方法中的一个    
    ```
    class Student implements Person,Named{
        public String getName(){
            return Person.super.getName();
        }
    }
    ```  
    - 一个有默认实现一个没有  
    依然有冲突，解决方法和上一个相同  
2. 接口和类冲突  
一个类继承超类并且实现接口，如果接口和超类中有同名方法，这种情况下只会考虑超类方法，接口的默认方法会被忽略。  
## 6.2 接口示例  
### 6.2.1 接口与回调  
回调(callback)是一种常见的程序设计模式。在这种模式种，可疑之处某个特定特定的实践发生时应该采取的动作。  
因为接口是没有实例的，在需要填充接口实例的地方妖魔填充**实现了接口的类的实例**要么填充**lamda表达式**  
例如定时器  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200131140454.png)  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200131140524.png)
### 6.2.2 Comparator接口  
上面的Comparable接口控制的是类的比较方式，下面要介绍的Comparator接口是比较器。并不改变类本身的比较方式，只是传递给sort方法是使用compare方法进行比较。  

```
class LengthComparator implements Comparator<String>{
    public int compare(String first,String second){
        return first.length-second.length;
    }
}
String friends={"peter","paul","mary"};
Arrays.sort(friends,new LengthComparator());
```    
### 6.2.3 对象克隆  
Java中对象在作为参数传递的时候，只是拷贝了引用，而没有拷贝对象本身，所以方法会修改传入的对象。为了避免这个问题可以使用对象克隆。     
与C++中相同，克隆分为浅拷贝和深拷贝。在Obejct类中实现了clone方法，即所有类的默认克隆都是该clone方法(浅拷贝)    
要想给自定义类增添克隆的功能，就需要实现cloneable接口。
即使clone的默认拷贝(浅拷贝)可以满足要求，还是需要实现Cloneable接口。因为Object类中默认的clone方法是protected的，通过自实现，可以将其变为public  
浅拷贝示例：  
```
public class demo implements Cloneable{
    public demo clone() throws CloneNotSupportedException {
        return (demo)super.clone();//注意需要强制类型转换
    }
}
```
深拷贝示例：  
```
public class demo implements Cloneable{
    public demo clone() throws CloneNotSupportException{
        demo cloned=(demo)super.clone();//先浅拷贝
        cloned.hireday=this.hireday.clone();//对于对象数据，逐个使用深拷贝
        return cloned;
    }
}
```  
## 6.3 lamda表达式  
### 6.3.1 lamda表达式的语法  
```
(...,...)//参数
->
{... ...}//代码体
```  
如果参数类型可以推导出来，可以省略参数类型，如果只有一个参数并且参数类型可以推导出来连括号都可以省略  
### 6.3.2 函数式接口  
只有一个方法的接口被称为函数式接口(functional interface)  
lamda表达式可以转换为函数式接口，因此所有需要填充接口实例的位置都可以填充上一个lamda表达式  
```
Timer t=new Timer(10000, event->System.out.println("Hello Java"));
```  
### 6.3.2 变量作用域  
首先引入自由变量的概念:自由变量指非参数而且不在代码中定义的lamda表达式中的变量。  
```
public static void repeatMessage(String test){
    ActionListener listener = event->{
        System.out.Println(text);
    }
}
这里text就是自由变量
```  
代码块和自由变量组成闭包，在Java中，lamda表达式就是闭包。  
> 注意：lamda表达式中不能改变自由变量的值，lamda表达式捕获的变量也必须是最终变量(无论在表达式内还是表达式外，自由变量的值都不可该改变)  
```
public static void repeatMessage(String test){
    text=text+" ";//error
    ActionListener listener = event->{
        text=text+" ";//error
        System.out.Println(text);
    }
```
### 6.3.3 方法引用  
方法引用是另一种填充接口实例的方法(只能是函数式接口)。它本质上是对lamda表达式的一种简化。将lamda表达式的内容换为对象名::方法，或者类名::静态方法，或者super::超类方法，或者this::本类方法。  
### 6.3.4 构造器引用  
如果接口要实现的方法是一个构造器，可以使用类名::new，就会自动调用该类的构造器。
## 6.4 内部类  
内部类的特点  
- 内部类可以访问其所在类的数据，包括私有数据  
- 内部类可以对同一个包的其他类隐藏起来  

回顾C++中的嵌套类  
C++中的嵌套类的特点是命名控制:比如LinkedList类中的Iterator类，访问该类的方法是：Linked::Iterator  

### 6.4.1 使用内部类访问对象状态  
内部类包含指向外围类对象的隐式引用，因此内部类除了可以访问自身的数据域，也可以访问创建它的外围类对象的数据域。  

内部类中的静态域必须是final的且内部类中不能有static方法  

### 6.4.2 局部内部类  
对于那些只在一个方法中使用的内部类，可以将内部类定义在方法中。局部类不能用public或private修饰，它的作用域被限定在了这个局部类的块中。  
局部类的优势：  
- 数据隐藏性好，除了它所定义的方法，没有方法知道内部类的存在  
- 内部类不仅能够访问外围类的数据还可以访问所在方法的局部变量。但是这些局部变量必须是final或者effectively final(虽然没有显式的声明为final常量，但是并没有被修改过)的。如果需要改变该局部变量可以使用一个trick：将该局部变量声明为长度为1的数组arr,改变arr[0]的值。  
```
public void func(){
    int index=1;
    class inner{
      public void fud(){
        index++; //局部变量需要是final的，错误
      }
    }
  }
```
```
public void func(){
    int[] index={1};
    class inner{
      public void fud(){
        index[0]++; //正确
      }
    }
  }
```  
### 6.4.3 匿名内部类  
匿名类的通常语法格式：  
```
SuperType superTypeInstance=new SuperType(construction parameters){
    inner class methods and data
}
```  
匿名类的作用：  
- 实现接口  
- 实现抽象类  
下面给出一个实现接口的例子  
```
public void start(int interval,boolean beep){

    ActionListener listener=new ActionListener(){
        public void actionPerformed(ActionEvent event){ //实现接口方法
            System.out.println("hello java");
        }
    }
    Timer t=new Timer(interval,listener);//填充接口实例
    t.start();
}
```  
匿名类实现抽象类本质上是继承了该抽象类。所以匿名类也可以称为其扩展的类的匿名子类。    

小结：填充接口实例的四种方法  
1. 使用实现了接口的类的实例  
2. 使用lamda表达式(前提是函数式接口)  
3. 匿名内部类  
4. 方法引用
下面介绍一种利用匿名内部类的技巧：**双括号初始化**  
在C++中可以使用vector<int>{1,2,3};这样的方法临时创建一个vector数组，Java中可以利用这个技巧达到同样的效果  
```
new ArrayList(){{add(1),add(2),add(3)}};
```  
再介绍一个在static方法中获得所在类的技巧  
正常情况下，由于static方法不包含this引用，因此无法调用getClass方法。可以通过内部匿名类解决这个问题  
```
new Object(){}.getClass().getEnclosingClass();
```
这里new Object(){}会建立一个Object的匿名子类的对象，getEnclosing得到其外围类，也就是包含这个静态方法的类。  
### 6.4.4 静态内部类  
可以将内部类声明为static，以便取消其包含的外围类的引用。静态内部类的对象除了没有对生成它的外围类对象的引用特权外，于其他所有内部类完全一样。  
那么使用静态内部类的优势在哪里呢？  
> 静态方法中无法构造非静态类的实例，因为静态方法中不包含this引用，而非静态实例要求this引用。  

因此静态内部类的优势在于：在静态方法中只能够构造静态内部类的实例  

与常规内部类不同，静态内部类可以有静态域和静态方法。  

# 第七章 异常、断言和日志  
## 7.1  处理错误  
### 7.1.1 异常分类  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200201174253.png)
Error类层次结构描述了Java的内部错误，RuntimeException描述了程序错误导致的异常(可以说如果出现RuntimeException，那么一定就是你的问题)。而程序本身本身没有问题，但由于IO错误导致的这类异常由IOEception描述。   
### 7.1.2 声明受检异常  
方法应该在其首部声明所有可能出现的受检异常(注意不包括unchecked exception)。  
```
public Image loadImage(String s)throws IOException,EOFException{

}
```  
> 为什么不声明unchecked exception？  
因为error是java内部错误，不可控制；runtime exception应该把重点放在避免其出现上而不是出现后的异常处理。  
### 7.1.3 如何抛出异常  
1. 在方法首部声明所有可能抛出的checked exception  (声明使用throws)   
2. 在出现异常的位置创建合适的异常类的实例并throw  (抛出使用throw)  
```
String func()throws EOFException{
    ...
    if(...){
        throw EOFException;
    }
    ...
}

子集规则：子类可传递的异常是超类的子集。假设超类有一个方法A，子类重写该方法，那么子类A方法throws的异常必须是超类A方法throws异常的子集。  
```
class Base{
    void func(){

    }
}
class Derived extends Base{
    void func() throws IOException{//错误

    }
}
```
```
### 7.1.4 创建异常类  
可以定义派生于已有异常类的自定义异常类  
```
class FileFormatException extends IOException{
    public FileFormatException(){}
    public FileFormatException(String s){
        super(s);
    }
}
```
## 7.2 捕获异常  
### 7.2.1 捕获异常  
异常有两种处理方式：捕获(catch)、传递(throws)  
当异常被throw出来后，如果有对应的catch代码块，会执行catch代码块中的内容。执行完毕后也不会返回，而会继续执行；而如果没有对应的catch代码块则会直接退出当前方法。  
**异常与捕获小结**：对于checkedException，使用异常传递，因为这不是方法创建者的锅，在方法首部声明throws，这样方法调用者就不得不处理这个异常，从而将锅甩给了方法调用者。对于UncheckedException，由于是方法创建者的锅，所以要编写catch代码块，在方法内部将异常捕获并处理，不能甩锅。  
一个例外：由于子集规则，如果超类方法没有throws异常，那么子类覆盖超类的方法就不得不catch所有异常，不能甩锅。  
### 7.2.2 捕获多个异常  
可以一次性捕获多个异常，使用|连接  
```
catch(AException|BException){

}  
```
捕获多个异常时，异常变量隐含为final变量。  
### 7.2.3 再次抛出异常  
在catch子句中可以抛出一个异常，目的是改变异常的类型。  
使用包装技术，可以改变异常类型，让用户抛出子系统中的高级异常，而不会丢失原始异常的细节。  
```
包装技术简而言之就是将内核异常作为包装异常的原因
catch(AException e){
    Throwable se=new BException;
    se.initCause(e);
    throw se;
}
在catch中再次throw会退出当前方法。
```  

### 7.2.4 finally子句  
finally子句跟在try块之后，不管是否有异常被捕获，finally子句中的代码都会被执行，在退出方法之前也会执行finally子句。因为finally子句的这种特性，它常用来关闭资源。  
当finally语句中包含return，常会出现意想不到的结果。  
```
public static int f(){
    try{
      return 1;      
    }
    finally{
      return 0;
    }
  }
```
当程序执行到return 0，检测到即将退出方法时，会执行finally子句中的内容。所以最终的结果是1.  

finally子句也可能带来麻烦。因为，清除资源的方法本身也可能抛出异常，这可能会掩盖原本要抛出的异常。  
```
try{

}
finally{
    in.close();//close方法本身可能抛出IOException，当出现这种情况时，原始的异常将会丢失，转而抛出close方法的异常。
}
```
问题的解决方法是资源try  
### 7.2.5 带资源的try语句  
对于实现了AutoCloseable接口的类，创建他们的资源后，无论try块是否正常退出，都会保证资源被关闭。  
资源try的语法：  
```
try(Resource res=new...){
    ...
}
```  
例如：  
```
try(Scanner in=new Scanner(System.in); PrintWriter out=new PrintWriter(System.out)){
    ...
    }
```  

不要过于细化异常  
把  
```
try{

}
catch{

}
try{

}
catch{

}
```
变成  
```
try{

}
catch{

}
catch{

}
```  
### 7.2.6 assert  
在IDEA中run->edit configurations 中输入-enableassertions或者-ea启用aseert断言。  
适用语法：  
aseert 相信为真的条件  
# 第八章 泛型程序设计  
## 8.1 定义简单的泛型类  
基本语法：  
```
public class ClassName <T>{//指定一个参数

}
public class ClassName<T,U>{//指定多个参数

}
```  
参数的命名规范：通常使用大写形式，且比较短，T,U,S等即可。  
## 8.2 泛型方法  
普通类也可以有泛型方法  
泛型方法定义的语法格式：<>写在返回值之前。   
```
public static <T> void func(T a); 
```
泛型方法调用的时候不需要显式指明参数的类型，如果需要显式指明必须在点操作符与方法名之间插入尖括号，然后把类型置于尖括号内。如果是static方法可以 类名.<Type> methodName。  
### 8.3 类型变量的限定  
相较于C++的模板，Java中的泛型可以限定参数类型。  
```
public static <T extends Comparable> T min(T[] arr)//限定T实现了Comparable接口
```
一个类型变量可以有多个限定，采用&分隔  
```
public static <T extends Comparable&Serializable> T min(T[] arr)//限定T实现了Comparable接口
```  
### 8.4 泛型代码和虚拟机  
### 8.4.1 类型擦除  
一个泛型类型，会对应一个原始类型(raw type)。原始类型的名字就是删去类型参数后的泛型名。擦除T，替换为**限定类型**(T可取的类型)。  
例如：
```  
Pair<T>{
    T first;
    T second;
}
```
它的原始类型：  
Pair{
    Object first;
    Object second;
}
Pair<T>的原始类型就是Pair。(注意不是Pair<Object>，**不要把原始类型和限定类型搞混**)  
再如：
```
public class Pair<T extends Comparable>{
    T first;
    T second;
}
```
它的原始类型：  
```
public class Pair{
    Comparbale first;
    Comparable second;
}

```
## 8.4.2 翻译泛型方法  
简而言之就是泛型方法在虚拟机中被翻译为原始方法+强制类型转换  
```
Pair<Employee> buddies=...;
Empolyee buddy=buddies.getFirst();
```
虚拟机中：  
- getFirst会被翻译为原始方法：Pair.getFirst()  
- 将返回的Object强制转换为Employee类型。  

## 8.4.3 类型擦除与多态冲突的解决  
```
public Base<T>{
    public void func(T arg){
        System.out.println("base");
    }
}
Public Derived<T> extends Base{
    pubic void func(T arg){
        System.out.println("derived");
    }
}

Base base=new Derived();
base.func(0);
```
由于是超类对象调用方法，在虚拟机中Base类func方法被类型擦除为func(Object arg)。于是现在有两个方法：超类中的func(Object arg)和子类中的func(int arg)。从类型擦除的来说，父类对象当然会调用父类方法，func(Object arg),输出base，从多态的角度考虑，应该输出derived。产生了冲突。
解决的方法是：bridge method  
编译器会在子类中生成一个bridge method  
```
public void func(Object arg){
    func((int)arg);
}
```
## 8.5 约束与局限性  
### 8.5.1 泛型不可以是基本类型  
例如没有Pair<int>,应该使用Pair<Integer>  
### 8.5.2 运行时类型查询只能查到原始类型  
对泛型的类型查询只产生原始类型，例如：  
```
Pair<String> a;
Pair<Integer> b;
if(a.getCass()==b.getClass()){//真，因为无论Pair<String>还是Pair<Integer>，他们的原始类型都是Pair。
    System.out.println(1);
}
```
为提醒这一风险，“a instanceof 泛型类型”会编译错误，"(泛型类型)a" [强制类型转换]会发出警告。  
### 8.5.3 不能创建泛型数组  
所谓泛型数组就是数组中的元素都是泛型的实例化
```
Pair<String>[]table =new Pair<String>[10];//错误，不能创建泛型数组。
```  
### 8.5.4  Varargs警告  
向参数可变的方法传递一个泛型类型的参数，会产生Varargs警告。因为参数可变方法的本质是就是创建一个数组，但是不能创建泛型数组。不过，对于这种情况，规则有所放松，只会得到Varargs警告。  
可以采用@SafeVarargs注解取消警告。  
### 8.5.5 不能实例化类型变量
通俗的说，就是不能new T,new T[],T.class  
1. 不能new T的解决办法  
让需要使用new T的方法接受**Supplier<T>**,这是一个函数式接口。  
```
public interface Supplier<T> {
    T get();
}
```
```
public Pair<T> makePair(Supplier<T> constr){
    retrun new Pair(constr.get(),constr.get());
}
//使用constr.get() 来代替new T(...)
```
2. 不能new T[]的解决办法  
让需要使用new T[]的方法接受**IntFunction<T[]>**,这是一个函数式接口  
```
public interface IntFunction<R> {
    R apply(int var1);
}
```  
```
public class user<T>{
    T[]x;
  public user(IntFunction<T[]> constr){
    x=constr.apply(10);
  }
}

调用：ArrayList<String> arr=new ArrayList<>(var->{return String[var];});
```  
> get和apply的区别就在于一个是无参的，一个是有参的。  

### 8.5.6 泛型类的静态上下文中类型变量无效  
static field 不可为泛型，static method，无论是返回值还是参数都不可为泛型。  
## 8.6 泛型的继承规则  
Pair<T>是一个泛型类，Base是超类，Derived是子类，Pair<Base>并不是Pair<Derived>的超类。事实上，他们两个没什么关系。  
## 8.7 通配符  
### 8.7.1. 通配符概念  
Pair<? extends A> 表示Pair<T>中的T可以是任何A的子类或者A本身。  
Pair<? super A> 表示Pair<T>中的T可以是任何A的超类或A本身。   

对通配符的理解：通配符本身提供了一种判断条件，判断实例化的参数类型是否合法。这也正是Java泛型的强大之处(可以对参数类型进行限制)  
<T extends Comparable<? extends T>> 表达的判断条件是：如果T或者T的超类中实现了compareTo方法，那么T就是合法的。  

# 第9章 容器  
接口：
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200206091027.png)  
类：  
![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200206091106.png)
## 9.1 Collection接口  
Collection是单值集合，其子类有List(有序，可重复)，Set(无序，不可重复)。  
### 9.1.1 与C++的不同  
C++中容器存储的是push进容器的元素的拷贝，而Java中存储的是push进容器的元素引用。所以修改容器内元素会导致容器外部对象数据也产生变化。  
注意：如果remove了容器中的元素，并不会一同销毁容器外的对象，因为只是销毁了该对象的一个引用而已，对对象本身没有影响。  
### 9.1.2 Collection接口的API  
```
add(E element)  
size()  
isEmpty()  
remove(E element) //注意如果有多个值为element的元素，只会删除一个。删除之后返回被删除的元素  
Object[] toArray()  
T[] toArray(T[] a)
bool contains(E element)
```  
> toArray如果不想得到Object数组而想得到具体的实例化类型的数组，可以使用T[] toArray(T[] a)方法。 如果传入的a长度小于容器长度，就会新创建一个拷贝数组并返回，如果传入的a长度足够用，就直接拷贝到a上并返回a。  
具体操作：  
```
String[] arr=co.toArray(new String[0]);
原理：传入的new String[0]长度如果小于原容器size，那么返回新拷贝的数组，用arr引用。如果大于等于，返回new String[0]被拷贝后的结果，依然用arr引用。
```  
### 9.1.3 Collection接口的All类API  
Collection接口的所有参数都是Colletion接口，因此任何实现了Collection接口的类的实例都可以作为All类API的参数。
```
 boolean containsAll(Collection<?> var1); //判断集合this是否包含集合var1
 boolean addAll(Collection<? extends E> var1); //将集合var1添加到集合this
 boolean removeAll(Collection<?> var1);  //移出集合this中所有出现在集合var1中的元素
 boolean retainAll(Collection<?> var1); //保留集合this中出现在集合var1中的元素，其余移除。 retainAll和removeAll是一对相反的操作
```  
解读All类API的参数：Collection<? extends E>包含两个可变性  
1. 类可变性：任何实现了Collection接口的类皆可  
2. 类型可变性：E或者E的子类皆可  

## 9.2 List接口  
List接口继承于Collection接口，因此上述方法在List中同样存在。下面讲的是List接口独有的方法。  
```
add(int index,E element) //重载add，在index位置添加E元素。
remove(int index) //重载remove，删除index位置元素  
set(int index,E element)  
get(int index)  
indexOf(Object var1) //返回var1第一次出现在集合中的索引，如果未出现返回-1
lastIndexOf(Object var1)  //返回var1最后一次出现在集合中的索引，如果未出现返回-1
```  
## 9.3 手写ArrayList类    
注意：  
- 容器中所有的比较操作都是equals而不是==   
- 建议使用Object[]作为ArrayList的底层存储结构而不是泛型数组，因为泛型数组还涉及到接口传递的问题，不便于动态扩容(因为动态扩容需要new T[],还需要传递IntFunction<T[]>接口)。  
- 数组拷贝：Systems.arraycopy(int o,int i1,int n,int i2,int len) //把o数组从i1开始，长度为len的一段拷贝到n数组从i2开始的位置。  

## 9.2 HashMap  
### 9.2.1 HashMap常用API  
```
put(k,v) //添加键值对
get(k) //查询键值对
remove(k) //删除键值对  
boolean containsKey(k) //是否包含键对象对应的键值对  
boolean containsValue(v) //是否包含值对象对应的键值对  
putAll(Map<? extends K, ? extends V> var1) //将var1全部添加到当前map中
```  
### 9.2.2 遍历HashMap  
HashMap的三个集合  
- .keySet()  key值的集合  
- .values() value值的集合  
- .entrySet() <k,v>对的集合  
Entry是Map接口的内部接口，使用Map.Entry访问。主要是使用Entry来进行遍历  

法一：  
```
Iterator it=hash.entrySet().iterator();
while(it.hasNext()){
    Map.Entry<Integer,String> node=(Map.Entry<Integer,String>)it.next();
    System.out.println(node.getKey());
```
法二(**推荐**)：  
```
for(Map.Entry<Integer,String> e:hash.entrySet()){
      System.out.println(e.getKey());
}
```
### 9.2.3 HashMap底层原理  
哈希表的底层实现结构：链表数组  
Node<K,V>[] table   

Node存储结构：  
```
static class Node<K, V> implements Entry<K, V> {
    final int hash;
    final K key;
    V value;
    HashMap.Node<K, V> next;
```

- 存储  
计算哈希值，放到对应哈希值的链表尾部  
- 查找  
计算哈希值,找到链表的头节点，然后使用key的equals方法依次比较，直到找到目标键值对。  
- 扩容问题  
如果table中的元素达到0.75*数组.length将进行数组的扩容，将数组调整为原来的两倍大小。在JDK8中，如果有链表的长度>8，将会将哈希表转换为红黑树。  

哈希值的算法有很多，JDK11使用的版本是:  
```
static final int hash(Object key) {
        int h;
        return key == null ? 0 : (h = key.hashCode()) ^ h >>> 16;
    }
```