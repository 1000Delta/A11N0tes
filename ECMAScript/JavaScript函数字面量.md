# JavaScript函数字面量

函数字面量又叫函数直接量，由以下四部分组成：

1. 关键词`fucnction`；必要
2. 函数名；可有可无
3. 括号以及函数参数；参数可有可无，但是括号不能少
4. 包裹在花括号内的语句块；即函数体；执行语句可有可无，但是花括号不能少

由以上四部分，可以知道，一个函数字面量的最简形式为：

```javascript
function () {}
```

但是，在JavaScript中，上述语句被解析为函数声明，会因为没有函数名而报语法错误，因此，要写成函数表达式：

```javascript
(function () {});
var a = function () {};
var obj = {fn: function () {}};  //没有见过的格式
```

在使用函数字面量定义函数时也可以写函数名，但是这里的函数名只对函数内部可见，在外部不可调用

```javascript
var a = function test() {console.log(test)}; // 可以调用

console.log(test); // 显示未定义
```

