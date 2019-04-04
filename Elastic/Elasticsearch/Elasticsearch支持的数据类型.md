# ES支持的数据类型

## 数据类型

- keyword : 如果数组中的值是**字符串**，最好使用keyword, 它不会对字符串进行分词
- date 支持的格式有：可以通过format定义日期的数据格式，也支持毫秒数
- boolean
- float
- double
- byte
- short
- integer
- long
- object
- nested : 嵌套对象, 用于数组中的元素是对象的[{}, {}]
  ip 即支持ipv4也支持ipv6
- completion

- binary

- geo-point： 支持经纬度存储和距离范围检索
- geo-shape：支持任意图形范围的检索，例如矩形和平面多边形

>来源：[CSDN](https://blog.csdn.net/vbirdbest/article/details/79213163)

详细介绍：http://www.cnblogs.com/xing901022/p/5471419.html

## Coerce 强制数据类型转换

因为JSON获取到的数据经过处理后可能是JSON数字，也可能是一个字符串，因此使用 Coercion 会尝试将脏数据清理使其符合相应的数据类型，例如：

- 字符串被强制转换为数字
- 浮点型被截断为整型

