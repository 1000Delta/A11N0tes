# MATLAB矩形波信号的傅里叶分析



##  建立模型(计算方法与思想) 

### 计算方法

建模原型为傅里叶级数（ $T$ 为周期）：
$$
f(x) = \frac{a_0}{2} + \sum_{n = 1}^{\infin} (a_n \cos \frac{2n \pi x}{T} + b_n \sin \frac{2n \pi x}{T}) \qquad (x \in C) \\
\text{其中：} \\
C =  \{x | f(x) = \frac1 2[f(x^-)+f(x^+)]\} \\
a_n = \frac 2 T \int_{-\frac T 2}^{\frac T 2} f(x)\cos \frac{2 n \pi x}{T} dx \qquad (n = 0, 1, 2, \cdots) \\
b_n = \frac 2 T \int_{-\frac T 2}^{\frac T 2} f(x)\sin \frac{2 n \pi x}{T} dx \qquad (n = 0, 1, 2, \cdots)
$$
对于奇函数，我们可以简化为：
$$
a_n = 0, \\
b_n = \frac 4 T \int_{0}^{\frac T 2}f(x) \cos \frac{2n \pi x}{T}dx \\
f(x) = \sum_{n = 1}^{\infin} b_n \sin \frac{2n \pi x}{T}
$$

若设矩形波函数中，$A$为振幅，$T$为周期：
$$
f(x) = \begin{cases}
A &(kT < x \le \frac{2k+1}{2} T), \\
-A &(\frac{2k+1}{2}T < x \le kT)
\end{cases};\qquad
(k \in N^+)
$$

由此，在MATLAB中，我们可以通过**符号计算**模拟傅里叶级数合成；

构想如下：

1. 简化计算$b_n$，即通过命令行模式先行计算出带参数的值，主要是构建函数式并使用`int()`函数进行定积分求解
2. 通过`for`循环结构迭代n次谐波（当n为偶数时$b_n$为0）
3. 确定参数值
4. 使用`subs()`函数进行数值求解
5. 使用`plot()`绘制函数图像

至此即可实现任意次谐波叠加（次数过高将会导致计算缓慢）



## **1.**     模块功能分析和源代码

### 模块分析

程序主要有以下模块：

- `FourierSynthesis(V, T, N)` 傅里叶合成函数
  - `f(x)` 待计算函数模块，为`FourierSynthesis()`的内部函数

`FourierSynthesis.m` 源代码如下：

```matlab
function [] = FourierSynthesis(V, T, N)
%FOURIERYSTHESIS 函数的傅里叶合成
%   此处显示详细说明
syms x fx n
% 设计矩形波函数f(x)为奇函数，因此仅有 [bn*sin(n*pi*x*2/T)] 项
bn = (4*sin((pi*n)/2)^2)/(n*pi);                
Fx = 0;
% 迭代构造Fx表达式
for i = 1:2:N                                     
    n = i;
    Fx = Fx + subs(bn)*subs(sin(2*pi*n/T*x));
end
% 确定时域取值范围为2个周期，并计算对应函数值数组
x = 0:T/200:2*T;
y = V.*subs(Fx);
y0 = f(x,T,V);
% 绘图
tl = sprintf('方波的%d次谐波傅里叶合成', n);
plot(x, y, x, y0);xlabel('时域(t)/s');ylabel('电压(U)/V');title(tl);
end

function [Y] = f(x,T,A)
Y = A.*(mod(x,T) <= T/2)-A.*(mod(x,T) > T/2);
end

```

执行流程如下：

1. 构造$b_n$符号表达式
2. 迭代拟合函数$F(x)$表达式
3. 代入参数计算表达式结果得到数值数组
4. 绘图

注意事项：

- 如果被分析的函数不再是**常函数**，需要在计算$b_n$前就带入被积表达式一同积分运算

### 实际运行主流程

```matlab

```



## 调试过程及结论

在实现n次谐波叠加的过程中，进行了多次尝试，首先是进行分析的过程，最初设计是使用标准的傅里叶级数展开式进行分解，但是发现首先是展开式过于复杂，而且我在编写过程中，由于对公式的不理解，代入的是以$2\pi$为周期的傅里叶级数，因此导致输出的值有误，之后经过查找资料和学习，加深了对傅里叶变换的理解，应用以$T$为周期的傅里叶级数展开式，最后得到了目前的数学模型。但是我又想到其实可以不用这么复杂，在电路课本上已经给出了方波进行傅里叶展开的简化形式，因此我又着手构建简化形式的模型。