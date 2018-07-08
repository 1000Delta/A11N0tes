# MATLAB语法技巧&注意事项

> 资料来源：
>
> [易百教程](https://www.yiibai.com/matlab/)

- 分号(`;`)表示结束语句。 但是，如果要抑制和**隐藏表达式的MATLAB输出**，请在表达式后添加分号。 

- 百分比符号(`%`)用于指示注释行，块注释运算符`%{`和`%}`用于编写一段注释。 

- MATLAB中每个变量都是**数组**或者**矩阵**

- 用`x:y`来创建一个从`x`到`y`的距离为1的一维数组

- 长任务通过使用省略号(`...`)扩展到另一行

- `format`控制屏幕显示格式
  - `format long `显示小数点后16位
  - `format short`默认格式，显示小数点后4位
  - `format bank`舍入到小数点后2位
  - `format [length] e`与长度格式搭配使用，以指数形式显示规定位数加上指数
  - `format rat`给出计算结果最接近的合理表达式，如**分数形式**等

- **分段函数**的表达：

  例：
  $$
  f(x) =\begin{cases}
  \space\space\space1, & kT & < x \leq& \frac{2k + 1}{2} T \\
  -1, & \frac{2k + 1}{2} T & < x \leq &kT 
  \end{cases}
  $$
  

  ```matlab
  function [y] = f(x) % 通过关系运算来取代决策结构确定y的表达式（在此处分别为1和-1）
  y = 1*(mod(x, T) <= T/2)-1*(mod(x, T) > T/2);
  end
  ```

  

