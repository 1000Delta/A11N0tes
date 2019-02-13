# ES支持的数据类型

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

