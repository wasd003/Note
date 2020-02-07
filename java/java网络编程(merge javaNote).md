# 基本概念  
IP 端口 url TCP/UDP  
IP可以理解为小区地址(电脑)，端口可以理解为小区里每个家庭的地址(每个软件占用一个端口)，每个软件内部拥有很多资源，每个资源占用唯一一个定位符：url。  
传输的连接需要基于协议(就好像人与人之间交流说的语言)，通常说的协议有TCP和UDP  
TCP是面向连接的，UDP是面向非连接的。TCP安全，但是效率低，需要一直保持连接，UDP正相反。  
## IP  
之前已经说过，IP定位计算机，端口定位软件，url定位软件中的资源  
IP用来表示互联网中的一个通信实体的地址。通信实体可以是计算机，路由器等。  

### InetAddress  
DNS:IP地址与域名的映射，无意义的数字串转换为有意义的域名  
InetAddress API
```
static InetAddress getLocalHost(); //返回本机InetAddress对象  
static InetAddress getByName(String hostName) //根据域名获得InetAddress对象(DNS解析)
static InetAddress getByName(String ipAddress)  //根据IP地址获得InetAddress对象
String getHostAddress()  //获得IP地址  
String getHostName()  //获得域名or计算机名
```    
## 端口  
端口有两个字节，0-65535，UDP与TCP的端口是独立的。同一个协议下，端口不能冲突。  
cmd命令  
```
netstat -ano 查看所有端口  
netstat -ano|findstr "port" 查看指定端口，可以看到占用该端口的进程的PID  
tasklist|findstr "PID" 查看PID对应的进程
```  

### InetSocketAddress  
该类实现IP套接字地址(IP地址+端口号)  
```
构造器：
InetSocketAddress(String hostName,int port); //给定域名和端口  
InetSocketAddress(InetAddress addr,int post); //实际操作中给定IP地址(String)和端口

int getPort() 获取端口号
InetAddress getAddress() //获取InetAddress对象,注意与getHostAddress区分。
```
例如：  
```
InetSocketAddress addr=new InetSocketAddress("localhost",8080);
```  

## URL  
universal resource locator 统一资源定位符  
统一资源定位符由四部分组成  
- 协议  
- 存放资源的主机域名  
- 端口号  
- 资源文件名  
比如：
```
http://www.google.com:80/index.html  
```
如果没写端口号默认是80。  
### URL类  
```
构造器:
URL(String protocol,String host,int port,String file);  
URL(String spec);//使用spec创建一个URL对象  

getProtocal() //获取协议  
getHost() //获取域名  
getPort() //获取端口  
getFile()  //获取资源(资源名称以及参数)  
getPath() //获取资源(只有资源名称)
getQuery() //获取参数  
getRef() //获取锚点
openStream(String url) //打开与这个url的链接
```

![](https://raw.githubusercontent.com/wasd003/my-picture-bed/master/20200205123904.png)  
## 爬虫原理  
InputStream类：用来从链接读取资源的输入流  

BufferReader类：另一种读取文件的方式  
```
BufferReader br=new BufferReader(new InputStreamReader(System.in));
br.readLine(); //eadLine()方法会返回用户在按下Enter键之前的所有字符输入,不包括最后按下的Enter返回字符.
读取之后记得 br.close();
```   

获取数据代码：
```
    URL url=new URL("https://www.jd.com");
    InputStream is=url.openStream(); //输入流
    BufferedReader br=new BufferedReader(new InputStreamReader(is,"UTF-8"));
    String msg=null;
    while((msg=br.readLine())!=null){
      System.out.println(msg);
    }
    br.close();
```  

小结：本节了解了InputStream，BufferReader，InputStreamReader类   
# TCP与UDP  
## UDP  
### DatagramPacket  
DatagramPacket是数据包类  
构造器：
- 接收方 
```
DatagramPacket(byte[] buf,int length) //构造一个DatagramPacket，用来接收长度为length的数据  
DatagramPacket(byte[] buf,int offset,int length) //构造一个DatagramPacket，从offset开始接受长度为length的数据
```
- 发送方  
```
DatagramPacket(byte[]buf,int offset,int length,InetAddress addr,int post)  //指定要发送的地址和端口  
DatagramPacket(byte[]buf,int offset,int length,SocketAddress addr)  //SocketAddress是InetSocketAddress的超类，实际操作中传一个InetSocketAddress的实例
这两个构造器都可以省略offset
```  
### DatagramSocket  
用于发送和接受数据的套接字  
构造器：  
```
DatagramSocket(int port)
DatagramSocket(int port,InetAddress addr)  //DatagramSocket构造时需要的端口与IP是接受时用的，对发送没有意义，发送的地址取决于数据包。
```

方法:  
```
void send(DatagramPacket pac);
void receive(DatagramPacket pac);
```
### 接收端  
1. 使用DatagramSocket，指定端口，创建接收端  
2. 封装DatagramPacket  
3. 阻塞式接收：receive(DatagramPacket pac)  
4. 分析数据  
    - getData()  
    - getLength()  
5. 释放资源  
### 发送端  
1. 使用DatagramSocket，指定端口，创建发送端  
2. 封装DatagramPacket  
3. 发送：send(DatagramPacket pac)    
4. 释放资源  

示例代码：  
接收端：  
```
public class UdpServer {
  //接受
  public static void main(String[] args) throws IOException {
    DatagramPacket pac=new DatagramPacket(new byte[60*1024],60*1024);
    DatagramSocket sock=new DatagramSocket(8888);
    sock.receive(pac);
    byte[] msg=pac.getData();
    System.out.println(new String(msg,0,pac.getLength())); //这个地方注意获得的数据长度是pac.getLength()不是msg.length
    //msg.length是数据包内含的字节数组的长度，不是实际数据的长度
    sock.close();
  }
}
```
发送端  
```
public class UdpClient {
  public static void main(String[] args) throws IOException {
    //发送
    String msg="123456";
    byte[] byteMsg=msg.getBytes();
    DatagramPacket pac=new DatagramPacket(byteMsg,byteMsg.length,new InetSocketAddress("localhost",8888));
    DatagramSocket sock=new DatagramSocket(9999);//这个9999没什么实际意义，发送的地址取决于数据包而不是套接字
    sock.send(pac);
    sock.close();
  }
}
```
### 数据格式转换
其他类型：基本类型，String，自定义对象，图片...
涉及到IO，日后再说  
- byte数组转其他类型  
    

- 其他类型转byte数组  
