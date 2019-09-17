# Python数学相关

## math模块

math包主要处理数学相关的运算。math包定义了两个常数:

```python
math.e   # 自然常数e

math.pi  # 圆周率pi

math.ceil(x)`      # 对x向上取整

math.floor(x)      # 对x向下取整

math.pow(x,y)      # 指数运算，得到x的y次方

math.log(x)        # 对数，默认基底为e。可以使用base参数，来改变对数的基底。比如math.log(100,base=10)

math.sqrt(x)       # 平方根

# 三角函数: 

math.sin(x)
math.cos(x)
math.tan(x)

# 反三角函数

math.asin(x)
math.acos(x)
math.atan(x)

# 这些函数都接收一个弧度(radian)为单位的x作为参数。

# 角度和弧度互换: 

math.degrees(x)
math.radians(x)

# 双曲函数

math.sinh(x)
math.cosh(x)
math.tanh(x)
math.asinh(x)
math.acosh(x)
math.atanh(x)

# 特殊函数：

math.erf(x)
math.gamma(x)
```


## Python复数表示

> 1.虚数不能单独存在,它们总是和一个值为 0.0 的实数部分一起来构成一个复数。
2.复数由实数部分和虚数部分构成
3.表示虚数的语法: real+imgj
4.实数部分和虚数部分都是浮点数
5.虚数部分必须有后缀 j 或 J

### 格式

```python
(123+456j)
```

### 内置方法

```python
*.real      # 取实部
*.img       # 取虚部
*.conjugate # 共轭复数
```
