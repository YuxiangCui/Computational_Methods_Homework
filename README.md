# Computational_Methods_Homework
Computational_Methods_Homework
#### 第一次作业 
##### 一、
编制分段埃尔米特三次差值程序，用于被插函数f(x)=5/(1+x2)。插值区间为[-5，5]，分成十等分，作分段插值多项式y=Hh(x)的图形，并与y=f(x)的图形比较 根据课本方法，求取插值奇函数参数，使得多项式H(x)在插值节点处满足函数值相等以及一阶导数相等的插值条件，从而解得最终的插值函数，并绘制图形代码如下
这里采用两种方法进行实现，一组为循环计算各插值节点的参数，最终求和，另一种直接调用matlab函数进行处理最终得到插值结果为
y=  
-0.0088*x^3 + 0.150*x^2 - 0.921*x + 2.134(4&lt;=x&lt;5)
-0.027*x^3 + 0.361*x^2 - 1.744*x + 3.206(3&lt;=x&lt;4)
-0.1*x^3 + x^2 - 3.6*x + 5.0(2&lt;=x&lt;3)
-0.3*x^3 + 2.2*x^2 - 6.0*x + 6.6(1&lt;=x&lt;2)
2.5*x^3 - 5.0*x^2 + 5.0(0&lt;= x&lt;1)
-2.5*x^3 - 5.0*x^2+5.0(-1&lt;=x&lt;0)
0.3*x^3 + 2.2*x^2 + 6.0*x + 6.6(-2&lt;= x&lt;-1)
0.1*x^3 + x^2 + 3.6*x + 5.0(-3&lt;=x &lt;-2)
0.027*x^3 + 0.361*x^2 + 1.744*x + 3.206(-4&lt;= x&lt;-3)
0.0088*x^3 + 0.150*x^2 + 0.921*x + 2.134(-5&lt;= x&lt;-4) 
对应的插值图像结果
![hermite_1.jpg](https://github.com/YuxiangCui/Computational_Methods_Homework/blob/master/homework_1/hermite_1.jpg)

![hermite_2.jpg](https://github.com/YuxiangCui/Computational_Methods_Homework/blob/master/homework_1/hermite_2.jpg)

上图左右分别为求各插值点参数方法与调用matlab函数求得的结果图其中蓝圈与黑色十字位置均为插值函数在插值节点对应的函数值所对应的点。由图可见，插值函数点与原函数曲线匹配较好，认为插值拟合效果好。         

##### 二、
对于三次样条插值的三弯矩方法，编制用于第一种和第二种边界条件的程序。 
xi0.250.300.390.450.53
yi0.50000.54770.62450.67080.7280
 第一种边界条件： s'(0.25)=1.0000, s'(0.53)=0.6868第二种边界条件： s"(0.25)=s"(0.53)=0分别用所编程序求解，输出各个插值节点的弯矩值{Mi}和插值中点的样条函数值，并做点列{xi,yi}和样条函数y=s(x)的图形  按照两种边界条件分别处理边界点处插值参数，其余非边界点处理方式相同。获得参数后求解三个弯矩值，从而带入三次样条插值多项式获得最终结果  
 （1）第一种边界条件： s'(0.25)=1.0000, s'(0.53)=0.6868  求得弯矩值[-2.0286  -1.4627  -1.0333  -0.8058  -0.6546]插值中点值[0.5244  0.5874  0.6481  0.7000]插值结果如下图所示，图中红圈为原插值点

![cubic_spline_1.jpg](https://github.com/YuxiangCui/Computational_Methods_Homework/blob/master/homework_1/cubic_spline_1.jpg)
 
 （2）第二种边界条件： s"(0.25)=s"(0.53)=0求得弯矩值[0  -1.8795  -0.8636  -1.0292  0]插值中点值[0.5241  0.5875  0.6481  0.6998]插值结果如下图所示，图中红圈为原插值点

![cubic_spline_2.jpg](https://github.com/YuxiangCui/Computational_Methods_Homework/blob/master/homework_1/cubic_spline_2.jpg)
 
