# MATLAB符号运算相关

- `syms` 可以用来定义多个符号变量

- 求导/求极限（**Octave**方式）：

  例：
  $$
  \lim _{x \rightarrow 5} 2x\\
  \frac{dy}{dx} = \lim_{x \rightarrow x_0} \frac{f(x) - f(x_0)}{x - x_0}
  $$
  

  ```matlab
  % 使用subs()函数（只考虑极限存在）
  syms x; % 也可以 x = sym('x');
  subs(2*x, x, 5) % 此处subs(syms, old, new)模式
  ```

  

- 求积分（**Octave**方式）:
  $$
  \int 2xdx \qquad , \qquad \int ^{\pi}_{-\pi} sinx dx
  $$
  

  ```matlab
  % 使用int()函数，分别表示不定积分与定积分
  % 不定积分表示的形式是最简形式(?)，就是不带公式里常量C的形式
  syms x;
  % ------------不定积分-----------------
  y = int(2*x);
  % -------------定积分------------------
  y = int(sin(x), -pi, pi);
  ```

  