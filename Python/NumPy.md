# NumPy库

## 安装

```shell
pip install numpy
```

如果python2和python3共存时安装到python3可能要使用`pip3`

## 引入

```python
import numpy as np
```

## 方法

> 此处函数仅函数名称准确，具体参数内容请查阅手册或者IDE函数参数提示

`numpy.array()`创建一个ndarray数组

`numpy.arange(n)` 创建一个包含n元素的NumPy数组，取值分别为0-n

## 向ndarray中添加元素

```python
p = np.concatenate((p, add)) # 函数输入为一个tuple，并且进行合并的数组必须同维度而且在非扩展轴上的长度相同
p = np.append(p, add)
```



