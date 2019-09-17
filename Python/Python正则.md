# Python 正则

```python
import re
```

## 匹配

### 单次匹配

#### 起始匹配

从字符串起始位置匹配一个模式, 如果**不是起始位置匹配成功**时, match()返回none

```python
re.match(pattern, string, flags=0)
```

- flags 标志位,	用于控制正则表达式的匹配方式

#### 全文搜索

扫描整个字符串并返回第一个成功的匹配

```python
re.search(pattern, string, flags=0)
```

### 匹配对象

正则匹配成功结果返回一个匹配的对象

#### 获取匹配表达式内容

```python
obj.group(num=0) # 匹配的整个表达式的字符串, 可以一次输入多个组号, 在这种情况下它将返回一个包含哪些组所对应值的元组
obj.groups() # 返回一个包含所有小组字符串的元组, 从1到所含的小组号
```

## 检索和替换

```python
re.sub(pattern, string, count=0, flags=0)
```

- `repl`: 替换的字符串, 也可为一个函数
- `count`: 模式匹配后替换的最大次数, 默认0表示替换所有的匹配

